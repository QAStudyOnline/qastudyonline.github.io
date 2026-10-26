# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

QAStudy.online is a Hugo static site for an engineering school for QA ("Indigo Glass" design). The site is Ukrainian-only (default language, no URL prefix). English was removed for now, but the config retains the `[languages.uk]` structure so a second language can be re-added later. Deployed to GitHub Pages via GitHub Actions on push to `master`.

**Hugo Extended is required** (SCSS and JS bundling). CI pins Hugo `0.168.0`. Install locally: `brew install hugo`.
SCSS is compiled by LibSass (deprecated in Hugo, still bundled). Do not upgrade Hugo past the version that removes LibSass without switching to Dart Sass.

## Common Commands

```bash
hugo server --navigateToChanged   # dev server, http://localhost:1313
hugo --minify                     # production build into public/
hugo --printI18nWarnings --printPathWarnings   # catch missing i18n keys and path clashes
```

## Architecture

### Content (`content/uk/`) — all copy lives in front matter
| File | Layout | Notes |
|---|---|---|
| `_index.md` | `layouts/index.html` | Home: `hero`, `programs`, `learning`, `founder`, `why`, `faq`, `final` |
| `courses/<slug>.md` | `layouts/courses/single.html` | One file per course, see schema below. No body text |
| `courses/_index.md`, `team/_index.md` | `redirect` | Old section URLs redirect (`redirect_to`); `cascade` sets `body_class` / `nav` |
| `team/yehor-maksymchuk.md` | `layouts/team/single.html` | Instructor page; also feeds the founder block on home and course pages |
| `about.md` | `about` | Sections in front matter |
| `oferta.md`, `privacy.md`, `terms.md` | `legal` | Markdown body, `##` headings build the table of contents. `robots: noindex`, `sitemap.disable: true` |
| `mini-course.md` | `stub` | "Under construction" page |

Old URLs (`/agentic-qa-program/` etc.) are `aliases` in the course front matter (meta-refresh pages; GitHub Pages cannot send 301).

### Layouts (`layouts/`)
- `_default/baseof.html`: shell (SEO head, analytics, skip link, header, `main`, footer, `after_footer` block, scripts)
- `partials/head/`: `seo` (title, canonical, robots, OG, Twitter, CSS), `analytics` (GTM when `params.analytics.gtm_id` is set), `jsonld` (Organization / Course / Person)
- `partials/site/`: `header` (menu per page type), `footer` (programs column is built from the course pages), `scripts`, `modal-form`
- `partials/home/`, `partials/course/`: one partial per page section. Course sections are optional: a section whose data is missing is not rendered, and the numbers ("01.", "02.", …) come from `course/num.html`, so there are no gaps
- `partials/ui/`: shared pieces: `cta` (course CTAs), `lamp`, `seats`, `waitlist`, `founder`, `faq-list`, `icon`, `img`, `form-fields`
- Home program cards are generated from the course pages (`where site.RegularPages "Section" "courses"`), ordered by `weight`

### Styling (`assets/sass/`)
Two entry points, mirroring the original design package: `main.scss` (every page) and `inner.scss` (everything except home: course, team, legal, about, stub, 404). Design tokens are CSS custom properties in `base/_tokens.scss` and are overridden by `theme/_indigo-glass.scss`.
**Import order in `main.scss` is the cascade order. Do not reorder.** `theme/_patch-*.scss` are late override layers kept in their original position; folding them into the components is possible follow-up work but needs visual regression checks.

### JavaScript (`assets/js/`)
Bundled with `js.Build` (esbuild, no npm). Two entries: `home.js` and `inner.js`. Shared code is in `lib/` (`site`, `track`, `forms`, `modal`, `utm`). `easter.js` and `exit.js` are imported by both. Site params are passed in as `@params` (see `partials/site/scripts.html`).

