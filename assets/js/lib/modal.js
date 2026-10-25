// "Поставити питання" modal: any [data-open-form] opens it; Esc / backdrop / × close it; focus is trapped inside.
export function initModal() {
  var modal = document.getElementById('contact-modal');
  if (!modal) return;
  var panel = modal.querySelector('.modal-panel');
  var form = document.getElementById('contact-form');
  var lastFocus = null;

  function open(trigger) {
    lastFocus = trigger || document.activeElement;
    modal.hidden = false;
    document.body.classList.add('nav-open');
    var first = form.querySelector('input:not([type=hidden])');
    if (first && !form.hidden) first.focus(); else panel.focus();
  }
  function close() {
    modal.hidden = true;
    document.body.classList.remove('nav-open');
    if (lastFocus) lastFocus.focus();
  }

  document.querySelectorAll('[data-open-form]').forEach(function (el) {
    el.addEventListener('click', function (e) { e.preventDefault(); open(el); });
  });
  modal.querySelectorAll('[data-close-form]').forEach(function (el) { el.addEventListener('click', close); });
  document.addEventListener('keydown', function (e) {
    if (modal.hidden) return;
    if (e.key === 'Escape') { close(); return; }
    if (e.key === 'Tab') {
      var f = panel.querySelectorAll('a[href], button:not([disabled]), input:not([type=hidden]):not([tabindex="-1"]), select, textarea');
      var first = f[0], last = f[f.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    }
  });
}
