/* QAStudy.online — пасхалки для QA
   1. Консоль як тест-репорт
   2. Форма відповідає на класичні проби (SQLi / XSS / null / test@test)
   3. Konami-код (↑↑↓↓←→←→ B A) → «QA View»: баг-анотації на сторінці + прихована знижка
   Налаштування — у EASTER_CONFIG. */
(function () {
  'use strict';

  var EASTER_CONFIG = {
    discountLabel: '−10% на будь-яку програму',   // TODO: підтвердити розмір знижки
    promoCode: 'EXPECTED_RESULT',                   // TODO: завести промокод у системі оплати
    promoValidNote: 'Назвіть код у заявці або в Telegram. Діє для першої групи після знахідки.',
    tgLink: 'https://t.me/qastudy'
  };

  function track(event, params) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push(Object.assign({ event: event }, params || {}));
  }

  /* ---------- 1. Console ---------- */
  try {
    var c1 = 'color:#8F84FF;font-weight:700;font-size:13px', c2 = 'color:#B3B0D6', c3 = 'color:#7CFFB2', c4 = 'color:#FF8A8A';
    console.log('%cQAStudy.online%c · test run finished', c1, c2);
    console.log('%c  ✓ 47 passed%c   ✗ 0 failed%c   ↷ 1 skipped', c3, c4, c2);
    console.log('%c  skipped: %chire_manager_who_thinks_QA_is_clicking_buttons', c2, 'color:#F3F2FF');
    console.log('%c  hint: %cна сторінці заховано 3 пасхалки. Одна з них — зі знижкою. Спробуйте зламати форму. Або згадайте код з приставки.', c2, 'color:#F3F2FF');
    console.log('%c  report bugs → %c' + EASTER_CONFIG.tgLink, c2, 'color:#8F84FF');
  } catch (e) {}

  /* ---------- 2. Form probes ---------- */
  var probes = [
    { re: /('|%27)\s*(or|and)\s+('?\d+'?\s*=\s*'?\d+'?|1\s*=\s*1)|--\s*$|;\s*drop\s+table|union\s+select/i,
      msg: 'Ін’єкцію помітили. Формі це не допоможе, а от в Agentic QA є цілий модуль про red teaming.' },
    { re: /<\s*script|javascript:|on\w+\s*=|<\s*img[^>]*onerror/i,
      msg: 'XSS не пройшов. Але спробу оцінили — це пасхалка №1 з трьох.' },
    { re: /^\s*(null|undefined|nan|none|nil)\s*$/i,
      msg: 'null не приймаємо. Ми ж не JavaScript.' },
    { re: /^\s*(test|qa|admin|user|asdf|qwerty|foo|bar)(\d*)@(test|example|mail|qa)\.(com|ua|org)\s*$/i,
      msg: 'Класичний тестовий контакт. Якщо це справжня адреса — вибачте, відповімо.' },
    { re: /^\s*\+?0{7,}\s*$|^\s*(1234567890|0987654321)\s*$/,
      msg: 'Boundary value помічено. Але відповісти на цей номер не вийде.' },
    { re: /[Ѐ-ӿ].*@|@.*[Ѐ-ӿ]/,
      msg: 'Кирилиця в email — гарний негативний кейс. Тут потрібен справжній контакт.' }
  ];
  window.qaEaster = {
    inputMessage: function (name, value) {
      if (!value) return null;
      for (var i = 0; i < probes.length; i++) {
        if (probes[i].re.test(value)) { track('easter_form_probe', { probe: i }); return probes[i].msg; }
      }
      if (value.length > 400 && (name === 'email' || name === 'telegram')) { track('easter_form_probe', { probe: 'long' }); return 'Довгий рядок — гарна перевірка на переповнення. Але 400+ символів для контакту забагато.'; }
      return null;
    }
  };

  /* ---------- 3. Konami → QA View ---------- */
  var KONAMI = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
  var pos = 0;
  document.addEventListener('keydown', function (e) {
    if (e.target && /INPUT|TEXTAREA|SELECT/.test(e.target.tagName)) return;
    var k = e.key.length === 1 ? e.key.toLowerCase() : e.key;
    if (k === KONAMI[pos]) { pos++; if (pos === KONAMI.length) { pos = 0; toggleQAView(); } }
    else pos = (k === KONAMI[0]) ? 1 : 0;
  });

  // Mobile: 5 tap on the brand logo
  var brand = document.querySelector('.site-header .brand');
  if (brand) {
    var taps = 0, tapTimer;
    brand.addEventListener('click', function (e) {
      taps++; clearTimeout(tapTimer);
      tapTimer = setTimeout(function () { taps = 0; }, 900);
      if (taps >= 5) { e.preventDefault(); taps = 0; toggleQAView(); }
    });
  }

  var ANNOTATIONS = [
    { sel: '.stamp', text: 'BUG-001 · Штамп повернуто на −8°. За макетом −7,5°. Дизайнер каже, що так живіше. Won’t fix.' },
    { sel: '.hero-title', text: 'BUG-002 · H1 містить англійське слово «Level». Локалізація неповна. By design.' },
    { sel: '.steps .step:first-child', text: 'BUG-003 · Картка рухається без дії користувача. Expected: статична. Actual: підморгує. By design.' },
    { sel: '.program-cta', text: 'BUG-004 · Гало кнопки 10px замість 8px за гайдлайном. Дизайнер наполягає.' },
    { sel: '.level-path li:last-child', text: 'BUG-005 · Останній рівень білий, решта сірі. Це не баг, це ціль.' },
    { sel: '#year', text: 'BUG-006 · Рік підставляє JS. Якщо бачите 2027 — вітаємо з Новим роком.' },
    { sel: '.faq-item[open]', text: 'BUG-007 · Перше питання відкрите за замовчуванням. Так, це навмисно.' },
    { sel: '.footer-legal li:first-child', text: 'BUG-008 · Знак © є, а патенту на QA Engineering немає. Working as intended.' }
  ];

  var qaViewOn = false, layer = null, panel = null;

  function toggleQAView() {
    qaViewOn ? closeQAView() : openQAView();
  }

  function openQAView() {
    qaViewOn = true;
    document.body.classList.add('qa-view');
    track('easter_konami');

    layer = document.createElement('div');
    layer.className = 'qa-layer';
    layer.setAttribute('aria-hidden', 'true');
    document.body.appendChild(layer);

    var n = 0;
    ANNOTATIONS.forEach(function (a) {
      var el = document.querySelector(a.sel);
      if (!el) return;
      n++;
      el.classList.add('qa-target');
      var tag = document.createElement('span');
      tag.className = 'qa-annot';
      tag.textContent = a.text;
      el.insertAdjacentElement('afterend', tag);
      if (getComputedStyle(el.parentElement).position === 'static') el.parentElement.classList.add('qa-rel');
    });

    panel = document.createElement('div');
    panel.className = 'egg-panel glass';
    panel.setAttribute('role', 'dialog');
    panel.setAttribute('aria-label', 'QA View');
    panel.innerHTML =
      '<button class="egg-close" type="button" aria-label="Закрити">×</button>' +
      '<p class="egg-kicker">QA View · test run passed</p>' +
      '<h2 class="egg-title">Ви знайшли те, чого <span>не мали бачити</span></h2>' +
      '<p class="egg-text">На сторінці підсвічено ' + n + ' «багів». Усі — Won’t fix. А ось це — fix:</p>' +
      '<div class="egg-discount"><span class="egg-label">' + EASTER_CONFIG.discountLabel + '</span><code class="egg-code" id="egg-code">' + EASTER_CONFIG.promoCode + '</code><button class="btn btn-primary egg-copy" type="button">Скопіювати код</button></div>' +
      '<p class="egg-note">' + EASTER_CONFIG.promoValidNote + '</p>' +
      '<p class="egg-note">Esc — вийти з QA View. Пасхалок на сторінці три: консоль, форма і ця.</p>';
    document.body.appendChild(panel);
    panel.querySelector('.egg-close').addEventListener('click', closeQAView);
    panel.querySelector('.egg-copy').addEventListener('click', function () {
      var btn = this;
      var done = function () { btn.textContent = 'Скопійовано ✓'; track('easter_promo_copied'); setTimeout(function () { btn.textContent = 'Скопіювати код'; }, 1800); };
      if (navigator.clipboard) navigator.clipboard.writeText(EASTER_CONFIG.promoCode).then(done, done); else done();
    });
    panel.querySelector('.egg-close').focus();
    document.addEventListener('keydown', escClose);
  }

  function escClose(e) { if (e.key === 'Escape') closeQAView(); }

  function closeQAView() {
    qaViewOn = false;
    document.body.classList.remove('qa-view');
    document.querySelectorAll('.qa-annot').forEach(function (t) { t.remove(); });
    document.querySelectorAll('.qa-target').forEach(function (t) { t.classList.remove('qa-target'); });
    document.querySelectorAll('.qa-rel').forEach(function (t) { t.classList.remove('qa-rel'); });
    if (layer) layer.remove();
    if (panel) panel.remove();
    document.removeEventListener('keydown', escClose);
  }

  /* ---------- Hint: "Known issues" in footer ---------- */
  var known = document.getElementById('known-issues');
  if (known) {
    known.addEventListener('click', function (e) {
      e.preventDefault();
      track('easter_hint_open');
      var box = document.getElementById('known-issues-box');
      if (!box) {
        box = document.createElement('div');
        box.id = 'known-issues-box';
        box.className = 'egg-panel glass';
        box.setAttribute('role', 'dialog');
        box.innerHTML =
          '<button class="egg-close" type="button" aria-label="Закрити">×</button>' +
          '<p class="egg-kicker">Known issues · 3 open</p>' +
          '<h2 class="egg-title">На цьому сайті є <span>баги</span>. Навмисні.</h2>' +
          '<ul class="egg-list">' +
          '<li><strong>ISSUE-1</strong> Консоль браузера виводить зайве.</li>' +
          '<li><strong>ISSUE-2</strong> Форма надто багато знає про негативні кейси. Спробуйте її зламати.</li>' +
          '<li><strong>ISSUE-3</strong> Сторінка реагує на код із старої приставки. Там заховано знижку.</li>' +
          '</ul>' +
          '<p class="egg-note">Знайшли всі три? Напишіть у <a href="' + EASTER_CONFIG.tgLink + '" target="_blank" rel="noopener">Telegram</a> — нам цікаво, скільки часу це зайняло.</p>';
        document.body.appendChild(box);
        box.querySelector('.egg-close').addEventListener('click', function () { box.remove(); });
        document.addEventListener('keydown', function h(ev) { if (ev.key === 'Escape') { box.remove(); document.removeEventListener('keydown', h); } });
        box.querySelector('.egg-close').focus();
      }
    });
  }
})();
