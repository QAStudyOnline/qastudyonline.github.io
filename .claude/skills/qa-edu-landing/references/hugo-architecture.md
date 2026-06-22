# Hugo Architecture for QAStudy.online Course Landing Pages

## Directory Layout

```
qastudy.online/
├── config.toml (or hugo.yaml)
├── content/
│   └── courses/
│       ├── agentic-qa/
│       │   └── _index.md          ← front matter only
│       └── k6-performance-testing/
│           └── _index.md
├── data/
│   └── courses/
│       ├── agentic-qa.yaml        ← ALL course content lives here
│       └── k6-performance-testing.yaml
├── layouts/
│   ├── _default/
│   │   └── baseof.html
│   ├── courses/
│   │   └── single.html            ← course landing layout
│   └── partials/
│       ├── course-hero.html
│       ├── course-audience.html
│       ├── course-outcomes.html
│       ├── course-program.html
│       ├── course-project.html
│       ├── course-instructor.html
│       ├── course-pricing.html
│       ├── course-faq.html
│       └── course-cta-bar.html
├── assets/
│   └── css/
│       ├── main.css
│       └── course.css             ← course-page scoped styles
└── static/
    └── img/
        └── courses/
            ├── agentic-qa-og.png  ← 1200×630 OG image
            └── k6-og.png
```

---

## Data File Schema (`/data/courses/<slug>.yaml`)

```yaml
# ── Meta ──────────────────────────────────────────
slug: k6-performance-testing
title: Performance Testing з k6
subtitle: >
  Практичний курс для DevOps та QA: пишіть навантажувальні тести в k6,
  будуйте дашборди в Grafana, інтегруйте перформенс тестування в CI/CD.
level: Middle–Senior
lessons_count: 15
weeks: "8–10"
format: "Теорія + практика + ДЗ на кожному занятті"
group_size: "8–12 людей"
price_uah: 33000
price_per_lesson: 2200
cta_url: "https://forms.gle/REPLACE_ME"
og_image: "/img/courses/k6-og.png"
meta_description: >
  Практичний курс з навантажувального тестування на k6 для DevOps та QA:
  15 занять, від НФР до Chaos Engineering.

# ── Hero badges (shown under headline) ────────────
badges:
  - "15 занять"
  - "Middle–Senior"
  - "Практика + ДЗ"

# ── Target audience (persona cards) ───────────────
personas:
  - role: "QA-інженер (middle/senior)"
    pain: >
      «Я вмію тестувати функціонал, але коли мене питають
      "а як воно поводиться під навантаженням" — губляюсь і не знаю, з чого почати»
    outcome: >
      Навчишся формулювати НФР, писати k6-тести та знаходити
      регресії перформенсу до релізу.
  - role: "DevOps-інженер (middle/senior)"
    pain: >
      «У нас є CI/CD і моніторинг, але перформенс тести хтось
      запускає вручну раз на квартал»
    outcome: >
      Збудуєш observability-стек, вбудуєш k6 у CI/CD як gate
      та запустиш розподілені тести в Kubernetes.

# ── Learning outcomes ─────────────────────────────
outcomes:
  - icon: "📋"
    title: "НФР і процес"
    description: "Формулювати НФР і будувати процес перформенс тестування на проєкті."
  - icon: "⚡"
    title: "Тести в k6"
    description: "Писати якісні навантажувальні тести в k6, включно з AI-генерацією."
  - icon: "📊"
    title: "Аналіз метрик"
    description: "Глибоко аналізувати метрики через InfluxDB (InfluxQL) та Prometheus (PromQL)."
  - icon: "🖥️"
    title: "Дашборди Grafana"
    description: "Будувати дашборди в Grafana з порівнянням run-to-run."
  - icon: "🔗"
    title: "CI/CD та Kubernetes"
    description: "Інтегрувати k6 в CI/CD та запускати розподілені тести в Kubernetes."
  - icon: "🤖"
    title: "AI-аналіз і Chaos"
    description: "Підключати AI-агента для аналізу результатів і робити Chaos Testing."

# ── Course program ────────────────────────────────
blocks:
  - id: 1
    title: "Основи процесу перформенс тестування"
    level: "базовий рівень"
    lessons:
      - number: 1
        title: "НФР та побудова процесу перформенс тестування на проєкті"
  - id: 2
    title: "k6 — написання тестів, дашборди та AI-генерація"
    level: "середній рівень"
    lessons:
      - number: 2
        title: "Writing Tests, Key Metrics"
      - number: 3
        title: "Default Dashboard (k6 dashboard extension та Grafana)"
      - number: 4
        title: "AI-Powered Test Generation"
  - id: 3
    title: "Observability та метрики: InfluxDB, Prometheus, Grafana"
    level: "середній рівень"
    lessons:
      - number: 5
        title: "Концепція Observability: ключові метрики та компоненти"
      - number: 6
        title: "InfluxDB як metric storage та InfluxQL"
      - number: 7
        title: "Prometheus як metric storage та PromQL"
      - number: 8
        title: "Grafana: інтеграція з Influx і Prometheus"
      - number: 9
        title: "k6: відправка метрик з tags, groups та fields"
  - id: 4
    title: "Просунуте перформенс тестування та DevOps-інтеграція"
    level: "просунутий"
    lessons:
      - number: 10
        title: "UI Performance Testing з k6 browser"
      - number: 11
        title: "Дашборд порівняння між запусками"
      - number: 12
        title: "CI/CD інтеграція"
      - number: 13
        title: "Запуск k6-тестів у Kubernetes з k6-operator"
      - number: 14
        title: "AI-агент з Grafana MSP для аналізу результатів"
      - number: 15
        title: "Chaos Testing разом з xk6-disruptor"

# ── Final project deliverables ────────────────────
final_project:
  intro: >
    Студент проходить повний цикл перформенс тестування з реальним стеком і здає:
  deliverables:
    - "НФР та процес — документ з НФР для 3–5 сценаріїв + опис процесу"
    - "Протокольні k6-тести — мінімум 3 сценарії з checks і thresholds"
    - "Browser-тест — k6 browser-тест з вимірюванням Web Vitals"
    - "Observability-стек — custom load-профіль, метрики в InfluxDB та Prometheus"
    - "Дашборди — стандартний + кастомний + порівняльний (run-to-run)"
    - "CI/CD пайплайн — k6-тести з thresholds як gate"
    - "Kubernetes-запуск — TestRun через k6-operator"
    - "AI-аналіз — звіт від AI-агента (Grafana MSP)"
    - "Chaos-експеримент — load-тест + xk6-disruptor, звіт про стійкість"

# ── Pricing: what's included ──────────────────────
includes:
  - "Всі матеріали курсу: презентації, код прикладів, нотатки"
  - "Практика + домашнє завдання на кожному занятті"
  - "Фідбек на кожне домашнє завдання"
  - "Ревʼю фінального проєкту з лектором"
  - "Доступ до записів занять"
  - "Виконаний фінальний проект: повний перформенс-стек"

# ── FAQ ───────────────────────────────────────────
faq:
  - q: "Чи підходить курс мені без досвіду перформенс тестування?"
    a: >
      Так, якщо ти QA middle+ або DevOps з досвідом CI/CD. Навики JS/TS допомагають,
      але не обовʼязкові — перший блок закриває всі основи.
  - q: "Коли стартує наступна група?"
    a: >
      Залиши заявку — розкажу дату старту, формат і залишені місця.
  - q: "Чи будуть записи занять?"
    a: >
      Так, доступ до всіх записів входить у вартість курсу.
  - q: "Як проходить навчання?"
    a: >
      Онлайн, у живому форматі. Кожне заняття: теорія + практика на занятті + ДЗ.
      Група 8–12 людей — персональний фідбек на кожне завдання.
  - q: "Чи є розстрочка?"
    a: >
      Так, розстрочка доступна — уточни деталі при подачі заявки.

# ── Instructor ────────────────────────────────────
instructor:
  name: "Єгор Максимчук"
  photo: "/img/instructor.jpg"   # replace with actual path
  title: "Founder · QAStudy.online"
  bio: >
    QA-практик з реальним досвідом у перформенс тестуванні, observability-стеках
    і побудові CI/CD пайплайнів. Проводить живі заняття з фідбеком, а не
    записані відео-курси.
  linkedin: "https://www.linkedin.com/in/yehor-maksymchuk-271039240/"
  telegram: "https://t.me/qastudy"
```

