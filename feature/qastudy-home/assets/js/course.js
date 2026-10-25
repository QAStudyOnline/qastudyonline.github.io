/* QAStudy.online — course page: burger, reveal, accordion, sticky CTA, inline Formspree form, analytics */
(function () {
  'use strict';
  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  function track(event, params) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push(Object.assign({ event: event }, params || {}));
    if (typeof window.gtag === 'function') window.gtag('event', event, params || {});
  }
  document.addEventListener('click', function (e) {
    var el = e.target.closest('[data-event]');
    if (!el) return;
    var p = {};
    if (el.dataset.place) p.place = el.dataset.place;
    if (el.href) p.link_url = el.href;
    track(el.dataset.event, p);
  });

  /* ---------- Reveal ---------- */
  var reveals = document.querySelectorAll('.reveal');
  function revealAll() { reveals.forEach(function (el) { el.classList.add('is-visible'); }); }
  if (reduceMotion || !('IntersectionObserver' in window)) revealAll();
  else {
    var rio = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) { if (en.isIntersecting) { en.target.classList.add('is-visible'); rio.unobserve(en.target); } });
    }, { rootMargin: '0px 0px -8% 0px', threshold: 0.05 });
    reveals.forEach(function (el) { rio.observe(el); });
    setTimeout(revealAll, 3000);
    window.addEventListener('hashchange', revealAll);
    if (location.hash) revealAll();
  }

  /* ---------- Burger ---------- */
  var burger = document.getElementById('burger'), nav = document.getElementById('site-nav');
  function setNav(open) {
    nav.classList.toggle('is-open', open);
    document.body.classList.toggle('nav-open', open);
    burger.setAttribute('aria-expanded', String(open));
  }
  burger.addEventListener('click', function () { setNav(!nav.classList.contains('is-open')); });
  nav.addEventListener('click', function (e) { if (e.target.closest('a')) setNav(false); });
  document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && nav.classList.contains('is-open')) { setNav(false); burger.focus(); } });

  /* ---------- Active nav ---------- */
  var navLinks = document.querySelectorAll('.nav-list a[href^="#"]');
  if ('IntersectionObserver' in window) {
    var seen = {};
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (!en.isIntersecting) return;
        var id = en.target.id;
        if (!seen[id]) { seen[id] = true; track('section_view', { section: id }); }
        navLinks.forEach(function (a) { a.getAttribute('href') === '#' + id ? a.setAttribute('aria-current', 'true') : a.removeAttribute('aria-current'); });
      });
    }, { rootMargin: '-40% 0px -50% 0px' });
    document.querySelectorAll('main section[id]').forEach(function (s) { io.observe(s); });
  }

  /* ---------- Program accordion ---------- */
  var modules = document.querySelectorAll('.module');
  modules.forEach(function (m) {
    m.addEventListener('toggle', function () {
      if (m.open) track('program_module_open', { module: m.querySelector('.module-title').textContent.trim() });
      syncToggleAll();
    });
  });
  var toggleAll = document.getElementById('toggle-all');
  function syncToggleAll() {
    if (!toggleAll) return;
    var allOpen = Array.prototype.every.call(modules, function (m) { return m.open; });
    toggleAll.textContent = allOpen ? toggleAll.dataset.close : toggleAll.dataset.open;
  }
  if (toggleAll) {
    toggleAll.addEventListener('click', function () {
      var allOpen = Array.prototype.every.call(modules, function (m) { return m.open; });
      modules.forEach(function (m) { m.open = !allOpen; });
      track(allOpen ? 'program_collapse_all' : 'program_expand_all');
      syncToggleAll();
    });
  }
  document.querySelectorAll('.faq-item').forEach(function (d) {
    d.addEventListener('toggle', function () { if (d.open) track('faq_open', { question: d.querySelector('.faq-q').textContent.trim() }); });
  });

  /* ---------- Sticky CTA ---------- */
  var sticky = document.getElementById('sticky-cta'), hero = document.getElementById('hero'), apply = document.getElementById('apply');
  if (sticky && hero && 'IntersectionObserver' in window) {
    var heroVisible = true, applyVisible = false;
    function updateSticky() {
      var show = !heroVisible && !applyVisible;
      sticky.hidden = false;
      sticky.classList.toggle('is-shown', show);
      document.body.classList.toggle('has-sticky', show);
    }
    new IntersectionObserver(function (en) { heroVisible = en[0].isIntersecting; updateSticky(); }, { threshold: 0.1 }).observe(hero);
    if (apply) new IntersectionObserver(function (en) { applyVisible = en[0].isIntersecting; updateSticky(); }, { threshold: 0.15 }).observe(apply);
  }

  /* ---------- Scroll depth ---------- */
  var depths = [25, 50, 75, 90], fired = {};
  window.addEventListener('scroll', function () {
    var total = document.documentElement.scrollHeight - innerHeight; if (total <= 0) return;
    var pct = Math.round(scrollY / total * 100);
    depths.forEach(function (d) { if (pct >= d && !fired[d]) { fired[d] = true; track('scroll_depth', { percent: d }); } });
  }, { passive: true });

  /* ---------- Form ---------- */
  var form = document.getElementById('contact-form'), success = document.getElementById('form-success'), status = document.getElementById('form-status'), submitBtn = document.getElementById('form-submit');
  if (form) {
    (function fillHidden() {
      var keys = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_content', 'utm_term'], params = new URLSearchParams(location.search), utm = {}, stored = null;
      try { stored = JSON.parse(sessionStorage.getItem('qas_utm') || 'null'); } catch (e) {}
      keys.forEach(function (k) { if (params.get(k)) utm[k] = params.get(k); });
      if (Object.keys(utm).length) { try { sessionStorage.setItem('qas_utm', JSON.stringify(utm)); } catch (e) {} } else if (stored) utm = stored;
      document.getElementById('f-page').value = location.href;
      document.getElementById('f-utm').value = Object.keys(utm).map(function (k) { return k + '=' + utm[k]; }).join('&');
      document.getElementById('f-referrer').value = document.referrer || '';
    })();

    var messages = { telegram: 'Вкажіть Telegram-нік.', phone: 'Вкажіть номер телефону.', email: 'Вкажіть email.', role: 'Оберіть поточну роль.' };
    var started = false;
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
      fieldError(input, ''); return true;
    }
    form.querySelectorAll('input:not([type=hidden]), select, textarea').forEach(function (input) {
      if (input.name === '_gotcha') return;
      input.addEventListener('focus', function () { if (!started) { started = true; track('form_start', { form: 'course' }); } });
      input.addEventListener('blur', function () { validateField(input); });
      input.addEventListener('input', function () { if (input.classList.contains('invalid')) validateField(input); });
    });
    form.addEventListener('submit', function (e) {
      e.preventDefault(); status.textContent = '';
      var valid = true, first = null;
      form.querySelectorAll('[required]').forEach(function (i) { if (!validateField(i)) { valid = false; first = first || i; } });
      if (!valid) { first.focus(); track('form_error', { type: 'validation' }); return; }
      if (form.action.indexOf('FORM_ENDPOINT') !== -1) { status.textContent = 'Форма ще не підключена до Formspree. Напишіть нам у Telegram: @qastudy.'; track('form_error', { type: 'not_configured' }); return; }
      submitBtn.disabled = true; submitBtn.classList.add('is-submitting');
      fetch(form.action, { method: 'POST', body: new FormData(form), headers: { Accept: 'application/json' } })
        .then(function (r) { if (!r.ok) throw new Error(r.status); form.hidden = true; success.hidden = false; success.setAttribute('tabindex', '-1'); success.focus(); track('form_submit', { form: 'course', role: form.role.value }); })
        .catch(function () { status.textContent = 'Не вдалося надіслати. Спробуйте ще раз або напишіть у Telegram: @qastudy.'; track('form_error', { type: 'server' }); })
        .finally(function () { submitBtn.disabled = false; submitBtn.classList.remove('is-submitting'); });
    });
  }

  var year = document.getElementById('year'); if (year) year.textContent = String(new Date().getFullYear());
})();
