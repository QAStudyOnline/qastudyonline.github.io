#!/usr/bin/env python3
"""Юридичні сторінки: _dev/legal/<slug>.html (тіло) + meta.json → <slug>/index.html"""
import json, sys, html, pathlib, re
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from build_course import footer, ROOT
esc = lambda s: html.escape(str(s), quote=True)

def header():
    return '''<header class="site-header" id="site-header">
  <div class="container header-inner">
    <a class="brand" href="../" aria-label="QAStudy.online — на головну">
      <span class="brand-name">QAStudy<span class="brand-accent">.online</span></span>
      <span class="brand-sub">Engineering School</span>
    </a>
    <nav class="site-nav" id="site-nav" aria-label="Головна навігація">
      <ul class="nav-list">
        <li><a href="../#programs">Програми</a></li>
        <li><a href="../team/yehor-maksymchuk/">Викладач</a></li>
        <li><a href="../oferta/">Оферта</a></li>
        <li><a href="../privacy/">Конфіденційність</a></li>
        <li><a href="../terms/">Умови</a></li>
      </ul>
      <a class="btn btn-outline header-cta" href="../#programs">Обрати програму <span class="arrow" aria-hidden="true">→</span></a>
    </nav>
    <button class="burger" id="burger" type="button" aria-controls="site-nav" aria-expanded="false" aria-label="Відкрити меню"><span></span><span></span><span></span></button>
  </div>
</header>'''

def toc(body):
    items = re.findall(r"<h2>(.*?)</h2>", body)
    out = []
    for i, t in enumerate(items):
        anchor = f"s-{i+1}"
        body = body.replace(f"<h2>{t}</h2>", f'<h2 id="{anchor}">{t}</h2>', 1)
        out.append(f'<li><a href="#{anchor}">{t}</a></li>')
    return body, "".join(out)

def page(slug, m, body):
    body, toc_html = toc(body)
    return f'''<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{esc(m["title"])} — QAStudy.online</title>
  <meta name="description" content="{esc(m["seo"])}">
  <link rel="canonical" href="https://qastudy.online/{slug}/">
  <meta name="robots" content="noindex, follow">
  <meta name="theme-color" content="#07061A">
  <link rel="icon" href="../favicon.svg" type="image/svg+xml">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/course.css">
  <script>window.dataLayer = window.dataLayer || [];</script>
</head>
<body class="course-page legal-page">
<a class="skip-link" href="#main">Перейти до контенту</a>
{header()}
<main id="main">
  <section class="section section-dark legal-hero" id="hero">
    <div class="container">
      <p class="eyebrow eyebrow-dark">Документи · QAStudy.online</p>
      <h1 class="h2">{esc(m["title"])}</h1>
      <p class="lead lead-dark legal-sub">{esc(m["sub"])}</p>
      {f'<p class="legal-edition">{esc(m["edition"])}</p>' if m.get("edition") else ""}
    </div>
  </section>
  <section class="section section-dark legal-body-section">
    <div class="container legal-grid">
      <nav class="legal-toc glass" aria-label="Зміст"><p class="mini-label mini-label-dark">Зміст</p><ol>{toc_html}</ol></nav>
      <article class="legal-body glass">{body}</article>
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
    meta = json.loads((ROOT / "_dev/legal/meta.json").read_text(encoding="utf-8"))
    for slug, m in meta.items():
        body = (ROOT / f"_dev/legal/{slug}.html").read_text(encoding="utf-8")
        out = ROOT / slug / "index.html"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(page(slug, m, body), encoding="utf-8")
        print("built", out.relative_to(ROOT))
