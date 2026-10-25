#!/usr/bin/env python3
"""Сторінка «Про школу» → about/index.html. Контент перенесено з qastudy.online/about/ і переписано."""
import html, pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from build_course import footer, ROOT
esc = lambda s: html.escape(str(s), quote=True)

ABOUT = {
  "title": "Школа для QA, які <span class=\"accent\">переросли свою роль</span>",
  "lead": "QAStudy.online — авторська інженерна школа для тестувальників, які вже вміють тестувати і хочуть вийти на рівень Senior, Lead або Architect. Ми не вчимо заходити в IT. Ми даємо те, чого бракує досвідченим: інженерну дисципліну, архітектуру якості та роботу з технологіями, які щойно зайшли в індустрію.",
  "mission_kicker": "01. Наша місія",
  "mission_title": "Стеля QA — не в навичках тестування, <span class=\"accent\">а в мисленні</span>",
  "mission": [
    "Більшість сильних тестувальників зупиняються не тому, що погано тестують. Вони зупиняються, бо ніхто не показав їм системний, інженерний рівень професії: як читати архітектуру як карту ризиків, як будувати стратегію, як тестувати недетерміновані AI-системи, як говорити з бізнесом мовою рішень.",
    "Саме це ми й даємо. Не черговий інструмент, а спосіб мислити на рівень вище — у малих групах, з персональним розбором кожного коду і кожного рішення."
  ],
  "directions_kicker": "02. Напрями",
  "directions_title": "Три напрями — <span class=\"accent\">три наступні ролі</span>",
  "directions": [
    {"tag": "AI Quality", "title": "Agentic QA", "text": "Тестування AI-агентів, LLM і RAG-систем: від першого eval до production CI/CD. Для тих, чий продукт переходить на AI, і для тих, хто впроваджує AI-агентів у власні QA-процеси.", "role": "→ AI Quality Engineer", "url": "../courses/agentic-qa/"},
    {"tag": "Performance Engineering", "title": "Performance Testing with k6", "text": "Навантажувальне тестування, observability та DevOps-інтеграція. Шлях у одні з найвище оплачуваних напрямів: Performance Engineer і SDET.", "role": "→ Performance Engineer / SDET", "url": "../courses/k6-performance-testing/"},
    {"tag": "QA Architecture", "title": "Scale Quality", "text": "QA-архітектура, стратегія, governance і комунікація з C-level. Для переходу Senior → Lead → Head of QA або QA Architect.", "role": "→ QA Architect / Head of QA", "url": "../courses/scale-quality/"}
  ],
  "why_kicker": "03. Чому обирають нас",
  "why_title": "Чотири речі, які ми <span class=\"accent\">не обіцяємо, а робимо</span>",
  "why": [
    {"title": "Практик, а не лектор", "text": "Усі програми веде архітектор, який щодня працює на реальних проєктах у US fintech — і викладає рівно те, що робить сам."},
    {"title": "Робочий артефакт на виході", "text": "Фінальний проєкт кожної програми — тест-стратегія, AI-фреймворк або performance-стек для вашого портфоліо і наступної ролі. Не навчальний кейс."},
    {"title": "Малі групи, персональний фідбек", "text": "Кожен отримує розбір власного коду і рішень особисто від лектора. Місць у групі 8–12."},
    {"title": "Технології, які щойно зайшли в індустрію", "text": "AI-тестування, agentic CI/CD, observability, chaos engineering — те, чого ще немає в більшості курсів."}
  ],
  "mentoring_kicker": "04. Крім програм",
  "mentoring_title": "Менторство і <span class=\"accent\">кар’єрний супровід</span>",
  "mentoring": "Допомагаємо з кар’єрою поза курсами: аудит і побудова QA-стратегії для проєктів та компаній, ревью резюме і LinkedIn, закритий чат з ментором, групові Q&A. Умови — за запитом.",
  "contacts_kicker": "05. Контакти",
  "contacts": [
    {"label": "Email", "value": "qafirststeps@gmail.com", "url": "mailto:qafirststeps@gmail.com"},
    {"label": "Telegram", "value": "@qastudy", "url": "https://t.me/qastudy"},
    {"label": "LinkedIn", "value": "Yehor Maksymchuk", "url": "https://www.linkedin.com/in/yehor-maksymchuk-271039240/"},
    {"label": "YouTube UA", "value": "QAStudy Online", "url": "https://www.youtube.com/@qastudy.online"},
    {"label": "YouTube EN", "value": "AIDevTestOps", "url": "https://www.youtube.com/@AIDevTestOps"},
    {"label": "GitHub", "value": "QAStudyOnline", "url": "https://github.com/QAStudyOnline"}
  ]
}

def header():
    return '''<header class="site-header" id="site-header">
  <div class="container header-inner">
    <a class="brand" href="../" aria-label="QAStudy.online — на головну">
      <span class="brand-name">QAStudy<span class="brand-accent">.online</span></span>
      <span class="brand-sub">Engineering School</span>
    </a>
    <nav class="site-nav" id="site-nav" aria-label="Головна навігація">
      <ul class="nav-list">
        <li><a href="#mission">Місія</a></li>
        <li><a href="#directions">Напрями</a></li>
        <li><a href="#why">Чому ми</a></li>
        <li><a href="../team/yehor-maksymchuk/">Викладач</a></li>
        <li><a href="#contacts">Контакти</a></li>
      </ul>
      <a class="btn btn-outline header-cta" href="../#programs">Обрати програму <span class="arrow" aria-hidden="true">→</span></a>
    </nav>
    <button class="burger" id="burger" type="button" aria-controls="site-nav" aria-expanded="false" aria-label="Відкрити меню"><span></span><span></span><span></span></button>
  </div>
</header>'''