### Configuration (`hugo.toml`)
- `[params.forms]`: Formspree `endpoint` / `waitlist_endpoint`. **Empty endpoint = fallback**: course CTAs open the course's `registration_url` (Google Form), the home question modal shows "form not connected, write in Telegram"
- `[params.analytics]`: `gtm_id`
- `[params.social]`, `telegram_handle`: links used in header, footer, forms
- `[params.easter]`: promo code, discount label, enable switch. `[params.exit]`: exit-intent popup, variants by weight
- Menus: `nav_home`, `nav_team`, `nav_about`, `nav_legal` (header per page type; course nav is built from the page's sections), `footer_school`, `footer_info`, `footer_legal`
- UI strings used by templates: `i18n/uk.yaml` (`{{ i18n "key" }}`). Plural keys (`modules_count`, `lessons_count`) use Ukrainian plural forms

### Deployment
`.github/workflows/hugo.yml` runs `hugo --minify` on push to `master` and uploads `./public/`. `static/CNAME` sets the domain `qastudy.online`.

## Course front matter schema (`content/uk/courses/<slug>.md`)

```yaml
title: ""                  # also the H1
seo_title: ""
description: ""
weight: 1                  # order on home and in the footer
aliases: []                # old URLs
registration_url: ""       # Google Form: fallback while no Formspree endpoint is set
direction: ""              # e.g. "AI Quality"
level_path: []             # hero path, e.g. [Middle, Senior, Lead]
transition: ""             # "Middle+ QA → AI Quality Engineer"
promise: ""                # hero lead
enrollment: {state: open|soon, label: ""}   # open: apply CTAs; soon: "Повідомити про старт" + waitlist, no seats/apply form
lessons_total: 0
meta: [{label: "", value: ""}]              # 4 hero tiles
cohort: {date, date_iso, details: [], note, seats_total, seats_taken}   # optional; seats_taken must be real
personas: [{role, quote, outcome}]
skills: []
program_intro: ""
modules: [{num, color: blue|green|orange|red|violet, title, lessons_count, meta (optional text), artifacts: [], milestone, output,
           lessons: [{n, title, desc, practice (optional), homework (optional)}]}]
project: {title, intro, items: [{name, desc}]}
format: [{title, desc}]    # optional
stack: [{group, items: []}]  # optional, rendered inside the format section
instructor_line: ""        # optional
price: {amount, value, currency, note, included: [], company: {title, text}, aside: {title, text, links: [{text, url}]}}  # optional; value feeds JSON-LD
faq: [{q, a}]              # optional
form: {subject: ""}
related: [slug, slug]
card: {anchor, event, waitlist, quote, master: [], create: [], meta: [{label, value}]}   # home program card
```

## Updating content

| Task | Edit |
|---|---|
| Open / close enrollment, change start date | course `enrollment`, `cohort` |
| Update seats taken | course `cohort.seats_taken` |
| Change price or "what is included" | course `price` |
| Course program, FAQ | course `modules`, `faq` |
| Launch a new course | copy a course file, new `weight`, `card`, `related` |
| Instructor page, certifications | `content/uk/team/yehor-maksymchuk.md`, badge image in `assets/img/` |
| Footer / menus | `hugo.toml` menus |
| Legal texts and edition date | `oferta.md`, `privacy.md`, `terms.md` |
| Promo code, exit popup | `hugo.toml` `[params.easter]`, `[params.exit]` |

## Before launch (needs the owner)
- Create the Formspree form; set `params.forms.endpoint`. Send a test from each form (home modal, course application, waitlist)
- GTM container `GTM-T9LJX9GJ` is set in `params.analytics.gtm_id`; add the GA4 tag in the GTM UI, check `form_submit`, `waitlist_submit`, `course_apply_click` in GTM Preview and mark them as conversions
- Confirm facts: price, group size, start date, `seats_taken`; k6 15 lessons / 15 weeks and Scale Quality 35 lessons / ~33 weeks are marked `NEEDS CONFIRMATION` in their front matter
- Register the easter-egg promo code in the payment flow (or change it); confirm the discount size
- Confirm the Telegram handle (`@qastudy` on the site, `@qastudyonline` on the old About page)
- Replace `assets/img/founder.webp` (540×851) with a 1200px+ original and `static/img/og-image.jpg` with a designer 1200×630 image
- Legal review of `privacy.md` and `terms.md`; in `oferta.md` replace "Google Форма" with the site form (clauses 1.2, 2.7, 4.1.1); then remove the "Чернетка" line
- Lighthouse on home and a course page (target Performance 90+, Accessibility 95+); test a form from a phone
