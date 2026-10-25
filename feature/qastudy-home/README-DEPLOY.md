# QAStudy.online — Home page (static build)

Статический лендинг главной страницы по ТЗ «QAStudy_Home_Technical_Handoff». Без сборки, без зависимостей — залить содержимое архива в корень хостинга (public_html / www / dist).

## Структура
```
index.html                      — головна
courses/agentic-qa/index.html   — сторінка програми Agentic QA (згенерована)
team/yehor-maksymchuk/index.html — сторінка викладача (згенерована)
about/                          — сторінка «Про школу» (python3 _dev/build_about.py; тексти в ABOUT)
courses/k6-performance-testing/ · courses/scale-quality/ — ЗАГЛУШКИ «Under construction» (python3 _dev/build_stub.py; тексти в STUBS)
oferta/ · privacy/ · terms/      — юридичні сторінки (згенеровані; privacy і terms — ЧЕРНЕТКИ, потрібен юрист)
404.html                        — сторінка помилки (Bug #404)
assets/css/style.css            — база + тема Indigo Glass
assets/css/course.css           — стилі шаблону сторінки програми
assets/js/main.js               — головна: меню, reveal, модальна форма, аналітика
assets/js/course.js             — сторінка програми: акордеон, sticky CTA, форма
assets/js/easter.js             — пасхалки (обидві сторінки)
assets/img/                     — зображення
favicon.svg, apple-touch-icon.png, robots.txt, sitemap.xml, .htaccess
_dev/                           — НЕ публічне: генератор і дані курсів
  build_course.py               — python3 _dev/build_course.py _dev/courses/<slug>.json
  courses/agentic-qa.json       — дані програми
  build_team.py                 — python3 _dev/build_team.py _dev/team/yehor-maksymchuk.json
  team/yehor-maksymchuk.json    — дані викладача
  build_legal.py                — python3 _dev/build_legal.py (усі три юридичні сторінки)
  legal/oferta.html · privacy.html · terms.html · meta.json — тексти документів
```
Головна посилається на сторінку програми відносно (`courses/agentic-qa/`), сторінка програми — на головну (`../../`). Тому пакет працює і з диска, і в корені домену. Посилання на сторінки поточного сайту (`/about/`, `/team/…`, `/courses/k6-…`, `/oferta/`) — абсолютні.
Все ссылки абсолютные от корня (`/assets/...`, `/courses/...`) — сайт должен лежать в корне домена.

## Что нужно сделать перед публикацией
1. **Formspree.** В `index.html` заменить `FORM_ENDPOINT` в `action="https://formspree.io/f/FORM_ENDPOINT"` на реальный id формы. Пока endpoint не задан, форма показывает сообщение «форма ещё не подключена» и не отправляется. Honeypot (`_gotcha`), hidden `source / page / utm / referrer` уже есть.
2. **Аналитика.** Вставить GA4/GTM snippet в `<head>` (помечено комментарием `ANALYTICS`). Все события из ТЗ §22 пушатся в `window.dataLayer` и в `gtag('event', …)`, если он есть: `hero_direction_click, header_programs_click, direction_*_click, program_*_click, material_*_click, founder_profile_click, founder_social_click, faq_open, question_cta_click, form_start, form_submit, form_error, telegram_click, scroll_depth (25/50/75/90), section_view`.
3. **Фото основателя.** `assets/img/founder.webp` (540×851) вырезано из утверждённого макета. По ТЗ §26 нужен оригинал 1200px+ — заменить файл (кроп 4:5, `object-position: top`).
4. **Hero / Why визуалы.** `hero-visual.webp` и `why-map.webp` тоже вырезаны из макетов (842×700 и 894×887). При наличии исходников большего размера — заменить, имена и размеры в `<img width/height>` поправить.
5. **Материалы.** Превью в блоке 08 — из макета; ссылки ведут на реальные YouTube / Telegram / LinkedIn. Заголовки написаны без вымышленных названий статей (ТЗ §13). Когда появятся реальные ресурсы — заменить карточки (структура `Resource` описана в комментарии в HTML).
6. **Страницы, на которые ссылается главная:** `/about/`, `/team/yehor-maksymchuk/`, `/courses/agentic-qa/`, `/courses/k6-performance-testing/`, `/courses/scale-quality/`, `/oferta/` — существуют на текущем сайте. **`/privacy/` и `/terms/` — нужно создать** (или убрать ссылки из футера/формы).
7. **OG-image.** `assets/img/og-image.jpg` — временный (сгенерирован программно). Заменить на дизайнерский 1200×630.

## Факты, ожидающие подтверждения (ТЗ §29)
- Performance / Scale Quality: количество занятий и модулей **не выводится** (в HTML оставлены комментарии `NEEDS CONFIRMATION`). На текущем сайте: k6 — 15 занятий / 4 блока; Scale Quality — 35 занятий / 8 блоков. Если данные подтверждены — раскомментировать/добавить `<div><dt>Занять</dt><dd>…</dd></div>` в `.program-meta`.
- Agentic QA: 21 занятие / 6 модулей — проверить перед деплоем.
- FAQ 03 (пропуски) и 04 (нагрузка в неделю) — написаны нейтрально, без конкретных обязательств. Финализировать после подтверждения политики записей и weekly commitment.
- «14+ років в IT» и GitHub Copilot Certified — взяты с текущей страницы /team/; бейджи — реальные (Credly / Microsoft), как на /team/.
- Telegram: на сайте используется `t.me/qastudy`; на странице «Про нас» указан `@qastudyonline`. Проверить актуальный.

## Шрифт
Inter через Google Fonts (как на текущем сайте). Для self-host (ТЗ §20): скачать WOFF2 400/500/600/700, положить в `assets/fonts/`, заменить `<link>` на `@font-face` с `font-display: swap`.

## Следующие страницы
Сетка, токены, header/footer и компоненты (`.section`, `.columns-3`, `.eyebrow`, `.h2`, `.btn`, `.link-underline`, `.faq-item`, модалка) переиспользуемы для страниц программ — достаточно подключить тот же `style.css` и `main.js`.
