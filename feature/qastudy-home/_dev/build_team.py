#!/usr/bin/env python3
"""Сторінка викладача: _dev/team/<slug>.json → team/<slug>/index.html
Використання: python3 _dev/build_team.py _dev/team/yehor-maksymchuk.json"""
import json, sys, html, pathlib
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from build_course import footer, ROOT
esc = lambda s: html.escape(str(s), quote=True)

def header():
    return '''<header class="site-header" id="site-header">
  <div class="container header-inner">
    <a class="brand" href="../../" aria-label="QAStudy.online — на головну">
      <span class="brand-name">QAStudy<span class="brand-accent">.online</span></span>
      <span class="brand-sub">Engineering School</span>
    </a>
    <nav class="site-nav" id="site-nav" aria-label="Головна навігація">
      <ul class="nav-list">
        <li><a href="#about">Про мене</a></li>
        <li><a href="#numbers">У цифрах</a></li>
        <li><a href="#certs">Сертифікації</a></li>
        <li><a href="#courses">Програми</a></li>
        <li><a href="#stack">Стек</a></li>
      </ul>
      <a class="btn btn-outline header-cta" href="#courses" data-event="team_programs_click">Обрати програму <span class="arrow" aria-hidden="true">→</span></a>
    </nav>
    <button class="burger" id="burger" type="button" aria-controls="site-nav" aria-expanded="false" aria-label="Відкрити меню"><span></span><span></span><span></span></button>
  </div>
</header>'''

ICONS = {
 "card":   '<svg viewBox="0 0 24 24"><rect x="3" y="6" width="18" height="12" rx="2"/><path d="M3 10h18M7 14h4"/></svg>',
 "health": '<svg viewBox="0 0 24 24"><path d="M12 4v16M4 12h16"/><rect x="4" y="4" width="16" height="16" rx="3"/></svg>',
 "cart":   '<svg viewBox="0 0 24 24"><path d="M3 4h2l2.4 10.5a1 1 0 001 .8h8.9a1 1 0 001-.8L20 7H6"/><circle cx="9" cy="19" r="1.4"/><circle cx="17" cy="19" r="1.4"/></svg>',
 "cog":    '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M12 2v3M12 19v3M2 12h3M19 12h3M4.9 4.9l2.1 2.1M17 17l2.1 2.1M4.9 19.1L7 17M17 7l2.1-2.1"/></svg>',
 "dice":   '<svg viewBox="0 0 24 24"><rect x="4" y="4" width="16" height="16" rx="3"/><circle cx="9" cy="9" r="1.2" fill="currentColor"/><circle cx="15" cy="15" r="1.2" fill="currentColor"/><circle cx="15" cy="9" r="1.2" fill="currentColor"/><circle cx="9" cy="15" r="1.2" fill="currentColor"/></svg>',
 "gov":    '<svg viewBox="0 0 24 24"><path d="M3 21h18M5 21V10M19 21V10M9 21v-6h6v6M2 10l10-6 10 6"/></svg>',
}

def social(d, cls="founder-social"):
    return f'<ul class="{cls}">' + "".join(f'<li><a href="{esc(s["url"])}" target="_blank" rel="noopener" data-event="founder_social_click" data-network="{esc(s["name"]).lower()}">{esc(s["name"])}</a></li>' for s in d["social"]) + '</ul>'

