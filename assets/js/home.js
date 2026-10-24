// Home page entry: shared behaviour + contact modal, flip cards, waitlist, clickable program cards.
import * as params from '@params';
import { initSite } from './lib/site.js';
import { track } from './lib/track.js';
import { initModal } from './lib/modal.js';
import { initForm } from './lib/forms.js';
import './easter.js';
import './exit.js';

initSite();
initModal();
var contactForm = document.getElementById('contact-form');
if (contactForm) initForm(contactForm, 'home');

/* Flip cards (Як навчаємо): hover / click / Enter */
document.querySelectorAll('.step').forEach(function (step) {
  var touch = function () { step.classList.add('was-touched'); };
  step.addEventListener('mouseenter', touch, { once: true });
  step.addEventListener('focus', touch, { once: true });
  step.addEventListener('click', function () { step.classList.toggle('is-flipped'); touch(); });
  step.addEventListener('keydown', function (e) {
    if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); step.classList.toggle('is-flipped'); }
  });
});

/* Waitlist: «Повідомити про старт» on programs that are not open yet */
var WAITLIST_ENDPOINT = (params.forms && (params.forms.waitlist_endpoint || params.forms.endpoint)) || '';
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
    if (!WAITLIST_ENDPOINT) { msg.textContent = 'Ще не підключено. Напишіть нам у Telegram — додамо в список.'; msg.classList.add('err'); return; }
    var data = new FormData();
    data.append('contact', v); data.append('course', f.dataset.course); data.append('intent', 'waitlist'); data.append('page', location.href);
    fetch(WAITLIST_ENDPOINT, { method: 'POST', body: data, headers: { Accept: 'application/json' } })
      .then(function (r) {
        if (!r.ok) throw 0;
        f.classList.add('is-done');
        msg.textContent = 'Записали. Повідомимо першим, коли відкриємо набір.';
        msg.classList.add('ok');
        track('waitlist_submit', { course: f.dataset.course });
      })
      .catch(function () { msg.textContent = 'Не вийшло. Напишіть нам у Telegram.'; msg.classList.add('err'); });
  });
});

/* Program cards: the whole card is clickable; a hash link (pill, course CTA) highlights its card for 2 s */
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
window.addEventListener('hashchange', highlightTarget);
highlightTarget();
