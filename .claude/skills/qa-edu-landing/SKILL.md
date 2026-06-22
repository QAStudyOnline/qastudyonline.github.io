---
name: qa-edu-landing
description: >
  Use this skill whenever you need to design or build a high-converting landing page for an online QA
  or IT education course, specifically for the QAStudy.online site (Hugo-based). Triggers include: any
  request involving "landing page", "лендінг", "Hugo", "course page", "course landing", "QAStudy",
  "k6 course", "Agentic QA course", "online education page", or requests to build a page that
  collects leads or motivates people to enroll in a course. Also trigger when the user says things
  like "create a Hugo page for the course", "build a landing to convert users", "design an education
  landing", or "make a page from the course program". This skill produces a complete Claude Code plan,
  Hugo templates, and content strategy — always use it when educational landing pages are involved.
---

# QA Education Hugo Landing Page Skill

A complete guide for Claude Code to design and build high-converting Hugo landing pages for
QAStudy.online courses. Covers architecture, content strategy, section design, lead capture, and
Ukrainian-language copywriting conventions.

---

## Step 0 — Read the Course Program First

Before writing any code, fetch the full program page:
- k6: `https://qastudy.online/k6-performance-testing-program/`
- Agentic QA: `https://qastudy.online/agentic-qa-program` (or similar `/program/` URL)
- Or a user-supplied URL

Extract and store as structured data:
```
course:
  title, subtitle, level, audience, weeks, lessons_count
  price_uah, price_per_lesson
  blocks: [{id, title, level, lessons: [{number, title}]}]
  outcomes: [{icon_keyword, title, description}]
  personas: [{role, pain_point, outcome}]
  final_project: [{deliverable, description}]
  what_is_included: [...]
  group_size
  format (live/async/blended)
  cta_url (Google Form link)
```

Then read the detailed architecture guide:
→ **`references/hugo-architecture.md`** — Hugo file/folder structure, shortcodes, data files  
→ **`references/sections.md`** — Every landing page section: purpose, copy rules, Hugo template  
→ **`references/conversion.md`** — CTA placement, lead forms, trust signals, A/B patterns  

---

## Step 1 — Choose the Build Mode

| Signal from user | Build mode |
|---|---|
| "Build the full Hugo site" | Full project scaffold (see `hugo-architecture.md`) |
| "Just the template / layout" | Single `layouts/_default/course.html` |
| "Generate the content / copy" | Markdown data files only, no Go templates |
| "Fix / improve existing landing" | Patch mode — edit only named files |

---

## Step 2 — Site Context

**Domain:** `qastudy.online`  
**Stack:** Hugo static site, deployed (likely Netlify or similar)  
**Existing courses:** `agentic-qa`, `k6-performance-testing`  
**Language:** Ukrainian (uk_UA) — all copy must be in Ukrainian  
**Theme:** Minimal, dark-accent; no heavy JS frameworks  
**Lead capture:** Google Forms (existing pattern), embed `<iframe>` or link with `→` button  
**Analytics:** Add Google Tag Manager placeholder `{{ if .Site.Params.gtm_id }}`  

---

## Step 3 — Mandatory Sections & Order

Every course landing MUST contain these sections in order:

1. **Hero** — headline + subheadline + primary CTA + meta badges  
2. **Pain → Audience** ("Для кого цей курс") — 2–3 persona cards  
3. **Outcomes** ("Чого ти навчишся") — 6–8 skill chips or cards  
4. **Social Proof Bar** — one row: students count · group size · format · employer logos (if any)  
5. **Course Program** ("Програма курсу") — collapsible blocks with lesson list  
6. **Final Project** ("Фінальний проєкт") — deliverables checklist  
7. **Instructor** ("Викладач") — photo, bio, credentials  
8. **Pricing** ("Вартість") — price box + what's included + installment note  
9. **FAQ** — 5–7 questions answering objections  
10. **Footer CTA** — repeat primary CTA + social links  

Do NOT omit sections 1, 2, 3, 5, 8 — they are the core conversion drivers.

Refer to **`references/sections.md`** for exact copy formulas and Hugo template snippets for each.

---

## Step 4 — Conversion Rules (Non-Negotiable)

1. **CTA appears at least 4 times** on page: hero, after outcomes, after program, after pricing.
2. **Primary CTA label** uses active verbs: "Подати заявку →" or "Залишити контакт →" — never "Дізнатися більше".
3. **Hero headline** names the outcome, not the topic. Bad: "Курс з k6". Good: "Навчись знаходити баги перформенсу до релізу".
4. **Price is never hidden** — show it plainly, add a "per-lesson" breakdown.
5. **Every pain point** in the audience section must end in an outcome promise.
6. **Mobile-first**: all CTAs must be thumb-reachable; sticky header CTA on mobile.
7. **Load speed**: no blocking JS; defer GA; use Hugo image processing for WebP.

Refer to **`references/conversion.md`** for full CTA copy bank, objection FAQ bank, and trust signal checklist.

---

## Step 5 — Hugo Implementation Plan for Claude Code

When Claude Code is building the page, follow this task sequence:

```
TASK 1: Scaffold Hugo data file
  - Create /data/courses/<slug>.yaml from extracted program data
  - Fields: all course metadata + blocks + outcomes + personas + faq

TASK 2: Create course layout template  
  - /layouts/_default/course.html  (or /layouts/courses/single.html)
  - Loops over .Site.Data.courses.<slug>
  - Uses partials for each section

TASK 3: Create section partials
  - /layouts/partials/course-hero.html
  - /layouts/partials/course-audience.html
  - /layouts/partials/course-outcomes.html
  - /layouts/partials/course-program.html  (accordion with JS progressive enhancement)
  - /layouts/partials/course-project.html
  - /layouts/partials/course-pricing.html
  - /layouts/partials/course-faq.html
  - /layouts/partials/course-cta-bar.html

TASK 4: Create course content file
  - /content/courses/<slug>/_index.md  (front matter only, body empty)
  - Front matter: title, description, layout=course, slug, params.cta_url

TASK 5: Styles
  - /assets/css/course.css  (scoped to .course-page class on <body>)
  - Use CSS custom properties for color tokens (match existing site palette)
  - Accordion JS: vanilla, < 30 lines, no jQuery

TASK 6: SEO & meta
  - OpenGraph image path: /static/img/courses/<slug>-og.png (1200×630)
  - JSON-LD schema: Course type with provider, price, startDate
  - Canonical URL in front matter

TASK 7: Lead capture integration
  - Google Form iframe embed in hero (hidden by default, shown on CTA click)
  - OR: dedicated /courses/<slug>/apply/ content page with iframe
  - Add UTM params to all CTA links: ?utm_source=landing&utm_medium=cta&utm_campaign=<slug>
```

---

## Step 6 — Ukrainian Copy Conventions

- Use **"ти"** (informal you) — not "ви" — consistent with QAStudy.online tone
- Avoid marketing buzzwords: instead of "унікальний", say "конкретний / практичний"
- Pain points should feel like internal monologue: use quotes + italic for persona voice
- Numbers add credibility: always show lesson count, weeks, group size, price
- Level badges: "базовий / середній / просунутий" (not "Beginner/Middle/Advanced")

---

## Reference Files

Read these when you need detail on a specific topic:

| File | When to read |
|---|---|
| `references/hugo-architecture.md` | Building the Hugo project from scratch |
| `references/sections.md` | Writing copy or templates for a specific section |
| `references/conversion.md` | Placing CTAs, choosing form type, trust signals |
