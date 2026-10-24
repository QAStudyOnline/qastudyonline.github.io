// Entry for course, team, legal, about, stub and 404 pages: shared behaviour + program accordion, sticky CTA, apply form.
import { initSite } from './lib/site.js';
import { track } from './lib/track.js';
import { initForm } from './lib/forms.js';
import './easter.js';
import './exit.js';

initSite();

/* Program accordion */
var modules = document.querySelectorAll('.module');
var toggleAll = document.getElementById('toggle-all');
function allOpen() { return Array.prototype.every.call(modules, function (m) { return m.open; }); }
function syncToggleAll() {
  if (!toggleAll) return;
  toggleAll.textContent = allOpen() ? toggleAll.dataset.close : toggleAll.dataset.open;
}
modules.forEach(function (m) {
  m.addEventListener('toggle', function () {
    if (m.open) track('program_module_open', { module: m.querySelector('.module-title').textContent.trim() });
    syncToggleAll();
  });
});
if (toggleAll) {
  toggleAll.addEventListener('click', function () {
    var wasOpen = allOpen();
    modules.forEach(function (m) { m.open = !wasOpen; });
    track(wasOpen ? 'program_collapse_all' : 'program_expand_all');
    syncToggleAll();
  });
}

/* Sticky CTA: visible after the hero, hidden again at the application block */
var sticky = document.getElementById('sticky-cta'), hero = document.getElementById('hero'), apply = document.getElementById('apply');
if (sticky && hero && 'IntersectionObserver' in window) {
  var heroVisible = true, applyVisible = false;
  var updateSticky = function () {
    var show = !heroVisible && !applyVisible;
    sticky.hidden = false;
    sticky.classList.toggle('is-shown', show);
    document.body.classList.toggle('has-sticky', show);
  };
  new IntersectionObserver(function (en) { heroVisible = en[0].isIntersecting; updateSticky(); }, { threshold: 0.1 }).observe(hero);
  if (apply) new IntersectionObserver(function (en) { applyVisible = en[0].isIntersecting; updateSticky(); }, { threshold: 0.15 }).observe(apply);
}

/* Application form (course pages, when a Formspree endpoint is configured) */
var form = document.getElementById('contact-form');
if (form) initForm(form, 'course');
