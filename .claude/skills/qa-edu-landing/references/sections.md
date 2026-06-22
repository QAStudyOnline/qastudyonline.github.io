# Section Templates & Copy Formulas

Each section below includes: purpose, copy formula, and Hugo partial template.

---

## 1. Hero Section

**Purpose:** Hook attention, state the outcome, capture the first CTA click.

**Copy formula:**
```
[Small label] Курс
[H1 — outcome headline]: Навчись [verb] [result] — [timeframe or context]
[Subheadline — who + what + differentiator]
[Primary CTA button] Подати заявку →
[Meta badges row] N занять · Level · Format
```

**Good headline examples:**
- "Навчись знаходити баги перформенсу до релізу — а не після"
- "Від першого eval до production CI/CD з AI-агентами"
- "Тестуй AI-системи, як це роблять у командах рівня Middle–Senior"

**Bad headline examples (avoid):**
- "Курс з k6 для DevOps" — names the tool, not the outcome
- "Performance Testing — все що потрібно знати" — vague, no promise
- "Онлайн курс для QA" — no differentiation

**Hugo partial (`course-hero.html`):**
```html
{{ $c := .course }}
<section class="course-hero">
  <div class="container">
    <span class="course-hero__label">Курс</span>
    <h1 class="course-hero__title">{{ $c.title }}</h1>
    <p class="course-hero__subtitle">{{ $c.subtitle }}</p>
    <a class="btn btn--primary" href="{{ $c.cta_url }}?utm_source=landing&utm_medium=hero&utm_campaign={{ $c.slug }}">
      Подати заявку →
    </a>
    <div class="course-hero__badges">
      {{ range $c.badges }}
      <span class="badge">{{ . }}</span>
      {{ end }}
    </div>
  </div>
</section>
```

---

## 2. Audience / Pain Section ("Для кого цей курс")

**Purpose:** Create recognition. The reader should feel "this is written about me."

**Copy formula per persona card:**
```
[Role title — bold]
[Pain point in FIRST PERSON VOICE — use quotes and italic]
→ [What they will be able to do after the course]
```

**Hugo partial (`course-audience.html`):**
```html
{{ $c := .course }}
<section class="course-audience" id="audience">
  <div class="container">
    <h2>Для кого цей курс</h2>
    <div class="audience-grid">
      {{ range $c.personas }}
      <div class="audience-card">
        <h3 class="audience-card__role">{{ .role }}</h3>
        <blockquote class="audience-card__pain">{{ .pain }}</blockquote>
        <p class="audience-card__outcome">{{ .outcome }}</p>
      </div>
      {{ end }}
    </div>
  </div>
</section>
```

---

## 3. Outcomes Section ("Чого ти навчишся")

**Purpose:** Enumerate concrete, testable skills. Makes the course feel tangible.

**Copy rules:**
- Each outcome: icon + short title (2–4 words) + one-sentence description
- Descriptions use infinitive verbs: "Формулювати НФР…", "Писати k6-тести…"
- 6–8 items in a 2 or 3-column grid

**Hugo partial (`course-outcomes.html`):**
```html
{{ $c := .course }}
<section class="course-outcomes" id="outcomes">
  <div class="container">
    <h2>Чого ти навчишся</h2>
    <div class="outcomes-grid">
      {{ range $c.outcomes }}
      <div class="outcome-card">
        <span class="outcome-card__icon" aria-hidden="true">{{ .icon }}</span>
        <h3 class="outcome-card__title">{{ .title }}</h3>
        <p class="outcome-card__desc">{{ .description }}</p>
      </div>
      {{ end }}
    </div>
  </div>
</section>
```

---

## 4. Social Proof Bar

**Purpose:** Reduce anxiety. One dense row of trust signals between outcomes and program.

**Elements to include:**
- Group size: "Групи 8–12 людей" — personalised feedback signal
- Format: "Живі заняття" or "Онлайн" 
- Lesson count + duration
- Any logos of employers who hired graduates (if available)

