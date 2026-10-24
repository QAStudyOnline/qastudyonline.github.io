#!/usr/bin/env python3
"""Сторінки-заглушки для URL, контент яких ще не готовий. Дані — STUBS нижче."""
import html, pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from build_course import footer, ROOT
esc = lambda s: html.escape(str(s), quote=True)

STUBS = [
  {"path": "mini-course", "depth": 1, "kicker": "Міні-курс · безкоштовно", "title": "Міні-курс з тестування AI", "eta": "Міні-курс готується",
   "text": "Три короткі уроки для QA: як розкласти AI-систему на ризики, що таке evals і як побудувати перший quality gate у CI/CD. Без реєстрації.",
   "primary": ("Повідомити, коли вийде", "https://t.me/qastudy"), "secondary": ("Повна програма Agentic QA", "../courses/agentic-qa/"), "lamp": "Скоро"},
  {"path": "courses/k6-performance-testing", "depth": 2, "kicker": "Програма · Performance Engineering", "title": "Performance Testing with k6", "eta": "Детальна сторінка програми готується",
   "text": "Навантажувальні тести в k6, дашборди Grafana, performance gates у CI/CD та Kubernetes, chaos testing. 15 занять · 15 тижнів · Middle–Senior.",
   "primary": ("Повідомити про старт", "../../#program-k6"), "secondary": ("Написати в Telegram", "https://t.me/qastudy"), "lamp": "Набір скоро відкриється"},
  {"path": "courses/scale-quality", "depth": 2, "kicker": "Програма · QA Architecture", "title": "Scale Quality", "eta": "Детальна сторінка програми готується",
   "text": "QA-архітектура та стратегія якості: risk-based стратегія за ISO 29119, DORA-метрики, governance, комунікація з бізнесом. 35 занять · ~33 тижні · Senior–Architect.",
   "primary": ("Повідомити про старт", "../../#program-scale-quality"), "secondary": ("Написати в Telegram", "https://t.me/qastudy"), "lamp": "Набір скоро відкриється"},
]

def page(st):
    base = "../" * st["depth"]
    lamp = f'<p class="program-status status-soon course-lamp"><span class="status-dot status-dot-soon" aria-hidden="true"></span>{esc(st["lamp"])}</p>' if st["lamp"] else ""
    ext = ' target="_blank" rel="noopener"' if st["secondary"][1].startswith("http") else ""
    return f'''<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{esc(st["title"])} — QAStudy.online</title>
  <meta name="description" content="{esc(st["text"])}">
  <meta name="robots" content="noindex, follow">
  <link rel="canonical" href="https://qastudy.online/{st["path"]}/">
  <meta name="theme-color" content="#07061A">
  <link rel="icon" href="{base}favicon.svg" type="image/svg+xml">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="{base}assets/css/style.css">
  <link rel="stylesheet" href="{base}assets/css/course.css">
  <script>window.dataLayer = window.dataLayer || [];</script>
</head>
<body class="course-page stub-page">
<a class="skip-link" href="#main">Перейти до контенту</a>
<header class="site-header" id="site-header">
  <div class="container header-inner">
    <a class="brand" href="{base}" aria-label="QAStudy.online — на головну">
      <span class="brand-name">QAStudy<span class="brand-accent">.online</span></span>
      <span class="brand-sub">Engineering School</span>
    </a>
    <nav class="site-nav" id="site-nav" aria-label="Головна навігація">
      <ul class="nav-list">
        <li><a href="{base}#programs">Програми</a></li>
        <li><a href="{base}#why-qastudy">Про школу</a></li>
        <li><a href="{base}#learning">Як навчаємо</a></li>
        <li><a href="{base}team/yehor-maksymchuk/">Викладач</a></li>
        <li><a href="{base}#faq">FAQ</a></li>
      </ul>
      <a class="btn btn-outline header-cta" href="{base}#programs">Обрати програму <span class="arrow" aria-hidden="true">→</span></a>
    </nav>
    <button class="burger" id="burger" type="button" aria-controls="site-nav" aria-expanded="false" aria-label="Відкрити меню"><span></span><span></span><span></span></button>
  </div>
</header>
<main id="main">
  <section class="hero section-dark stub-hero" id="hero">
    <span class="deco deco-1" aria-hidden="true"></span>
    <span class="deco deco-2" aria-hidden="true"></span>
    <div class="container stub-grid">
      <article class="stub-card glass reveal">
        <span class="stamp stamp-status stamp-wip" aria-label="У роботі">Under <br>construction</span>
        <p class="eyebrow eyebrow-dark">{esc(st["kicker"])}</p>
        <p class="stub-ups">UPS. <span class="accent">Unexpected result</span></p>
        <h1 class="h2 stub-title">{esc(st["title"])}</h1>
        {lamp}
        <p class="stub-eta"><span class="stub-eta-label">Status</span>{esc(st["eta"])}. Expected: повний контент. Actual: ця сторінка.</p>
        <p class="lead lead-dark stub-text">{esc(st["text"])}</p>
        <div class="hero-actions">
          <a class="btn btn-primary btn-lg" href="{esc(st["primary"][1])}">{esc(st["primary"][0])} <span class="arrow" aria-hidden="true">→</span></a>
          <a class="link-underline link-light" href="{esc(st["secondary"][1])}"{ext}>{esc(st["secondary"][0])}</a>
        </div>
      </article>
    </div>
  </section>
</main>
{footer(base=base, course_base=base + "courses/", contact_href="https://t.me/qastudy")}
<script src="{base}assets/js/easter.js" defer></script>
<script src="{base}assets/js/cursor.js" defer></script>
<script src="{base}assets/js/exit.js" defer></script>
<script src="{base}assets/js/course.js" defer></script>
</body>
</html>
'''

if __name__ == "__main__":
    for st in STUBS:
        out = ROOT / st["path"] / "index.html"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(page(st), encoding="utf-8")
        print("built stub", out.relative_to(ROOT))
