# Conversion Optimization Guide

Practical rules for maximizing lead capture on QAStudy.online course landing pages.

---

## CTA Placement Rules

| Position | Copy | UTM medium |
|---|---|---|
| Hero (above fold) | "Подати заявку →" | `hero` |
| After outcomes section | "Хочу на курс →" | `outcomes_cta` |
| After program section | "Залишити заявку →" | `program_cta` |
| Pricing box | "Подати заявку →" | `pricing` |
| Footer CTA bar | "Подати заявку →" | `footer_cta` |
| Sticky header (mobile) | "Заявка" (short) | `sticky_header` |

**Rule:** Never more than 2 scroll-lengths without a CTA visible.

---

## CTA Copy Bank (Ukrainian)

**Primary — high intent:**
- Подати заявку →
- Залишити заявку →
- Залишити контакт →
- Записатись на курс →

**Secondary — lower commitment:**
- Дізнатись деталі →
- Хочу програму курсу →
- Розкажи мені більше →

**Never use:**
- "Купити" — feels transactional for education
- "Реєстрація" — bureaucratic
- "Клікни тут" — generic

---

## Lead Capture: Google Form Integration

The current QAStudy.online pattern uses Google Forms. Two integration patterns:

### Pattern A: CTA links directly to Google Form (simplest)
```html
<a href="https://forms.gle/XXXX?utm_source=landing&utm_medium=hero&utm_campaign=k6"
   class="btn btn--primary" target="_blank" rel="noopener">
  Подати заявку →
</a>
```
**Pros:** No dev work, existing pattern. **Cons:** leaves the landing page.

### Pattern B: Inline form modal (better conversion)
```html
<!-- Trigger button -->
<button class="btn btn--primary" data-modal="apply-modal">Подати заявку →</button>

<!-- Modal overlay (hidden by default) -->
<div class="apply-modal" id="apply-modal" hidden aria-modal="true" role="dialog">
  <div class="apply-modal__inner">
    <button class="apply-modal__close" aria-label="Закрити">✕</button>
    <h2>Залиш контакт</h2>
    <iframe src="https://docs.google.com/forms/d/e/XXXXX/viewform?embedded=true"
            width="100%" height="520" frameborder="0">
      Завантаження…
    </iframe>
  </div>
</div>
```
**Pros:** Stays on page, trackable. **Cons:** Slight added complexity.

**Recommendation:** Use Pattern A for MVP; add Pattern B if bounce rate is high.

---

## Trust Signal Checklist

Add trust signals at these positions:
- ✅ Group size ("8–12 людей") — under hero or in social proof bar
- ✅ Personal feedback promise — under audience section  
- ✅ Live format ("Живі заняття, не запис") — in format section
- ✅ Price transparency — always show price, never "дізнайся вартість"
- ✅ Installment option — mention near price even if details are on form
- ✅ Instructor credentials — LinkedIn link + real photo
- ✅ Access to recordings — in "what's included"
- ✅ Telegram community link — footer
- ✅ GitHub org link (https://github.com/QAStudyOnline) — shows real code exists

**Optional / future:**
- 🔲 Testimonials from past students (3 cards with name + role + quote)
- 🔲 Employer logos where graduates work
- 🔲 "X people submitted an application this week" (social urgency)

---

## Mobile Optimization Rules

1. **Sticky header CTA** on mobile (≤768px):
```css
@media (max-width: 768px) {
  .site-header .btn--primary-small { display: flex; }
  .site-header                     { position: sticky; top: 0; z-index: 100; }
}
```

2. **Thumb zone**: primary CTA must be ≥ 48px tall, padding ≥ 12px.

3. **Program accordion**: default CLOSED on mobile (all blocks), FIRST OPEN on desktop.
   ```css
   @media (max-width: 768px) {
     .program-block.is-open:first-child { /* first block still starts open */ }
   }
   ```

4. **Pricing box**: stacks vertically (price + what's included + CTA), no side-by-side.

5. **Hero badges**: wrap to 2 lines max; reduce font size below 14px is bad.

---

## Page Speed Rules

- Use Hugo `resources.Get | fingerprint` for CSS/JS
- Images: use Hugo image processing to generate WebP
  ```html
  {{ $img := resources.Get "img/hero-k6.jpg" }}
  {{ $webp := $img.Process "webp" }}
  <img src="{{ $webp.RelPermalink }}" loading="lazy" decoding="async"
       width="{{ $webp.Width }}" height="{{ $webp.Height }}" alt="...">
  ```
- Defer all JS: `<script defer src="...">` — especially accordion and GA
- Google Form iframes: load lazily with `loading="lazy"` attribute
- Inline critical CSS for hero section (< 2KB) to avoid render-blocking

---

## Analytics Events to Implement

Fire these GA4 events via `gtag('event', ...)` or data layer push:

| Event name | Trigger |
|---|---|
| `cta_click` | Any CTA button click (pass `cta_position`, `course_slug`) |
| `program_block_open` | Accordion block opened |
| `pricing_viewed` | Pricing section enters viewport |
| `faq_opened` | FAQ question opened |
| `page_scroll_50` / `page_scroll_90` | Scroll depth milestones |

```javascript
// Example: CTA click tracking
document.querySelectorAll('[data-cta-position]').forEach(btn => {
  btn.addEventListener('click', () => {
    gtag('event', 'cta_click', {
      cta_position: btn.dataset.ctaPosition,
      course_slug:  btn.dataset.courseSlug
    });
  });
});
```
Add `data-cta-position="hero"` and `data-course-slug="{{ $c.slug }}"` to each CTA button.

---

## CSS Design Tokens (match existing site)

```css
:root {
  /* Colors — match qastudy.online */
  --color-bg:          #0f0f0f;
  --color-bg-surface:  #1a1a1a;
  --color-bg-card:     #222222;
  --color-text:        #f0f0f0;
  --color-text-muted:  #9a9a9a;
  --color-accent:      #4f8ef7;   /* primary blue */
  --color-accent-hover:#6ba4ff;
  --color-success:     #22c55e;   /* checkmarks */
  --color-border:      #2e2e2e;

  /* Level badge colors */
  --badge-basic:    #2d4a2d;   /* green */
  --badge-middle:   #2d3a4a;   /* blue */
  --badge-advanced: #4a2d2d;   /* red */

  /* Typography */
  --font-sans: 'Inter', system-ui, sans-serif;
  --font-mono: 'JetBrains Mono', 'Fira Code', monospace;

  /* Layout */
  --container-max: 1100px;
  --section-gap:   80px;
  --card-radius:   12px;
}
```

---

## Program Page Pattern (`/courses/<slug>/program/`)

The full program page (e.g. `/k6-performance-testing-program/`) should be a SEPARATE Hugo content page that:
1. Links back to the course landing: `← Назад до опису курсу`
2. Shows TOC with anchor links to each block
3. Expands ALL blocks (no accordion needed — full content)
4. Repeats CTA at top and bottom
5. Uses same data file (`/data/courses/<slug>.yaml`) — no content duplication

Template: `/layouts/courses/program.html`
Content: `/content/courses/<slug>/program/_index.md` with `layout: "courses/program"`