**Hugo partial (`course-social-proof.html`):**
```html
{{ $c := .course }}
<div class="social-proof-bar">
  <div class="container social-proof-bar__inner">
    <span>👥 {{ $c.group_size }}</span>
    <span>📅 {{ $c.lessons_count }} занять · {{ $c.weeks }} тижнів</span>
    <span>🎯 {{ $c.format }}</span>
    <span>💬 Персональний фідбек на кожне ДЗ</span>
  </div>
</div>
```

---

## 5. Course Program ("Програма курсу")

**Purpose:** Show depth. Let readers scan to verify their level is addressed.

**Design rules:**
- Collapsible accordion blocks (first block open by default)
- Each block header shows: block number, title, lesson range, level badge
- Lessons listed as numbered `<ol>` inside each block
- Link to full program page: `[Повна програма →](/courses/<slug>/program/)`

**Hugo partial (`course-program.html`):**
```html
{{ $c := .course }}
<section class="course-program" id="program">
  <div class="container">
    <h2>Програма курсу</h2>
    <div class="program-blocks">
      {{ range $c.blocks }}
      <div class="program-block" data-block="{{ .id }}">
        <button class="program-block__header" type="button" aria-expanded="false">
          <span class="program-block__num">Блок {{ .id }}</span>
          <span class="program-block__title">{{ .title }}</span>
          <span class="badge badge--level">{{ .level }}</span>
          <span class="program-block__chevron" aria-hidden="true">▼</span>
        </button>
        <div class="program-block__body">
          <ol class="lesson-list">
            {{ range .lessons }}
            <li class="lesson-list__item">
              <span class="lesson-num">Заняття {{ .number }}</span>
              {{ .title }}
            </li>
            {{ end }}
          </ol>
        </div>
      </div>
      {{ end }}
    </div>
    <a class="link--program-full" href="/courses/{{ $c.slug }}/program/">
      Повна програма курсу →
    </a>
  </div>
</section>
```

---

## 6. Final Project ("Фінальний проєкт")

**Purpose:** Make the portfolio outcome concrete. Transforms "course" into "career asset."

**Copy rules:**
- Lead with what the student WILL HAVE after completion
- Use a checklist (✓ icons) not bullet points
- End with the most impressive deliverable (CI/CD pipeline, real system tested)

**Hugo partial (`course-project.html`):**
```html
{{ $c := .course }}
<section class="course-project" id="project">
  <div class="container">
    <h2>Фінальний проєкт</h2>
    <p class="course-project__intro">{{ $c.final_project.intro }}</p>
    <ul class="project-checklist">
      {{ range $c.final_project.deliverables }}
      <li class="project-checklist__item">
        <span class="check-icon" aria-hidden="true">✓</span>
        {{ . }}
      </li>
      {{ end }}
    </ul>
  </div>
</section>
```

---

## 7. Instructor Section ("Викладач")

**Purpose:** Build trust in the teacher, not just the course.

**Copy rules:**
- Lead with CURRENT role + biggest credibility signal (company, project, years)
- 2–3 sentences bio — concrete, not fluffy
- Show social links (LinkedIn, Telegram, GitHub)
- Photo on left/top (not a placeholder — always use real photo)

**Hugo partial (`course-instructor.html`):**
```html
{{ $c := .course }}
{{ with $c.instructor }}
<section class="course-instructor" id="instructor">
  <div class="container">
    <h2>Викладач</h2>
    <div class="instructor-card">
      <img class="instructor-card__photo"
           src="{{ .photo }}"
           alt="{{ .name }}"
           width="160" height="160" loading="lazy">
      <div class="instructor-card__info">
        <h3 class="instructor-card__name">{{ .name }}</h3>
        <p class="instructor-card__title">{{ .title }}</p>
        <p class="instructor-card__bio">{{ .bio }}</p>
        <div class="instructor-card__links">
          {{ with .linkedin }}<a href="{{ . }}" target="_blank" rel="noopener">LinkedIn</a>{{ end }}
          {{ with .telegram }}<a href="{{ . }}" target="_blank" rel="noopener">Telegram</a>{{ end }}
        </div>
      </div>
    </div>
  </div>
</section>
{{ end }}
```

