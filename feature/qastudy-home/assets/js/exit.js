/* QAStudy.online — exit-intent popup з A/B-варіантами.
   Десктоп: курсор виходить за верхню межу вікна. Мобільні: різкий скрол угору після 40% глибини.
   Показ не раніше delaySeconds після завантаження; cooldownDays > 0 — не частіше ніж раз на N днів, 0 — на кожному
   перегляді сторінки, доки користувач не натисне CTA або не надішле форму (converted у localStorage).
   Варіанти обираються за вагою серед enabled; вибір фіксується на cooldown, щоб один користувач бачив один варіант.
   Події: exit_popup_show / exit_popup_click / exit_popup_submit / exit_popup_close — з параметром variant. */
(function () {
  'use strict';

  // корінь сайту відносно поточної сторінки — обчислюється зі шляху цього скрипта (assets/js/exit.js)
  var SITE_ROOT = (function () {
    var src = document.currentScript && document.currentScript.getAttribute('src') || 'assets/js/exit.js';
    return src.replace(/assets\/js\/exit\.js.*$/, '');
  })();

  var EXIT_CONFIG = {
    enabled: true,
    delaySeconds: 10,
    cooldownDays: 0,            // 0 = показувати щоразу, доки користувач не натисне CTA / не надішле форму
    minScrollPercentMobile: 40,
    variants: {
      telegram: {
        enabled: true, weight: 1,
        kicker: 'Перш ніж піти',
        title: 'Практичні нотатки з QA — <span>у Telegram</span>',
        text: 'Ділимося робочими підходами з AI Quality, Performance і QA Architecture. Іноді філософствуємо про професію. Без реклами і щоденних розсилок.',
        cta: 'Підписатися на канал',
        url: 'https://t.me/qastudy',
        note: 'Канал відкритий, відписатися можна будь-коли.'
      },
      minicourse: {
        enabled: true, weight: 1,
        kicker: 'Перш ніж піти',
        title: 'Безкоштовний міні-курс <span>з тестування AI</span>',
        text: 'Три короткі уроки: як розкласти AI-систему на ризики, що таке evals і як побудувати перший quality gate.',
        cta: 'Відкрити міні-курс',
        url: SITE_ROOT + 'mini-course/',   // сторінка міні-курсу (поки заглушка)
        note: 'Безкоштовно, без реєстрації.'
      }
    }
  };

  if (!EXIT_CONFIG.enabled) return;
  var KEY = 'qas_exit';
  // Тест: ?exit=telegram | ?exit=minicourse — показати негайно потрібний варіант; ?exit=1 — показати негайно;
  //       ?exit=reset — скинути пам'ять (converted / variant) і працювати як для нового користувача.
  var debug = new URLSearchParams(location.search).get('exit');
  if (debug === 'reset') { try { localStorage.removeItem(KEY); } catch (e) {} }
  var state = {};
  try { state = JSON.parse(localStorage.getItem(KEY) || '{}'); } catch (e) {}
  var now = Date.now(), day = 86400000;
  if (!debug || debug === 'reset') {
    if (EXIT_CONFIG.cooldownDays > 0 && state.shownAt && now - state.shownAt < EXIT_CONFIG.cooldownDays * day) return;
    if (state.converted) return;
  }

  function track(event, params) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push(Object.assign({ event: event }, params || {}));
  }
  function save(patch) { Object.assign(state, patch); try { localStorage.setItem(KEY, JSON.stringify(state)); } catch (e) {} }

  // pick variant by weight (sticky within cooldown)
  var pool = Object.keys(EXIT_CONFIG.variants).filter(function (k) { return EXIT_CONFIG.variants[k].enabled; });
  if (!pool.length) return;
  var variantKey = (debug && EXIT_CONFIG.variants[debug]) ? debug : (state.variant && pool.indexOf(state.variant) !== -1) ? state.variant : (function () {
    var total = pool.reduce(function (s, k) { return s + (EXIT_CONFIG.variants[k].weight || 1); }, 0);
    var r = Math.random() * total;
    for (var i = 0; i < pool.length; i++) { r -= EXIT_CONFIG.variants[pool[i]].weight || 1; if (r <= 0) return pool[i]; }
    return pool[0];
  })();
  var v = EXIT_CONFIG.variants[variantKey];

  var armed = false, shown = false;
  setTimeout(function () { armed = true; }, EXIT_CONFIG.delaySeconds * 1000);
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
    if (cta) cta.addEventListener('click', function () { track('exit_popup_click', { variant: variantKey }); save({ converted: true }); if (cta.target !== '_blank') return; setTimeout(function () { close('click'); }, 300); });
    var form = el.querySelector('.exit-form');
    if (form) form.addEventListener('submit', function (e) {
      e.preventDefault();
      var input = form.querySelector('input'), msg = form.querySelector('.exit-msg'), val = input.value.trim();
      if (!/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(val)) { msg.textContent = 'Схоже, це не email.'; return; }
      if (v.endpoint.indexOf('FORM_ENDPOINT') !== -1) { msg.textContent = 'Ще не підключено. Напишіть у Telegram @qastudy.'; return; }
      var data = new FormData(); data.append('email', val); data.append('intent', 'minicourse'); data.append('page', location.href);
      fetch(v.endpoint, { method: 'POST', body: data, headers: { Accept: 'application/json' } })
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
  var lastY = scrollY, lastT = now, maxPct = 0;
  window.addEventListener('scroll', function () {
    var total = document.documentElement.scrollHeight - innerHeight; if (total <= 0) return;
    var pct = scrollY / total * 100; if (pct > maxPct) maxPct = pct;
    var t = Date.now(), dy = lastY - scrollY, dt = t - lastT;
    if (maxPct >= EXIT_CONFIG.minScrollPercentMobile && dy > 300 && dt < 400 && !window.matchMedia('(pointer: fine)').matches) show();
    lastY = scrollY; lastT = t;
  }, { passive: true });
})();
