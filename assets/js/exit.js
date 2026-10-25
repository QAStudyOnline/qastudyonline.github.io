// Exit-intent popup with A/B variants. Settings and variants: hugo.toml [params.exit].
// Desktop: the cursor leaves through the top edge. Mobile: a fast scroll up after the minimum scroll depth.
// delay_seconds: no popup earlier than this after load. cooldown_days > 0: at most once per N days; 0: on every page view
// until the user converts (clicks the CTA or submits any form — `converted` in localStorage).
// Variants are picked by weight among the enabled ones and stay the same for a user (stored in localStorage).
// Events: exit_popup_show / _click / _submit / _close, each with a `variant` parameter.
import * as params from '@params';
import { track } from './lib/track.js';

var cfg = params.exit || {};
var variants = cfg.variants || {};

(function () {
  if (!cfg.enabled) return;
  var KEY = 'qas_exit';
  // Test: ?exit=telegram | ?exit=minicourse shows that variant right away; ?exit=1 shows one right away;
  //       ?exit=reset clears the remembered state and behaves like a new visitor.
  var debug = new URLSearchParams(location.search).get('exit');
  if (debug === 'reset') { try { localStorage.removeItem(KEY); } catch (e) {} }
  var state = {};
  try { state = JSON.parse(localStorage.getItem(KEY) || '{}'); } catch (e) {}
  var now = Date.now(), day = 86400000;
  if (!debug || debug === 'reset') {
    if (cfg.cooldown_days > 0 && state.shownAt && now - state.shownAt < cfg.cooldown_days * day) return;
    if (state.converted) return;
  }

  function save(patch) { Object.assign(state, patch); try { localStorage.setItem(KEY, JSON.stringify(state)); } catch (e) {} }

  var pool = Object.keys(variants).filter(function (k) { return variants[k].enabled; });
  if (!pool.length) return;
  var variantKey = (debug && variants[debug]) ? debug : (state.variant && pool.indexOf(state.variant) !== -1) ? state.variant : (function () {
    var total = pool.reduce(function (s, k) { return s + (variants[k].weight || 1); }, 0);
    var r = Math.random() * total;
    for (var i = 0; i < pool.length; i++) { r -= variants[pool[i]].weight || 1; if (r <= 0) return pool[i]; }
    return pool[0];
  })();
  var v = variants[variantKey];

  var armed = false, shown = false;
  setTimeout(function () { armed = true; }, cfg.delay_seconds * 1000);
  if (debug && debug !== 'reset') { armed = true; setTimeout(show, 600); }

  // don't interrupt someone who is already converting
  document.addEventListener('focusin', function (e) { if (e.target.closest && e.target.closest('form')) armed = false; });
  document.addEventListener('submit', function () { save({ converted: true }); }, true);

  function show() {
    if (shown || !armed) return;
    if (document.querySelector('.modal:not([hidden]), .egg-panel')) return;
    shown = true;
    if (!debug) save({ shownAt: Date.now(), variant: variantKey });
    var el = document.createElement('div');
    el.className = 'exit-pop';
    el.setAttribute('role', 'dialog'); el.setAttribute('aria-modal', 'true'); el.setAttribute('aria-labelledby', 'exit-title');
    el.innerHTML =
      '<div class="exit-backdrop" data-exit-close></div>' +
      '<div class="exit-card glass">' +
        '<button class="exit-close" type="button" aria-label="Закрити" data-exit-close>×</button>' +
        '<p class="exit-kicker">' + v.kicker + '</p>' +
        '<h2 class="exit-title" id="exit-title">' + v.title + '</h2>' +
        '<p class="exit-text">' + v.text + '</p>' +
        (v.form
          ? '<form class="exit-form" novalidate><input type="email" name="email" required placeholder="name@company.com" autocomplete="email" aria-label="Email"><button class="btn btn-primary" type="submit">' + v.cta + ' <span class="arrow" aria-hidden="true">→</span></button><p class="exit-msg" role="status"></p></form>'
          : '<a class="btn btn-primary exit-cta" href="' + v.url + '"' + (/^https?:/.test(v.url) ? ' target="_blank" rel="noopener"' : '') + '>' + v.cta + ' <span class="arrow" aria-hidden="true">→</span></a>') +
        '<p class="exit-note">' + v.note + '</p>' +
      '</div>';
    document.body.appendChild(el);
    requestAnimationFrame(function () { el.classList.add('is-in'); });
    track('exit_popup_show', { variant: variantKey, page: location.pathname });

    el.querySelectorAll('[data-exit-close]').forEach(function (b) { b.addEventListener('click', function () { close('close'); }); });
    document.addEventListener('keydown', esc);
    var cta = el.querySelector('.exit-cta');
    if (cta) cta.addEventListener('click', function () {
      track('exit_popup_click', { variant: variantKey });
      save({ converted: true });
      if (cta.target !== '_blank') return;
      setTimeout(function () { close('click'); }, 300);
    });
    // Email variant (set `form = true` and `endpoint` on a variant in hugo.toml)
    var form = el.querySelector('.exit-form');
    if (form) form.addEventListener('submit', function (e) {
      e.preventDefault();
      var input = form.querySelector('input'), msg = form.querySelector('.exit-msg'), val = input.value.trim();
      var endpoint = v.endpoint || (params.forms && params.forms.endpoint) || '';
      if (!/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(val)) { msg.textContent = 'Схоже, це не email.'; return; }
      if (!endpoint) { msg.textContent = 'Ще не підключено. Напишіть у Telegram ' + (params.telegramHandle || '@qastudy') + '.'; return; }
      var data = new FormData(); data.append('email', val); data.append('intent', 'minicourse'); data.append('page', location.href);
      fetch(endpoint, { method: 'POST', body: data, headers: { Accept: 'application/json' } })
        .then(function (r) { if (!r.ok) throw 0; form.innerHTML = '<p class="exit-msg ok">Надіслали. Перевірте пошту.</p>'; save({ converted: true }); track('exit_popup_submit', { variant: variantKey }); })
        .catch(function () { msg.textContent = 'Не вийшло. Спробуйте ще раз.'; });
    });
    el.querySelector('.exit-close').focus();

    function esc(e) { if (e.key === 'Escape') close('esc'); }
    function close(how) {
      el.classList.remove('is-in');
      document.removeEventListener('keydown', esc);
      setTimeout(function () { el.remove(); }, 260);
      if (how !== 'click') track('exit_popup_close', { variant: variantKey, how: how });
    }
  }

  // desktop: cursor leaves through the top edge
  if (window.matchMedia('(pointer: fine)').matches) {
    document.addEventListener('mouseout', function (e) {
      if (!e.relatedTarget && e.clientY <= 0) show();
    });
  }
  // mobile: fast scroll up after reading part of the page
  var lastY = window.scrollY, lastT = now, maxPct = 0;
  window.addEventListener('scroll', function () {
    var total = document.documentElement.scrollHeight - window.innerHeight; if (total <= 0) return;
    var pct = window.scrollY / total * 100; if (pct > maxPct) maxPct = pct;
    var t = Date.now(), dy = lastY - window.scrollY, dt = t - lastT;
    if (maxPct >= cfg.min_scroll_percent_mobile && dy > 300 && dt < 400 && !window.matchMedia('(pointer: fine)').matches) show();
    lastY = window.scrollY; lastT = t;
  }, { passive: true });
})();
