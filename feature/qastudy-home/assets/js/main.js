/* QAStudy.online — Home
   Header/burger, reveal-on-scroll, active nav, FAQ analytics, contact modal + Formspree, analytics events.
   All events are pushed to window.dataLayer (GA4 / GTM). */
(function () {
  'use strict';

  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ---------- Analytics ---------- */
  function track(event, params) {
    var payload = Object.assign({ event: event }, params || {});
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push(payload);
    if (typeof window.gtag === 'function') window.gtag('event', event, params || {});
  }

  document.addEventListener('click', function (e) {
    var el = e.target.closest('[data-event]');
    if (!el) return;
    var params = {};
    if (el.dataset.network) params.network = el.dataset.network;
    if (el.href) params.link_url = el.href;
    track(el.dataset.event, params);
  });

  // Scroll depth 25/50/75/90
  var depths = [25, 50, 75, 90];
  var fired = {};
  function onScrollDepth() {
    var doc = document.documentElement;
    var total = doc.scrollHeight - window.innerHeight;
    if (total <= 0) return;
    var pct = Math.round((window.scrollY / total) * 100);
    depths.forEach(function (d) {
      if (pct >= d && !fired[d]) { fired[d] = true; track('scroll_depth', { percent: d }); }
    });
  }
  window.addEventListener('scroll', onScrollDepth, { passive: true });

  // Section visibility
  var sections = document.querySelectorAll('main section[id]');
  var navLinks = document.querySelectorAll('.nav-list a[href^="#"]');
  if ('IntersectionObserver' in window) {
    var seen = {};
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        var id = entry.target.id;
        if (!seen[id]) { seen[id] = true; track('section_view', { section: id }); }
        navLinks.forEach(function (a) {
          var current = a.getAttribute('href') === '#' + id;
          if (current) a.setAttribute('aria-current', 'true'); else a.removeAttribute('aria-current');
        });
      });
    }, { rootMargin: '-40% 0px -50% 0px', threshold: 0 });
    sections.forEach(function (s) { io.observe(s); });
  }

  /* ---------- Reveal on scroll ---------- */
  var reveals = document.querySelectorAll('.reveal');
  if (reduceMotion || !('IntersectionObserver' in window)) {
    reveals.forEach(function (el) { el.classList.add('is-visible'); });
  } else {
    var rio = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) { entry.target.classList.add('is-visible'); rio.unobserve(entry.target); }
      });
    }, { rootMargin: '0px 0px -8% 0px', threshold: 0.05 });
    reveals.forEach(function (el) { rio.observe(el); });
    // Safety net: never leave content hidden (hash navigation, IO quirks, print)
    function revealAll() { reveals.forEach(function (el) { el.classList.add('is-visible'); }); }
    setTimeout(revealAll, 3000);
    window.addEventListener('hashchange', revealAll);
    window.addEventListener('beforeprint', revealAll);
    if (location.hash) revealAll();
  }

  /* ---------- Burger / mobile nav ---------- */
  var burger = document.getElementById('burger');
  var nav = document.getElementById('site-nav');
  function setNav(open) {
    nav.classList.toggle('is-open', open);
    document.body.classList.toggle('nav-open', open);
    burger.setAttribute('aria-expanded', String(open));
    burger.setAttribute('aria-label', open ? 'Закрити меню' : 'Відкрити меню');
    if (open) {
      var first = nav.querySelector('a');
      if (first) first.focus();
    }
  }
  burger.addEventListener('click', function () { setNav(!nav.classList.contains('is-open')); });
  nav.addEventListener('click', function (e) { if (e.target.closest('a')) setNav(false); });
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && nav.classList.contains('is-open')) { setNav(false); burger.focus(); }
  });
  // focus trap in mobile nav
  nav.addEventListener('keydown', function (e) {
    if (e.key !== 'Tab' || !nav.classList.contains('is-open')) return;
    var focusables = nav.querySelectorAll('a, button');
    var first = focusables[0], last = focusables[focusables.length - 1];
    if (e.shiftKey && document.activeElement === first) { e.preventDefault(); burger.focus(); }
    else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); burger.focus(); }
  });
  window.matchMedia('(min-width: 1024px)').addEventListener('change', function (m) { if (m.matches) setNav(false); });

  /* ---------- FAQ analytics ---------- */
  document.querySelectorAll('.faq-item').forEach(function (d) {
    d.addEventListener('toggle', function () {
      if (d.open) track('faq_open', { question: d.querySelector('.faq-q').textContent.trim() });
    });
  });

  /* ---------- Contact modal ---------- */
  var modal = document.getElementById('contact-modal');
  var panel = modal.querySelector('.modal-panel');
  var form = document.getElementById('contact-form');
  var success = document.getElementById('form-success');
  var status = document.getElementById('form-status');
  var submitBtn = document.getElementById('form-submit');
  var lastFocus = null;
  var formStarted = false;

  function openForm(trigger) {
    lastFocus = trigger || document.activeElement;
    modal.hidden = false;
    document.body.classList.add('nav-open');
    var first = form.querySelector('input:not([type=hidden])');
    if (first && !form.hidden) first.focus(); else panel.focus();
  }
  function closeForm() {
    modal.hidden = true;
    document.body.classList.remove('nav-open');
    if (lastFocus) lastFocus.focus();
  }
  document.querySelectorAll('[data-open-form]').forEach(function (el) {
    el.addEventListener('click', function (e) { e.preventDefault(); openForm(el); });
  });
  modal.querySelectorAll('[data-close-form]').forEach(function (el) { el.addEventListener('click', closeForm); });
  document.addEventListener('keydown', function (e) {
    if (modal.hidden) return;
    if (e.key === 'Escape') { closeForm(); return; }
    if (e.key === 'Tab') {
      var f = panel.querySelectorAll('a[href], button:not([disabled]), input:not([type=hidden]):not([tabindex="-1"]), select, textarea');
      var first = f[0], last = f[f.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    }
  });

  // Hidden tracking fields: page, UTM, referrer
  (function fillHidden() {
    var utmKeys = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_content', 'utm_term'];
    var params = new URLSearchParams(location.search);
    var utm = {};
    var stored = null;
    try { stored = JSON.parse(sessionStorage.getItem('qas_utm') || 'null'); } catch (e) {}
    utmKeys.forEach(function (k) { if (params.get(k)) utm[k] = params.get(k); });
    if (Object.keys(utm).length) { try { sessionStorage.setItem('qas_utm', JSON.stringify(utm)); } catch (e) {} }
    else if (stored) utm = stored;
    document.getElementById('f-page').value = location.href;
    document.getElementById('f-utm').value = Object.keys(utm).map(function (k) { return k + '=' + utm[k]; }).join('&');
    document.getElementById('f-referrer').value = document.referrer || '';
  })();

  /* ---------- Validation ---------- */
  var messages = {
    telegram: 'Вкажіть Telegram-нік.',
    phone: 'Вкажіть номер телефону.',
    email: 'Вкажіть email.',
    role: 'Оберіть поточну роль.',
    message: 'Коротко опишіть задачу.'
  };
  function fieldError(input, msg) {
    var err = document.getElementById(input.id + '-err');
    input.classList.toggle('invalid', !!msg);
    input.setAttribute('aria-invalid', msg ? 'true' : 'false');
    if (err) err.textContent = msg || '';
  }
  function validateField(input) {
    var v = input.value.trim();
    if (input.required && !v) { fieldError(input, messages[input.name] || 'Обов’язкове поле.'); return false; }
    var egg = window.qaEaster && window.qaEaster.inputMessage(input.name, v);
    if (egg) { fieldError(input, egg); return false; }
    if (input.name === 'telegram' && v && !(/^@?[a-zA-Z0-9_]{5,32}$/.test(v) || /^(https?:\/\/)?t\.me\/[a-zA-Z0-9_]{5,32}$/.test(v))) { fieldError(input, 'Схоже, це не Telegram-нік. Формат: @username'); return false; }
    if (input.name === 'email' && v && !/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(v)) { fieldError(input, 'Схоже, це не email.'); return false; }
    if (input.name === 'phone' && v && !/^\+?[\d\s().-]{9,18}$/.test(v)) { fieldError(input, 'Схоже, це не номер телефону.'); return false; }
    fieldError(input, '');
    return true;
  }
  form.querySelectorAll('input:not([type=hidden]), select, textarea').forEach(function (input) {
    if (input.name === '_gotcha') return;
    input.addEventListener('focus', function () {
      if (!formStarted) { formStarted = true; track('form_start'); }
    });
    input.addEventListener('blur', function () { validateField(input); });
    input.addEventListener('input', function () { if (input.classList.contains('invalid')) validateField(input); });
  });

  /* ---------- Submit (Formspree, AJAX) ---------- */
  form.addEventListener('submit', function (e) {
    e.preventDefault();
    status.textContent = '';
    var valid = true, firstInvalid = null;
    form.querySelectorAll('input[required], select[required], textarea[required]').forEach(function (input) {
      if (!validateField(input)) { valid = false; if (!firstInvalid) firstInvalid = input; }
    });
    if (!valid) { firstInvalid.focus(); track('form_error', { type: 'validation' }); return; }

    if (form.action.indexOf('FORM_ENDPOINT') !== -1) {
      status.textContent = 'Форма ще не підключена до Formspree. Напишіть нам у Telegram.';
      track('form_error', { type: 'not_configured' });
      return;
    }

    submitBtn.disabled = true;
    submitBtn.classList.add('is-submitting');
    fetch(form.action, {
      method: 'POST',
      body: new FormData(form),
      headers: { 'Accept': 'application/json' }
    }).then(function (res) {
      if (!res.ok) throw new Error('HTTP ' + res.status);
      form.hidden = true;
      success.hidden = false;
      success.querySelector('.h4').focus && success.querySelector('.h4').setAttribute('tabindex', '-1');
      success.querySelector('.h4').focus();
      track('form_submit', { role: form.role ? form.role.value : '' });
    }).catch(function () {
      status.textContent = 'Не вдалося надіслати. Спробуйте ще раз або напишіть у Telegram: @qastudy.';
      track('form_error', { type: 'server' });
    }).finally(function () {
      submitBtn.disabled = false;
      submitBtn.classList.remove('is-submitting');
    });
  });

  /* ---------- Flip cards (Як навчаємо) ---------- */
  document.querySelectorAll('.step').forEach(function (step) {
    var touch = function () { step.classList.add('was-touched'); };
    step.addEventListener('mouseenter', touch, { once: true });
    step.addEventListener('focus', touch, { once: true });
    step.addEventListener('click', function () { step.classList.toggle('is-flipped'); touch(); });
    step.addEventListener('keydown', function (e) { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); step.classList.toggle('is-flipped'); } });
  });

  /* ---------- Waitlist: «Повідомити про старт» ---------- */
  var WAITLIST_ENDPOINT = 'https://formspree.io/f/FORM_ENDPOINT'; // той самий або окремий Formspree
  document.querySelectorAll('.waitlist-toggle').forEach(function (btn) {
    var f = btn.closest('.program-status-wrap').querySelector('.waitlist');
    btn.addEventListener('click', function () {
      var open = f.hidden;
      f.hidden = !open;
      btn.setAttribute('aria-expanded', String(open));
      if (open) f.querySelector('input').focus();
    });
  });
  document.querySelectorAll('.waitlist').forEach(function (f) {
    var msg = f.querySelector('.waitlist-msg'), input = f.querySelector('input');
    f.addEventListener('submit', function (e) {
      e.preventDefault();
      var v = input.value.trim();
      var ok = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(v) || /^@?[a-zA-Z0-9_]{5,32}$/.test(v);
      msg.className = 'waitlist-msg';
      if (!ok) { msg.textContent = 'Потрібен email або Telegram-нік.'; msg.classList.add('err'); return; }
      if (WAITLIST_ENDPOINT.indexOf('FORM_ENDPOINT') !== -1) { msg.textContent = 'Ще не підключено. Напишіть нам у Telegram — додамо в список.'; msg.classList.add('err'); return; }
      var data = new FormData(); data.append('contact', v); data.append('course', f.dataset.course); data.append('intent', 'waitlist'); data.append('page', location.href);
      fetch(WAITLIST_ENDPOINT, { method: 'POST', body: data, headers: { Accept: 'application/json' } })
        .then(function (r) { if (!r.ok) throw 0; f.classList.add('is-done'); msg.textContent = 'Записали. Повідомимо першим, коли відкриємо набір.'; msg.classList.add('ok'); track('waitlist_submit', { course: f.dataset.course }); })
        .catch(function () { msg.textContent = 'Не вийшло. Напишіть нам у Telegram.'; msg.classList.add('err'); });
    });
  });

  /* ---------- Program cards: whole card is clickable ---------- */
  document.querySelectorAll('.program[data-href]').forEach(function (card) {
    card.addEventListener('click', function (e) {
      if (e.target.closest('a, button, input, form, label')) return;
      track('program_card_click', { course: card.id });
      location.href = card.dataset.href;
    });
  });
  function highlightTarget() {
    var t = location.hash && document.querySelector(location.hash + '.program');
    document.querySelectorAll('.program.is-target').forEach(function (p) { p.classList.remove('is-target'); });
    if (t) { t.classList.add('is-target'); setTimeout(function () { t.classList.remove('is-target'); }, 2200); }
  }
  window.addEventListener('hashchange', highlightTarget); highlightTarget();

  /* ---------- Misc ---------- */
  var year = document.getElementById('year');
  if (year) year.textContent = String(new Date().getFullYear());
})();
