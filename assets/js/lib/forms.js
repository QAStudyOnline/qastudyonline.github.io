// Contact / application form: validation, Formspree submit (AJAX), inline success state.
// The endpoint is the form's action attribute, filled from hugo.toml [params.forms].
import * as params from '@params';
import { track } from './track.js';
import { fillHidden } from './utm.js';

var TG = (params.telegramHandle || '@qastudy');
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

// formName: "home" | "course" — reported with form_start / form_submit.
export function initForm(form, formName) {
  var success = document.getElementById('form-success');
  var status = document.getElementById('form-status');
  var submitBtn = document.getElementById('form-submit');
  var started = false;
  fillHidden(form);

  form.querySelectorAll('input:not([type=hidden]), select, textarea').forEach(function (input) {
    if (input.name === '_gotcha') return;
    input.addEventListener('focus', function () {
      if (!started) { started = true; track('form_start', { form: formName }); }
    });
    input.addEventListener('blur', function () { validateField(input); });
    input.addEventListener('input', function () { if (input.classList.contains('invalid')) validateField(input); });
  });

  form.addEventListener('submit', function (e) {
    e.preventDefault();
    status.textContent = '';
    var valid = true, firstInvalid = null;
    form.querySelectorAll('[required]').forEach(function (input) {
      if (!validateField(input)) { valid = false; if (!firstInvalid) firstInvalid = input; }
    });
    if (!valid) { firstInvalid.focus(); track('form_error', { form: formName, type: 'validation' }); return; }

    var endpoint = form.getAttribute('action');
    if (!endpoint) {
      status.textContent = 'Форма ще не підключена. Напишіть нам у Telegram: ' + TG + '.';
      track('form_error', { form: formName, type: 'not_configured' });
      return;
    }

    submitBtn.disabled = true;
    submitBtn.classList.add('is-submitting');
    fetch(endpoint, { method: 'POST', body: new FormData(form), headers: { Accept: 'application/json' } })
      .then(function (res) {
        if (!res.ok) throw new Error('HTTP ' + res.status);
        form.hidden = true;
        success.hidden = false;
        var focusTarget = success.querySelector('.h4') || success;
        focusTarget.setAttribute('tabindex', '-1');
        focusTarget.focus();
        track('form_submit', { form: formName, role: form.elements.role ? form.elements.role.value : '' });
      })
      .catch(function () {
        status.textContent = 'Не вдалося надіслати. Спробуйте ще раз або напишіть у Telegram: ' + TG + '.';
        track('form_error', { form: formName, type: 'server' });
      })
      .then(function () {
        submitBtn.disabled = false;
        submitBtn.classList.remove('is-submitting');
      });
  });
}
