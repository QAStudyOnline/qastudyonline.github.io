// Behaviour shared by every page: analytics clicks, scroll depth, section_view + active nav link, reveal-on-scroll,
// burger menu, FAQ analytics, footer year.
import { track, bindDataEvents } from './track.js';

export function initSite() {
  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  bindDataEvents();

  /* Scroll depth 25/50/75/90 */
  var depths = [25, 50, 75, 90], fired = {};
  window.addEventListener('scroll', function () {
    var total = document.documentElement.scrollHeight - window.innerHeight;
    if (total <= 0) return;
    var pct = Math.round((window.scrollY / total) * 100);
    depths.forEach(function (d) {
      if (pct >= d && !fired[d]) { fired[d] = true; track('scroll_depth', { percent: d }); }
    });
  }, { passive: true });

  /* Section visibility + current nav link (links may be "#id" or "/path/#id") */
  var navLinks = Array.prototype.filter.call(document.querySelectorAll('.nav-list a[href*="#"]'), function (a) {
    return a.pathname === location.pathname;
  });
  if ('IntersectionObserver' in window) {
    var seen = {};
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        var id = entry.target.id;
        if (!seen[id]) { seen[id] = true; track('section_view', { section: id }); }
        navLinks.forEach(function (a) {
          if (a.hash === '#' + id) a.setAttribute('aria-current', 'true'); else a.removeAttribute('aria-current');
        });
      });
    }, { rootMargin: '-40% 0px -50% 0px', threshold: 0 });
    document.querySelectorAll('main section[id]').forEach(function (s) { io.observe(s); });
  }

  /* Reveal on scroll, with a safety net so content is never left hidden */
  var reveals = document.querySelectorAll('.reveal');
  function revealAll() { reveals.forEach(function (el) { el.classList.add('is-visible'); }); }
  if (reduceMotion || !('IntersectionObserver' in window)) {
    revealAll();
  } else {
    var rio = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) { entry.target.classList.add('is-visible'); rio.unobserve(entry.target); }
      });
    }, { rootMargin: '0px 0px -8% 0px', threshold: 0.05 });
    reveals.forEach(function (el) { rio.observe(el); });
    setTimeout(revealAll, 3000);
    window.addEventListener('hashchange', revealAll);
    window.addEventListener('beforeprint', revealAll);
    if (location.hash) revealAll();
  }

  /* Burger / mobile nav */
  var burger = document.getElementById('burger');
  var nav = document.getElementById('site-nav');
  if (burger && nav) {
    var setNav = function (open) {
      nav.classList.toggle('is-open', open);
      document.body.classList.toggle('nav-open', open);
      burger.setAttribute('aria-expanded', String(open));
      burger.setAttribute('aria-label', open ? burger.dataset.labelClose : burger.dataset.labelOpen);
      if (open) { var first = nav.querySelector('a'); if (first) first.focus(); }
    };
    burger.addEventListener('click', function () { setNav(!nav.classList.contains('is-open')); });
    nav.addEventListener('click', function (e) { if (e.target.closest('a')) setNav(false); });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && nav.classList.contains('is-open')) { setNav(false); burger.focus(); }
    });
    nav.addEventListener('keydown', function (e) {
      if (e.key !== 'Tab' || !nav.classList.contains('is-open')) return;
      var focusables = nav.querySelectorAll('a, button');
      var first = focusables[0], last = focusables[focusables.length - 1];
      if ((e.shiftKey && document.activeElement === first) || (!e.shiftKey && document.activeElement === last)) {
        e.preventDefault();
        burger.focus();
      }
    });
    window.matchMedia('(min-width: 1024px)').addEventListener('change', function (m) { if (m.matches) setNav(false); });
  }

  /* FAQ analytics */
  document.querySelectorAll('.faq-item').forEach(function (d) {
    d.addEventListener('toggle', function () {
      if (d.open) track('faq_open', { question: d.querySelector('.faq-q').textContent.trim() });
    });
  });

  var year = document.getElementById('year');
  if (year) year.textContent = String(new Date().getFullYear());
}