def page(a):
    dirs = "".join(f'''        <a class="related-card glass" href="{esc(d["url"])}">
          <span class="related-head"><span class="col-tag col-tag-accent">{esc(d["tag"])}</span><span class="related-level">{esc(d["role"])}</span></span>
          <span class="related-title">{esc(d["title"])}</span>
          <span class="related-desc">{esc(d["text"])}</span>
          <span class="link-underline">Переглянути програму <span class="arrow" aria-hidden="true">→</span></span>
        </a>''' for d in a["directions"])
    why = "".join(f'<li class="principle"><span class="principle-num">0{i+1}</span><h3 class="h4">{esc(w["title"])}</h3><p class="body body-dark">{esc(w["text"])}</p></li>' for i, w in enumerate(a["why"]))
    contacts = "".join(f'<li><span class="contact-label">{esc(c["label"])}</span><a href="{esc(c["url"])}"{"" if c["url"].startswith("mailto") else " target=\"_blank\" rel=\"noopener\""}>{esc(c["value"])}</a></li>' for c in a["contacts"])
    mission = "".join(f'<p class="lead lead-dark about-p">{esc(p)}</p>' for p in a["mission"])
    return f'''<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Про школу — QAStudy.online</title>
  <meta name="description" content="QAStudy.online — авторська інженерна школа для QA з досвідом: AI Quality, Performance Engineering, QA Architecture. Малі групи, практик-архітектор, робочий артефакт на виході.">
  <link rel="canonical" href="https://qastudy.online/about/">
  <meta name="theme-color" content="#07061A">
  <meta property="og:type" content="website">
  <meta property="og:title" content="Про школу — QAStudy.online">
  <meta property="og:description" content="Інженерна школа для QA, які переросли свою роль.">
  <meta property="og:image" content="https://qastudy.online/assets/img/og-image.jpg">
  <link rel="icon" href="../favicon.svg" type="image/svg+xml">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/course.css">
  <!-- ANALYTICS: вставте GA4 / GTM snippet тут -->
  <script>window.dataLayer = window.dataLayer || [];</script>
</head>
<body class="course-page about-page">
<a class="skip-link" href="#main">Перейти до контенту</a>
{header()}
<main id="main">
  <section class="hero section-dark about-hero" id="hero">
    <span class="deco deco-1" aria-hidden="true"></span>
    <span class="deco deco-2" aria-hidden="true"></span>
    <div class="container course-hero-grid">
      <div class="course-hero-content glass reveal about-card">
        <p class="eyebrow eyebrow-dark">Про школу · QAStudy.online</p>
        <h1 class="h2 about-title">{a["title"]}</h1>
        <p class="lead lead-dark about-lead">{esc(a["lead"])}</p>
        <div class="hero-actions">
          <a class="btn btn-primary btn-lg" href="../#programs">Обрати програму <span class="arrow" aria-hidden="true">→</span></a>
          <a class="link-underline link-light" href="../team/yehor-maksymchuk/">Про викладача</a>
        </div>
      </div>
    </div>
  </section>

  <section class="section section-dark" id="mission">
    <div class="container about-grid">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">{esc(a["mission_kicker"])}</p>
        <h2 class="h2">{a["mission_title"]}</h2>
      </header>
      <div class="about-body reveal">{mission}</div>
    </div>
  </section>

  <section class="section section-dark" id="directions">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">{esc(a["directions_kicker"])}</p>
        <h2 class="h2">{a["directions_title"]}</h2>
      </header>
      <div class="related-grid related-grid-3 reveal">
{dirs}
      </div>
    </div>
  </section>

  <section class="section section-dark" id="why">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">{esc(a["why_kicker"])}</p>
        <h2 class="h2">{a["why_title"]}</h2>
      </header>
      <ol class="principles principles-4 reveal">{why}</ol>
    </div>
  </section>

  <section class="section section-dark" id="mentoring">
    <div class="container about-grid">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">{esc(a["mentoring_kicker"])}</p>
        <h2 class="h2">{a["mentoring_title"]}</h2>
      </header>
      <div class="about-body reveal">
        <p class="lead lead-dark about-p">{esc(a["mentoring"])}</p>
        <a class="btn btn-ghost-dark" href="https://t.me/qastudy" target="_blank" rel="noopener" data-event="telegram_click">Запитати про менторство</a>
      </div>
    </div>
  </section>

  <section class="section section-dark" id="contacts">
    <div class="container about-grid">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">{esc(a["contacts_kicker"])}</p>
        <h2 class="h2">Маєте питання? <span class="accent">Напишіть</span></h2>
      </header>
      <ul class="contacts glass reveal">{contacts}</ul>
    </div>
  </section>
</main>
{footer(base="../", course_base="../courses/", contact_href="https://t.me/qastudy")}
<script src="../assets/js/easter.js" defer></script>
<script src="../assets/js/cursor.js" defer></script>
<script src="../assets/js/exit.js" defer></script>
<script src="../assets/js/course.js" defer></script>
</body>
</html>
'''

if __name__ == "__main__":
    out = ROOT / "about" / "index.html"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(page(ABOUT), encoding="utf-8")
    print("built", out.relative_to(ROOT))
