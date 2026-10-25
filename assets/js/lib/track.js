// Analytics: every event goes to window.dataLayer (GTM) and to gtag() when it is present.
export function track(event, params) {
  window.dataLayer = window.dataLayer || [];
  window.dataLayer.push(Object.assign({ event: event }, params || {}));
  if (typeof window.gtag === 'function') window.gtag('event', event, params || {});
}

// Any element with data-event reports its click; data-network / data-place become event parameters.
export function bindDataEvents() {
  document.addEventListener('click', function (e) {
    var el = e.target.closest('[data-event]');
    if (!el) return;
    var params = {};
    if (el.dataset.network) params.network = el.dataset.network;
    if (el.dataset.place) params.place = el.dataset.place;
    if (el.href) params.link_url = el.href;
    track(el.dataset.event, params);
  });
}