---

## Content File (`/content/courses/k6-performance-testing/_index.md`)

```yaml
---
title: "Performance Testing з k6"
description: >
  Практичний курс з навантажувального тестування на k6 для DevOps та QA.
  15 занять від НФР до Chaos Engineering.
layout: "course"
slug: "k6-performance-testing"
params:
  course_data: "k6-performance-testing"   # key into /data/courses/
---
```

---

## Layout Template (`/layouts/courses/single.html`)

```html
{{ define "main" }}
{{ $course := index .Site.Data.courses (.Params.course_data | default .File.ContentBaseName) }}
<div class="course-page" data-course="{{ $course.slug }}">
  {{ partial "course-hero.html"       (dict "course" $course "page" .) }}
  {{ partial "course-audience.html"   (dict "course" $course) }}
  {{ partial "course-outcomes.html"   (dict "course" $course) }}
  {{ partial "course-social-proof.html" (dict "course" $course) }}
  {{ partial "course-program.html"    (dict "course" $course) }}
  {{ partial "course-project.html"    (dict "course" $course) }}
  {{ partial "course-instructor.html" (dict "course" $course) }}
  {{ partial "course-pricing.html"    (dict "course" $course) }}
  {{ partial "course-faq.html"        (dict "course" $course) }}
  {{ partial "course-cta-bar.html"    (dict "course" $course) }}
</div>
{{ end }}
```

---

## SEO / Head (`/layouts/partials/head.html` additions)

```html
<!-- OG tags -->
<meta property="og:title"       content="{{ $course.title }} | QAStudy.online">
<meta property="og:description" content="{{ $course.meta_description }}">
<meta property="og:image"       content="{{ $course.og_image | absURL }}">
<meta property="og:type"        content="website">
<meta property="og:url"         content="{{ .Permalink }}">

<!-- JSON-LD Course schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Course",
  "name": "{{ $course.title }}",
  "description": "{{ $course.meta_description }}",
  "provider": {
    "@type": "Organization",
    "name": "QAStudy.online",
    "sameAs": "https://qastudy.online"
  },
  "offers": {
    "@type": "Offer",
    "price": "{{ $course.price_uah }}",
    "priceCurrency": "UAH"
  }
}
</script>
```

---

## Accordion JS (vanilla, progressive enhancement)

Place in `/assets/js/course-accordion.js`:

```javascript
document.querySelectorAll('.program-block__header').forEach(header => {
  header.addEventListener('click', () => {
    const block = header.closest('.program-block');
    const isOpen = block.classList.contains('is-open');
    // close all
    document.querySelectorAll('.program-block').forEach(b => b.classList.remove('is-open'));
    if (!isOpen) block.classList.add('is-open');
  });
});
// Open first block by default
const first = document.querySelector('.program-block');
if (first) first.classList.add('is-open');
```

Hugo pipe usage in template: `{{ $js := resources.Get "js/course-accordion.js" | minify }}`
