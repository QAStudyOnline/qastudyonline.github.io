/* QAStudy.online — custom cursor (desktop only, pointer: fine, no reduced-motion)
   Точка + кільце, що «доганяє» точку. На посиланнях і кнопках кільце розширюється,
   на картках програм показує стрілку. Нативний курсор ховається лише коли кастомний активний. */
(function () {
  'use strict';
  var fine = window.matchMedia('(pointer: fine)').matches;
  var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (!fine || reduce || !window.requestAnimationFrame) return;

  var dot = document.createElement('div'), ring = document.createElement('div');
  dot.className = 'cur-dot'; ring.className = 'cur-ring';
  ring.setAttribute('aria-hidden', 'true'); dot.setAttribute('aria-hidden', 'true');
  document.body.appendChild(ring); document.body.appendChild(dot);
  document.documentElement.classList.add('has-cursor');

  var x = innerWidth / 2, y = innerHeight / 2, rx = x, ry = y, shown = false;
  document.addEventListener('mousemove', function (e) {
    x = e.clientX; y = e.clientY;
    if (!shown) { shown = true; rx = x; ry = y; document.documentElement.classList.add('cursor-visible'); }
  }, { passive: true });
  document.addEventListener('mouseleave', function () { document.documentElement.classList.remove('cursor-visible'); shown = false; });
  document.addEventListener('mousedown', function () { document.documentElement.classList.add('cursor-down'); });
  document.addEventListener('mouseup', function () { document.documentElement.classList.remove('cursor-down'); });

  var HOVER = 'a, button, summary, [role="button"], input, select, textarea, label, .step';
  var ARROW = '.program, .related-card, .direction';
  document.addEventListener('mouseover', function (e) {
    var t = e.target;
    var isText = t.closest && t.closest('input, textarea, select');
    document.documentElement.classList.toggle('cursor-text', !!isText);
    document.documentElement.classList.toggle('cursor-hover', !!(t.closest && t.closest(HOVER)) && !isText);
    document.documentElement.classList.toggle('cursor-arrow', !!(t.closest && t.closest(ARROW)) && !(t.closest && t.closest(HOVER)));
  });

  (function loop() {
    rx += (x - rx) * 0.18; ry += (y - ry) * 0.18;
    dot.style.transform = 'translate3d(' + x + 'px,' + y + 'px,0)';
    ring.style.transform = 'translate3d(' + rx + 'px,' + ry + 'px,0)';
    requestAnimationFrame(loop);
  })();
})();
