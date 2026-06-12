# Instructions: Add Agentic QA Course Landing Page to Hugo Site

## Context

Add a new landing page for the **Agentic QA** course to the existing Hugo static site. The page should present the course clearly, build trust, and drive registrations via a single CTA button linking to the Google Form.

- **Registration form:** https://forms.gle/Lz1ZfjUBWzrK8sQn7
- **Full curriculum doc:** https://docs.google.com/document/d/17_3F0DyPfGhgrVn42Wt3PKq4H_epvvG9pG_7hZP6FqM/edit
- **Hugo version:** detect from `go.mod` or `config.toml`/`hugo.toml`
- **Theme:** use the existing site theme; extend only where needed

---

## Step 1 — Explore the repo before writing anything

```bash
# Understand the project structure
ls -la
cat config.toml || cat hugo.toml || cat config.yaml
ls themes/
ls content/
ls layouts/
ls static/
```

Identify:
- The content directory structure (e.g. `content/courses/`, `content/posts/`)
- Whether the site uses page bundles or flat files
- The base URL and language settings
- How existing pages define front matter (TOML or YAML)
- Whether there is a shared `layouts/_default/baseof.html` or a custom layout per section
- CSS approach: plain CSS, SCSS/SASS, Tailwind, or other

---

## Step 2 — Create the content file

Create the file at the appropriate path. If the site has a `courses` or `training` section, place it there. Otherwise create:

```
content/courses/agentic-qa/index.md
```

or, for flat structure:

```
content/agentic-qa.md
```

### Front matter

```yaml
---
title: "Agentic QA"
description: "Практичний курс з тестування AI-агентних систем для QA, SDET і Tech Lead інженерів. 21 заняття від основ до production-ready CI/CD pipeline."
date: 2026-06-11
draft: false
layout: "course"
url: "/agentic-qa/"
registration_url: "https://forms.gle/Lz1ZfjUBWzrK8sQn7"
---
```

---

## Step 3 — Create the layout

Create `layouts/course/single.html` (or `layouts/_default/course.html` if the theme uses a different convention). Base it on the existing `baseof.html` — extend it, do not replace it.

The layout must render the following sections **in this order**:

### 3.1 Hero section

```
┌──────────────────────────────────────────────────┐
│  [eyebrow: small caps label]  КУРС               │
│                                                  │
│  Agentic QA                  [large h1]          │
│                                                  │
│  Навчись тестувати AI-агентів,   [subtitle]      │
│  RAG-системи і agentic pipelines —               │
│  від першого eval до production CI/CD.           │
│                                                  │
│  [ Подати заявку → ]         [CTA button]        │
│                                                  │
│  21 заняття · 11–14 тижнів · Junior–Middle       │
│  [three small meta pills]                        │
└──────────────────────────────────────────────────┘
```

The CTA button links to `{{ .Params.registration_url }}` and opens in a new tab (`target="_blank" rel="noopener"`).

### 3.2 For whom section — three audience cards

Three cards side by side (stack on mobile):

| Card | Role | One-line JTBD |
|------|------|---------------|
| 1 | QA Engineer Middle+ | Проект перейшов на LLM — не знаю як тестувати по-нормальному |
| 2 | Automation QA / SDET | Хочу конкретний технічний стек для тестування AI, а не "якось протестувати" |
| 3 | Tech Lead / QA Lead | Боюся production-інцидентів і не знаю що запитати у команди |

### 3.3 What you will learn — six competencies

Six items in a 2×3 grid (or 3×2), each with a short label and one sentence:

1. **Risk mapping** — декомпозувати агентну систему і будувати risk map як основу тест-стратегії
2. **Eval automation** — писати eval-suite з DeepEval або Promptfoo замість ручних перевірок
3. **RAG & dialog testing** — вимірювати якість RAG через RAGAS і знаходити context failure
4. **LLM-as-a-Judge** — реалізувати і калібрувати judge-оцінку, підключити до CI
5. **Security & red teaming** — проводити red team сесію за OWASP LLM Top 10
6. **CI/CD quality gates** — вбудувати eval gates і agentic workflows у GitHub Actions pipeline

