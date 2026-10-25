// Hidden tracking fields: page, UTM (kept in sessionStorage so a later form on another page still carries them), referrer.
var UTM_KEYS = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_content', 'utm_term'];

export function fillHidden(form) {
  var params = new URLSearchParams(location.search);
  var utm = {};
  var stored = null;
  try { stored = JSON.parse(sessionStorage.getItem('qas_utm') || 'null'); } catch (e) {}
  UTM_KEYS.forEach(function (k) { if (params.get(k)) utm[k] = params.get(k); });
  if (Object.keys(utm).length) { try { sessionStorage.setItem('qas_utm', JSON.stringify(utm)); } catch (e) {} }
  else if (stored) utm = stored;
  var set = function (name, value) { var f = form.querySelector('[name="' + name + '"]'); if (f) f.value = value; };
  set('page', location.href);
  set('utm', Object.keys(utm).map(function (k) { return k + '=' + utm[k]; }).join('&'));
  set('referrer', document.referrer || '');
}