def page(d):
    facts = " · ".join(esc(f) for f in d["facts_line"])
    numbers = "".join(f'<li class="num-tile glass"><strong>{esc(n["value"])}</strong><span>{esc(n["label"])}</span></li>' for n in d["numbers"])
    companies = "".join(f'<li class="company-tile"><span class="company-mark">{esc(c["name"])}</span><span class="company-note">{esc(c["note"])}</span></li>' for c in d["companies"])
    domains = "".join(f'<li class="domain-tile"><span class="domain-icon" aria-hidden="true">{ICONS.get(x["icon"], "")}</span>{esc(x["name"])}</li>' for x in d["domains"])
    edu = d["education"]
    certs = "".join(f'''        <li class="cert glass">
          <img src="../../assets/img/{esc(c["img"])}" width="72" height="72" loading="lazy" alt="{esc(c["title"])}">
          <div class="cert-body">
            <p class="cert-title">{esc(c["title"])}</p>
            <p class="cert-issuer">{esc(c["issuer"])}</p>
            <a class="link-underline cert-link" href="{esc(c["url"])}" target="_blank" rel="noopener">Перевірити <span class="arrow" aria-hidden="true">→</span></a>
          </div>
        </li>''' for c in d["certifications"])
    courses = "".join(f'''        <a class="related-card glass" href="{esc(c["url"])}" data-event="team_course_click">
          <span class="related-head"><span class="col-tag col-tag-accent">{esc(c["direction"])}</span><span class="related-level">{esc(c["level"])}</span></span>
          <span class="related-title">{esc(c["title"])}</span>
          <span class="related-desc">{esc(c["desc"])}</span>
          <span class="link-underline">Переглянути програму <span class="arrow" aria-hidden="true">→</span></span>
        </a>''' for c in d["courses"])
    stack = "".join(f'<div class="stack-group"><p class="stack-group-name">{esc(g["group"])}</p><ul class="tools">{"".join(f"<li class=\"tool\">{esc(t)}</li>" for t in g["items"])}</ul></div>' for g in d["stack"])
    about = "".join(f'<p class="body body-dark about-p">{esc(p)}</p>' for p in d["about"])
    jsonld = json.dumps({"@context": "https://schema.org", "@type": "Person", "name": d["name_latin"], "alternateName": d["name"],
        "jobTitle": "QA & Performance Architect", "worksFor": {"@type": "Organization", "name": "QAStudy.online"},
        "url": "https://qastudy.online" + d["url"], "sameAs": [s["url"] for s in d["social"]]}, ensure_ascii=False, indent=2)
    return f'''<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{esc(d["seo_title"])}</title>
  <meta name="description" content="{esc(d["seo_description"])}">
  <link rel="canonical" href="https://qastudy.online{esc(d["url"])}">
  <meta name="theme-color" content="#07061A">
  <meta property="og:type" content="profile">
  <meta property="og:site_name" content="QAStudy.online">
  <meta property="og:title" content="{esc(d["name"])} — {esc(d["position"])}">
  <meta property="og:description" content="{esc(d["intro"])}">
  <meta property="og:image" content="https://qastudy.online/assets/img/founder.webp">
  <meta name="twitter:card" content="summary_large_image">
  <link rel="icon" href="../../favicon.svg" type="image/svg+xml">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link rel="stylesheet" href="../../assets/css/course.css">
  <script type="application/ld+json">
{jsonld}
  </script>
  <!-- ANALYTICS: вставте GA4 / GTM snippet тут -->
  <script>window.dataLayer = window.dataLayer || [];</script>
</head>
<body class="course-page team-page">
<a class="skip-link" href="#main">Перейти до контенту</a>
{header()}
<main id="main">
  <section class="hero section-dark team-hero" id="hero">
    <span class="deco deco-1" aria-hidden="true"></span>
    <span class="deco deco-2" aria-hidden="true"></span>
    <div class="container team-hero-grid">
      <div class="team-photo reveal">
        <img src="../../assets/img/founder.webp" width="540" height="851" alt="{esc(d["name"])} — {esc(d["position"])}" fetchpriority="high" decoding="async">
      </div>
      <div class="team-hero-content glass reveal">
        <p class="eyebrow eyebrow-dark">Засновник і викладач · QAStudy.online</p>
        <h1 class="hero-title team-name">{esc(d["name"])}</h1>
        <p class="team-position">{esc(d["position"])}</p>
        <p class="team-facts">{facts}</p>
        <p class="lead lead-dark team-intro">{esc(d["intro"])}</p>
        <div class="hero-actions">
          <a class="btn btn-primary btn-lg" href="#courses" data-event="team_programs_click">Переглянути програми <span class="arrow" aria-hidden="true">→</span></a>
          <a class="btn btn-ghost-dark btn-lg" href="https://t.me/qastudy" target="_blank" rel="noopener" data-event="telegram_click">Написати в Telegram</a>
        </div>
        {social(d, "team-social")}
      </div>
    </div>
  </section>

  <section class="section section-dark" id="about">
    <div class="container about-grid">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">01. Коротко про мене</p>
        <h2 class="h2">Від ручного тестувальника <br>до <span class="accent">QA-архітектора</span></h2>
      </header>
      <div class="about-body reveal">
        {about}
        <div class="now glass">
          <p class="mini-label mini-label-dark">{esc(d["now"]["title"])}</p>
          <p class="body body-dark">{esc(d["now"]["text"])}</p>
        </div>
      </div>
    </div>
  </section>

  <section class="section section-dark" id="numbers">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">02. У цифрах</p>
        <h2 class="h2">Досвід, який <span class="accent">можна порахувати</span></h2>
      </header>
      <ul class="num-tiles reveal">{numbers}</ul>
      <div class="num-meta reveal">
        <div class="num-meta-col"><p class="mini-label mini-label-dark">Компанії</p><ul class="companies">{companies}</ul></div>
        <div class="num-meta-col"><p class="mini-label mini-label-dark">Домени</p><ul class="domains">{domains}</ul></div>
        <div class="num-meta-col edu-card">
          <p class="mini-label mini-label-dark">Освіта</p>
          <span class="edu-icon" aria-hidden="true"><svg viewBox="0 0 24 24"><path d="M2 9l10-5 10 5-10 5z"/><path d="M6 11v5c0 1.5 3 3 6 3s6-1.5 6-3v-5M22 9v6"/></svg></span>
          <p class="edu-degree">{esc(edu["degree"])}</p>
          <p class="edu-school">{esc(edu["school"])}</p>
        </div>
      </div>
    </div>
  </section>

  <section class="section section-dark" id="certs">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">03. Сертифікації</p>
        <h2 class="h2">{len(d["certifications"])} сертифікацій — <br>кожну можна <span class="accent">перевірити</span></h2>
      </header>
      <ul class="certs reveal">
{certs}
      </ul>
    </div>
  </section>

  <section class="section section-dark" id="courses">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">04. Програми</p>
        <h2 class="h2">Навчальні програми <br>з робочого столу <span class="accent">QA-архітектора</span></h2>
      </header>
      <div class="related-grid related-grid-3 reveal">
{courses}
      </div>
    </div>
  </section>

  <section class="section section-dark" id="stack">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">05. Технічний стек</p>
        <h2 class="h2">Інструменти, які <br>використовує <span class="accent">в роботі</span></h2>
      </header>
      <div class="stack-groups stack-groups-6 reveal">{stack}</div>
    </div>
  </section>

  <section class="section section-dark team-quote-section" id="quote">
    <span class="deco deco-3" aria-hidden="true"></span>
    <div class="container">
      <blockquote class="team-quote glass reveal">
        <p>«{esc(d["quote"])}»</p>
        <footer>— {esc(d["name"])}</footer>
      </blockquote>
      <div class="team-cta reveal">
        <a class="btn btn-primary btn-lg" href="#courses" data-event="team_programs_click">Обрати програму <span class="arrow" aria-hidden="true">→</span></a>
        <a class="link-underline link-light" href="https://t.me/qastudy" target="_blank" rel="noopener" data-event="telegram_click">Написати Єгору в Telegram</a>
      </div>
    </div>
  </section>
</main>
{footer(base="../../", course_base="../../courses/", contact_href="https://t.me/qastudy")}
<script src="../../assets/js/easter.js" defer></script>
<script src="../../assets/js/cursor.js" defer></script>
<script src="../../assets/js/exit.js" defer></script>
<script src="../../assets/js/course.js" defer></script>
</body>
</html>
'''

if __name__ == "__main__":
    src = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else ROOT / "_dev/team/yehor-maksymchuk.json")
    d = json.loads(src.read_text(encoding="utf-8"))
    out = ROOT / "team" / d["slug"] / "index.html"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(page(d), encoding="utf-8")
    print("built", out.relative_to(ROOT))