### 3.4 Curriculum — six blocks, collapsible accordion

Each block is collapsible. Default state: all collapsed except Block 1.

```
▼ Блок 1. Фундамент                          [заняття 1–2 · базовий рівень]
  └─ Заняття 1. AI-системи як об'єкт тестування: чому все інакше
  └─ Заняття 2. Архітектура агентних систем очима QA

▶ Блок 2. Тестування LLM                     [заняття 3–9 · середній рівень]
▶ Блок 3. Agentic Testing                    [заняття 10–14 · середній рівень]
▶ Блок 4. Автоматизація і фреймворки         [заняття 15–16 · просунутий]
▶ Блок 5. Системний рівень і Agentic CI/CD   [заняття 17–18 · просунутий]
▶ Блок 6. Фінальний проєкт                  [заняття 19–21 · синтез]
```

Full curriculum content for each block:

**Блок 1. Фундамент (заняття 1–2)**
- Заняття 1. AI-системи як об'єкт тестування: чому все інакше
- Заняття 2. Архітектура агентних систем очима QA

**Блок 2. Тестування LLM (заняття 3–9)**
- Заняття 3. Промпт та контекст інжиніринг для QA
- Заняття 4. Метрики в тестуванні ШІ
- Заняття 5. Тестування промптів: від ручних перевірок до автоматизації
- Заняття 6. Тестування RAG: hallucination, faithfulness, relevancy
- Заняття 7. Тестування багатокрокових діалогів і context management
- Заняття 8. Тестування різних моделей і GitHub Models
- Заняття 9. Локальні моделі для тестування: Ollama і Lemonade AI Runtime

**Блок 3. Agentic Testing (заняття 10–14)**
- Заняття 10. LLM as a Judge: імплементація і підводні камені
- Заняття 11. Security testing: Prompt Injection і Red Teaming
- Заняття 12. Tool call testing і MCP
- Заняття 13. Observability і cost testing
- Заняття 14. AI-assisted Test Case Generation і Code Review

**Блок 4. Автоматизація і фреймворки (заняття 15–16)**
- Заняття 15. Побудова фреймворку для автоматизованого тестування ШІ
- Заняття 16. Eval pipeline у CI/CD: Quality Gates з DeepEval і LLM-as-a-Judge

**Блок 5. Системний рівень і Agentic CI/CD (заняття 17–18)**
- Заняття 17. Agentic CI/CD: AI-агенти як частина пайплайну розробки
- Заняття 18. Documentation і Test Generation як частина agentic workflow

**Блок 6. Фінальний проєкт (заняття 19–21)**
- Заняття 19. Підготовка фінального проєкту: консультації і peer review
- Заняття 20–21. Захист: демо живого CI/CD pipeline + запитання від групи

### 3.5 Final project section

Highlight the final project deliverables as a visual checklist:

```
Фінальний проєкт: AI-Powered Application — повний цикл

Студент самостійно будує AI-додаток і здає:

☐  AI-додаток (300–800 рядків, з допомогою Claude Code або Copilot)
☐  Тест-стратегія (2–4 сторінки, go/no-go критерії)
☐  Risk-based test coverage matrix
☐  Тести на всіх рівнях: eval · RAG · LLM-judge · security · E2E
☐  AI test framework з LLM-as-a-Judge і звітом
☐  CI/CD pipeline: quality gates + AI code review + автоматичний реліз
☐  Документація: README + опис де AI-асистент допоміг і де заважав
```

### 3.6 Bottom CTA

Repeat the registration button, centered, with supporting text:

```
Залишити контакт — розкажу деталі про старт, формат і вартість.

[ Подати заявку → ]

Програма курсу повністю: [посилання на Google Doc]
```

---

## Step 4 — CSS / styling rules

**Do not override the global theme styles.** Add a scoped CSS file only for the course layout.

Place it at: `assets/css/course.css` (or `static/css/course.css` if the site does not use Hugo Pipes).

Include it only on course layout pages via the `layouts/course/single.html` head block.

Key styling requirements:

```css
/* CTA button — high contrast, must be visible on any bg */
.btn-cta {
  display: inline-block;
  padding: 14px 32px;
  font-size: 1rem;
  font-weight: 600;
  text-decoration: none;
  border-radius: 6px;
  /* Use the site's primary accent color if defined, otherwise: */
  background-color: #1D3557;
  color: #ffffff;
  transition: opacity 0.15s ease;
}
.btn-cta:hover { opacity: 0.88; }

/* Accordion — pure CSS or minimal JS, no jQuery */
.curriculum-block summary {
  cursor: pointer;
  list-style: none;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 0;
  border-bottom: 1px solid currentColor;
  font-weight: 600;
}
.curriculum-block summary::-webkit-details-marker { display: none; }

/* Responsive grid for audience cards and competency grid */
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.5rem;
}

/* Meta pills in hero */
.meta-pill {
  display: inline-block;
  padding: 4px 12px;
  border-radius: 100px;
  font-size: 0.8rem;
  border: 1px solid currentColor;
  opacity: 0.7;
}
```

If the site uses Tailwind: use Tailwind utility classes instead and skip the custom CSS file. Check `tailwind.config.js` first.

If the site uses SCSS: create `assets/scss/_course.scss` and import it in the main SCSS entry point.

---

## Step 5 — Accordion behaviour

Use native HTML `<details>` / `<summary>` — no JavaScript required for basic open/close.

```html
<details class="curriculum-block" open>
  <summary>
    <span>Блок 1. Фундамент</span>
    <span class="block-meta">заняття 1–2 · базовий рівень</span>
  </summary>
  <ul>
    <li>Заняття 1. AI-системи як об'єкт тестування: чому все інакше</li>
    <li>Заняття 2. Архітектура агентних систем очима QA</li>
  </ul>
</details>
```

The first block (`Блок 1`) gets the `open` attribute. All others are closed by default.

---

## Step 6 — Shortcode for CTA button (optional but recommended)

If the site uses shortcodes, create `layouts/shortcodes/cta-button.html`:

```html
<a href="{{ .Get "url" }}" class="btn-cta" target="_blank" rel="noopener noreferrer">
  {{ .Get "label" | default "Подати заявку →" }}
</a>
```

Usage in content:
```
{{< cta-button url="https://forms.gle/Lz1ZfjUBWzrK8sQn7" label="Подати заявку →" >}}
```

---

## Step 7 — SEO and meta

Ensure the layout sets these in `<head>` (extend the existing `baseof.html` partial, do not duplicate it):

```html
<meta name="description" content="{{ .Description }}">
<meta property="og:title" content="{{ .Title }} | {{ .Site.Title }}">
<meta property="og:description" content="{{ .Description }}">
<meta property="og:type" content="website">
<meta property="og:url" content="{{ .Permalink }}">
```

Canonical URL must be set if not already handled globally.

---

## Step 8 — Verify the build

```bash
hugo server -D
```

Check:
- [ ] Page renders at `/agentic-qa/` (or the configured `url`)
- [ ] CTA button links correctly to `https://forms.gle/Lz1ZfjUBWzrK8sQn7` and opens in new tab
- [ ] Accordion works — Block 1 open, others closed
- [ ] No Hugo build errors or warnings
- [ ] Mobile layout looks correct (check at 375px width in browser devtools)
- [ ] No broken links
- [ ] `hugo --minify` builds without errors

---

## Step 9 — Do NOT do the following

- Do not modify `baseof.html` in a way that affects other pages
- Do not add jQuery or large JS libraries
- Do not inline all styles in the HTML template — keep them in a separate CSS file
- Do not hardcode the registration URL in the template — read it from `{{ .Params.registration_url }}`
- Do not create a new theme — extend the existing one
- Do not remove or replace existing content files

---

## File summary — what to create

```
content/courses/agentic-qa/index.md       ← page content + front matter
layouts/course/single.html                ← page layout template
assets/css/course.css                     ← scoped styles (if not Tailwind)
layouts/shortcodes/cta-button.html        ← optional CTA shortcode
```

If the site uses a different content structure, adapt the paths to match the existing convention — always check before creating.