---

## 8. Pricing Section ("Вартість")

**Purpose:** Remove price anxiety. Show value, not just number.

**Copy rules:**
- Show total price prominently AND per-lesson breakdown
- List exactly what's included (use same list as `includes` in data file)
- Add installment note if available
- CTA button below price box

**Hugo partial (`course-pricing.html`):**
```html
{{ $c := .course }}
<section class="course-pricing" id="pricing">
  <div class="container">
    <h2>Вартість</h2>
    <div class="pricing-box">
      <div class="pricing-box__price">
        <span class="price-main">{{ $c.price_uah | lang.FormatNumber 0 }} грн</span>
        <span class="price-sub">за весь курс</span>
        <span class="price-per">≈ {{ $c.price_per_lesson | lang.FormatNumber 0 }} грн / заняття</span>
        <span class="price-meta">{{ $c.lessons_count }} занять · {{ $c.weeks }} тижнів</span>
      </div>
      <div class="pricing-box__divider"></div>
      <div class="pricing-box__includes">
        <p class="includes-title">Що входить:</p>
        <ul class="includes-list">
          {{ range $c.includes }}
          <li>{{ . }}</li>
          {{ end }}
        </ul>
      </div>
      <a class="btn btn--primary btn--full"
         href="{{ $c.cta_url }}?utm_source=landing&utm_medium=pricing&utm_campaign={{ $c.slug }}">
        Подати заявку →
      </a>
      <p class="pricing-box__installment">
        Є розстрочка — уточни деталі при подачі заявки
      </p>
    </div>
  </div>
</section>
```

---

## 9. FAQ Section

**Purpose:** Handle the top 5 objections before they cause drop-off.

**Must-answer objections for QA courses:**
1. "Чи підходить мені без досвіду в [topic]?"
2. "Коли старт? Скільки місць лишилось?"
3. "Чи будуть записи / можна пропустити заняття?"
4. "Як проходять заняття і скільки часу займає?"
5. "Чи є розстрочка / можна оплатити частинами?"
6. "Що буде після курсу — допомагаєте з роботою?"
7. "Чому не безкоштовні ресурси / відео на YouTube?"

**Hugo partial (`course-faq.html`):**
```html
{{ $c := .course }}
<section class="course-faq" id="faq">
  <div class="container">
    <h2>Часті питання</h2>
    <div class="faq-list">
      {{ range $i, $item := $c.faq }}
      <div class="faq-item">
        <button class="faq-item__question" type="button"
                aria-expanded="false" aria-controls="faq-answer-{{ $i }}">
          {{ .q }}
          <span class="faq-chevron" aria-hidden="true">▼</span>
        </button>
        <div class="faq-item__answer" id="faq-answer-{{ $i }}">
          <p>{{ .a }}</p>
        </div>
      </div>
      {{ end }}
    </div>
  </div>
</section>
```

---

## 10. Footer CTA Bar

**Purpose:** Final conversion attempt before the footer. Repeat the offer simply.

**Copy formula:** One sentence value prop + one CTA button + one social reassurance.

**Hugo partial (`course-cta-bar.html`):**
```html
{{ $c := .course }}
<section class="course-cta-bar">
  <div class="container course-cta-bar__inner">
    <div class="course-cta-bar__text">
      <p>Залиши контакт — розкажу деталі про старт, формат і вартість.</p>
    </div>
    <a class="btn btn--primary"
       href="{{ $c.cta_url }}?utm_source=landing&utm_medium=footer_cta&utm_campaign={{ $c.slug }}">
      Подати заявку →
    </a>
  </div>
</section>
```
