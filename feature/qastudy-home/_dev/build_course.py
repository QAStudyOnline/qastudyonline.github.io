#!/usr/bin/env python3
"""Генератор сторінки програми: _dev/courses/<slug>.json → courses/<slug>/index.html
Використання:  python3 _dev/build_course.py _dev/courses/agentic-qa.json
Шаблон — функції нижче. Дані — тільки в JSON. Порожні блоки (cohort, price) не рендеряться."""
import json, sys, html, pathlib, re

ROOT = pathlib.Path(__file__).resolve().parent.parent
esc = lambda s: html.escape(str(s), quote=True)

ICON_TG = '<svg class="ico" viewBox="0 0 24 24" aria-hidden="true"><path d="M21 4L3 11.2l6.4 2.2L18 7l-6.6 7.6.4 5.4 3-3.3 4.4 3.3L21 4z" fill="currentColor"/></svg>'

def li(items, cls=""):
    c = f' class="{cls}"' if cls else ""
    return "".join(f"<li{c}>{esc(x)}</li>" for x in items)

def header():
    return f'''<header class="site-header" id="site-header">
  <div class="container header-inner">
    <a class="brand" href="../../" aria-label="QAStudy.online — на головну">
      <span class="brand-name">QAStudy<span class="brand-accent">.online</span></span>
      <span class="brand-sub">Engineering School</span>
    </a>
    <nav class="site-nav" id="site-nav" aria-label="Головна навігація">
      <ul class="nav-list">
        <li><a href="#program">Програма</a></li>
        <li><a href="#project">Проєкт</a></li>
        <li><a href="#format">Формат</a></li>
        <li><a href="#price">Вартість</a></li>
        <li><a href="#faq">FAQ</a></li>
      </ul>
      <a class="btn btn-outline header-cta" href="#apply" data-event="course_apply_click" data-place="header">Подати заявку <span class="arrow" aria-hidden="true">→</span></a>
    </nav>
    <button class="burger" id="burger" type="button" aria-controls="site-nav" aria-expanded="false" aria-label="Відкрити меню"><span></span><span></span><span></span></button>
  </div>
</header>'''

def lamp(d, place="hero"):
    e = d.get("enrollment")
    if not e: return ""
    cls = "status-dot-open" if e["state"] == "open" else "status-dot-soon"
    tone = "" if e["state"] == "open" else " status-soon"
    return f'<p class="program-status course-lamp{tone}"><span class="status-dot {cls}" aria-hidden="true"></span>{esc(e["label"])}</p>'

def seats(d):
    c = d.get("cohort") or {}
    total, taken = c.get("seats_total"), c.get("seats_taken")
    if not total or taken is None: return ""
    icons = "".join(f'<span class="seat{" seat-taken" if i < taken else ""}" aria-hidden="true"><svg viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21c0-4 3.6-7 8-7s8 3 8 7"/></svg></span>' for i in range(total))
    left = total - taken
    return f'''<div class="seats" role="group" aria-label="Заповненість групи">
          <div class="seats-row">{icons}<a class="seat seat-add" href="#apply" data-event="course_apply_click" data-place="seats" aria-label="Приєднатися до групи">+</a></div>
          <p class="seats-text"><strong>{taken} із {total}</strong> місць у групі зайнято · залишилось {left}</p>
        </div>'''

def hero(d):
    path = "".join(f"<li>{esc(x)}</li>" for x in d["level_path"])
    meta = "".join(f'<li><span class="cmeta-label">{esc(m["label"])}</span><span class="cmeta-value">{esc(m["value"])}</span></li>' for m in d["meta"])
    return f'''  <section class="hero section-dark course-hero" id="hero">
    <span class="deco deco-1" aria-hidden="true"></span>
    <span class="deco deco-2" aria-hidden="true"></span>
    <div class="container course-hero-grid">
      <div class="course-hero-content glass reveal">
        <p class="eyebrow eyebrow-dark">Програма · {esc(d["direction"])}</p>
        {lamp(d, "hero")}
        <h1 class="hero-title course-title">{esc(d["title"])}</h1>
        <p class="course-transition">{esc(d["transition"])}</p>
        <p class="lead lead-dark course-promise">{esc(d["promise"])}</p>
        <ul class="cmeta">{meta}</ul>
        <div class="hero-actions">
          <a class="btn btn-primary btn-lg" href="#apply" data-event="course_apply_click" data-place="hero">Подати заявку <span class="arrow" aria-hidden="true">→</span></a>
          <a class="link-underline link-light" href="#program">Програма курсу ↓</a>
        </div>
        {seats(d)}
        <ol class="level-path course-path" aria-label="Рівні">{path}</ol>
      </div>
    </div>
  </section>'''

def personas(d):
    cards = "".join(f'''        <article class="persona glass">
          <p class="persona-role">{esc(p["role"])}</p>
          <blockquote class="situation situation-dark">{esc(p["quote"])}</blockquote>
          <p class="mini-label mini-label-dark">Навчитеся</p>
          <p class="body body-dark">{esc(p["outcome"])}</p>
        </article>''' for p in d["personas"])
    return f'''  <section class="section section-dark" id="for-whom">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">01. Для кого</p>
        <h2 class="h2">Три ситуації, з якими <br>приходять на <span class="accent">{esc(d["title"])}</span></h2>
      </header>
      <div class="personas reveal">
{cards}
      </div>
    </div>
  </section>'''

def skills(d):
    tiles = "".join(f'<li class="skill-tile glass"><span class="skill-idx">{i+1:02d}</span><span class="skill-text">{esc(s)}</span></li>' for i, s in enumerate(d["skills"]))
    return f'''  <section class="section section-dark" id="skills">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">02. Результат</p>
        <h2 class="h2">Вісім речей, які ви <br>зможете робити <span class="accent">після курсу</span></h2>
      </header>
      <ol class="skill-tiles reveal">{tiles}</ol>
    </div>
  </section>'''

def program(d):
    mods = []
    total_lessons = sum(len(m["lessons"]) for m in d["modules"])
    for i, m in enumerate(d["modules"]):
        lessons = "".join(f'''            <li class="lesson">
              <span class="lesson-n">Заняття {esc(l["n"])}</span>
              <div><p class="lesson-title">{esc(l["title"])}</p><p class="lesson-desc">{esc(l["desc"])}</p></div>
            </li>''' for l in m["lessons"])
        arts = " · ".join(esc(a) for a in m["artifacts"])
        mods.append(f'''      <details class="module module-{esc(m["color"])}"{" open" if i == 0 else ""}>
        <summary>
          <span class="module-num">{m["num"]}</span>
          <span class="module-head">
            <span class="module-title">{esc(m["title"])}</span>
            <span class="module-meta">{esc(m["lessons_count"])} · {arts}</span>
          </span>
          <span class="module-tag">Модуль {m["num"]}</span>
          <span class="module-chevron" aria-hidden="true"></span>
        </summary>
        <div class="module-body">
          <ol class="lessons">
{lessons}
          </ol>
          <div class="module-foot">
            <div class="module-milestone"><span class="mf-icon" aria-hidden="true">⚑</span><div><span class="mf-label">Milestone модуля</span><strong>«{esc(m["milestone"])}»</strong></div></div>
            <div class="module-output"><span class="mf-icon" aria-hidden="true">◈</span><div><span class="mf-label">Результат модуля</span><span>{esc(m["output"])}</span></div></div>
          </div>
        </div>
      </details>''')
    return f'''  <section class="section section-dark program-section" id="program">
    <div class="container">
      <header class="section-head section-head-center reveal">
        <p class="eyebrow eyebrow-dark eyebrow-center">03. Програма курсу</p>
        <h2 class="h2">{len(d["modules"])} модулів <span class="accent">{esc(d["title"])}</span></h2>
        <p class="program-facts">{esc(d.get("lessons_total", total_lessons))} занять · Практичні завдання · Фінальний проєкт</p>
        <p class="section-support section-support-dark section-support-center">{esc(d["program_intro"])}</p>
        <button class="link-underline toggle-all" type="button" id="toggle-all" data-open="Розгорнути всі модулі" data-close="Згорнути всі">Розгорнути всі модулі</button>
      </header>
      <div class="modules reveal">
{"".join(mods)}
      </div>
    </div>
  </section>'''

def project_title(t):
    t = esc(t)
    return t.replace(' Project', ' <span class="accent">Project</span>') if ' Project' in t else t

def project(d):
    p = d["project"]
    rows = "".join(f'<li><code class="repo-name">{esc(i["name"])}</code><span class="repo-desc">{esc(i["desc"])}</span></li>' for i in p["items"])
    return f'''  <section class="section section-dark" id="project">
    <div class="container project-grid">
      <div class="reveal">
        <p class="eyebrow eyebrow-dark">04. Фінальний проєкт</p>
        <h2 class="h2">{project_title(p["title"])}</h2>
        <p class="section-support section-support-dark">{esc(p["intro"])}</p>
      </div>
      <div class="repo glass reveal">
        <div class="repo-bar"><span></span><span></span><span></span><span class="repo-path">github.com/you/{esc(d["slug"])}-project</span></div>
        <ul class="repo-list">{rows}</ul>
      </div>
    </div>
  </section>'''

def stack_groups(groups):
    out = []
    for g in groups:
        tiles = "".join(f'<li class="tool">{esc(t)}</li>' for t in g["items"])
        out.append(f'<div class="stack-group"><p class="stack-group-name">{esc(g["group"])}</p><ul class="tools">{tiles}</ul></div>')
    return "".join(out)

def fmt(d):
    cards = "".join(f'<li class="format-item glass"><strong>{esc(f["title"])}</strong><span>{esc(f["desc"])}</span></li>' for f in d["format"])
    return f'''  <section class="section section-dark" id="format">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">05. Як проходить навчання</p>
        <h2 class="h2">Формат, у якому <br>доводять <span class="accent">до результату</span></h2>
      </header>
      <ul class="format-list reveal">{cards}</ul>
      <div class="stack reveal">
        <div class="stack-head"><p class="eyebrow eyebrow-dark">Стек курсу</p><p class="stack-note">Тільки те, що працює у production — без «оглядових» інструментів</p></div>
        <div class="stack-groups">{stack_groups(d["stack"])}</div>
      </div>
    </div>
  </section>'''

def instructor(d):
    return f'''  <section class="section section-dark founder" id="founder">
    <div class="container founder-grid">
      <div class="founder-photo reveal">
        <img src="../../assets/img/founder.webp" width="540" height="851" loading="lazy" decoding="async" alt="Єгор Максимчук — автор і лектор програми">
      </div>
      <div class="founder-content reveal">
        <p class="eyebrow eyebrow-dark">06. Викладач</p>
        <h2 class="h2">Автор програми <br>і лектор — <span class="accent">Єгор Максимчук</span></h2>
        <p class="founder-position">QA &amp; Performance Architect · AI Agent Development &amp; Testing · 14+ років в IT</p>
        <p class="body body-dark">{esc(d["instructor_line"])}</p>
        <ul class="proof-list">
          <li><strong>14+</strong><span>років в IT</span></li>
          <li><strong>22</strong><span>скрам-команди у зоні відповідальності</span></li>
          <li><strong>6</strong><span>доменів — від fintech до держсектору</span></li>
          <li><strong>US fintech</strong><span>Performance Architect зараз</span></li>
        </ul>
        <ul class="badges" aria-label="Сертифікації">
          <li><img src="../../assets/img/badge-copilot.svg" width="64" height="64" loading="lazy" alt="GitHub Copilot — Microsoft certification"></li>
          <li><img src="../../assets/img/badge-az900.svg" width="64" height="64" loading="lazy" alt="Microsoft Certified: Azure Fundamentals (AZ-900)"></li>
          <li><img src="../../assets/img/badge-icp-apm.webp" width="64" height="64" loading="lazy" alt="ICAgile Certified Professional — ICP-APM"></li>
          <li><img src="../../assets/img/badge-anthropic-architect-pro.webp" width="64" height="64" loading="lazy" alt="Anthropic Certificate — Architect Professional"></li>
          <li><img src="../../assets/img/badge-anthropic-architect-found.webp" width="64" height="64" loading="lazy" alt="Anthropic Certificate — Architect Foundations"></li>
          <li><img src="../../assets/img/badge-anthropic-associate-found.webp" width="64" height="64" loading="lazy" alt="Anthropic Certificate — Associate Foundations"></li>
          <li><img src="../../assets/img/badge-anthropic-developer-found.webp" width="64" height="64" loading="lazy" alt="Anthropic Certificate — Developer Foundations"></li>
        </ul>
        <div class="founder-links">
          <ul class="founder-social">
            <li><a href="https://www.linkedin.com/in/yehor-maksymchuk-271039240/" target="_blank" rel="noopener">LinkedIn</a></li>
            <li><a href="https://github.com/QAStudyOnline" target="_blank" rel="noopener">GitHub</a></li>
            <li><a href="https://www.youtube.com/@qastudy.online" target="_blank" rel="noopener">YouTube</a></li>
            <li><a href="https://t.me/qastudy" target="_blank" rel="noopener">Telegram</a></li>
          </ul>
          <a class="link-underline" href="../../team/yehor-maksymchuk/">Детальніше про викладача <span class="arrow" aria-hidden="true">→</span></a>
        </div>
      </div>
    </div>
  </section>'''

def price(d):
    p = d.get("price")
    if not p: return ""
    c = d.get("cohort")
    cohort = ""
    if c:
        cohort = f'''        <div class="cohort glass reveal">
          <p class="mini-label mini-label-dark">Найближчий старт</p>
          <p class="cohort-date"><time datetime="{esc(c["date_iso"])}">{esc(c["date"])}</time></p>
          <ul class="cohort-details">{li(c["details"])}</ul>
          <p class="cohort-note">{esc(c["note"])}</p>
        </div>'''
    return f'''  <section class="section section-dark" id="price">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">07. Вартість</p>
        <h2 class="h2">Скільки коштує <br><span class="accent">наступний рівень</span></h2>
      </header>
      <div class="price-grid">
        <div class="price-card glass reveal">
          <p class="price-label">Повна вартість</p>
          <p class="price-amount">{esc(p["amount"])}</p>
          <p class="price-note">{esc(p["note"])}</p>
          <p class="mini-label mini-label-dark">Що входить</p>
          <ul class="skill-list skill-list-dark">{li(p["included"])}</ul>
          <a class="btn btn-primary btn-lg" href="#apply" data-event="course_apply_click" data-place="price">Подати заявку <span class="arrow" aria-hidden="true">→</span></a>
        </div>
        <div class="price-side">
{cohort}
          <div class="company glass reveal">
            <span class="company-icon" aria-hidden="true"><svg viewBox="0 0 24 24"><path d="M4 21V5a1 1 0 011-1h8a1 1 0 011 1v16M14 9h5a1 1 0 011 1v11M4 21h17M8 8h2M8 12h2M8 16h2M17 13h1M17 17h1" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/></svg></span>
            <p class="h4">{esc(p["company"]["title"])}</p>
            <p class="body body-dark">{esc(p["company"]["text"])}</p>
          </div>
        </div>
      </div>
    </div>
  </section>'''

def faq(d):
    items = "".join(f'''        <details class="faq-item"{" open" if i == 0 else ""}>
          <summary><span class="faq-num">{i+1:02d}</span><span class="faq-q">{esc(f["q"])}</span><span class="faq-icon" aria-hidden="true"></span></summary>
          <div class="faq-a"><p>{esc(f["a"])}</p></div>
        </details>''' for i, f in enumerate(d["faq"]))
    return f'''  <section class="section section-dark faq" id="faq">
    <div class="container faq-grid">
      <div class="faq-intro reveal">
        <p class="eyebrow eyebrow-dark">08. FAQ</p>
        <h2 class="h2">Питання <br>перед <span class="accent">стартом</span></h2>
      </div>
      <div class="faq-list reveal">
{items}
      </div>
    </div>
  </section>'''

def apply(d):
    f = d["form"]
    return f'''  <section class="section section-dark apply" id="apply">
    <span class="deco deco-3" aria-hidden="true"></span>
    <div class="container apply-grid">
      <div class="reveal">
        <p class="eyebrow eyebrow-dark">09. Заявка</p>
        <h2 class="h2">Забронювати місце <br>у групі <span class="accent">{esc(d["title"])}</span></h2>
        <p class="lead lead-dark">Залиште контакт — розкажемо про старт, формат і відповімо на питання протягом робочого дня.</p>
        <p class="apply-alt">{ICON_TG} Або одразу в Telegram: <a href="https://t.me/qastudy" target="_blank" rel="noopener" data-event="telegram_click">@qastudy</a></p>
      </div>
      <form class="contact-form glass apply-form reveal" id="contact-form" action="{esc(f["endpoint"])}" method="POST" novalidate>
        <div class="field-row">
          <div class="field">
            <label for="f-telegram">Telegram</label>
            <input id="f-telegram" name="telegram" type="text" autocomplete="off" required aria-describedby="f-telegram-err" placeholder="@username">
            <p class="field-error" id="f-telegram-err"></p>
          </div>
          <div class="field">
            <label for="f-phone">Телефон</label>
            <input id="f-phone" name="phone" type="tel" autocomplete="tel" required aria-describedby="f-phone-err" placeholder="+380">
            <p class="field-error" id="f-phone-err"></p>
          </div>
        </div>
        <div class="field">
          <label for="f-email">Email</label>
          <input id="f-email" name="email" type="email" autocomplete="email" required aria-describedby="f-email-err" placeholder="name@company.com">
          <p class="field-error" id="f-email-err"></p>
        </div>
        <div class="field">
          <label for="f-role">Поточна роль</label>
          <select id="f-role" name="role" required aria-describedby="f-role-err">
            <option value="">Оберіть</option>
            <option>QA Engineer (Middle)</option>
            <option>Automation QA / SDET</option>
            <option>Senior QA</option>
            <option>QA Lead / Head of QA</option>
            <option>DevOps / SRE</option>
            <option>Інше</option>
          </select>
          <p class="field-error" id="f-role-err"></p>
        </div>
        <div class="field">
          <label for="f-message">Питання або коротко про задачу <span class="opt">(необов’язково)</span></label>
          <textarea id="f-message" name="message" rows="3" aria-describedby="f-message-err" placeholder="Що тестуєте зараз і чого очікуєте від курсу"></textarea>
          <p class="field-error" id="f-message-err"></p>
        </div>
        <div class="hp" aria-hidden="true"><label>Website<input type="text" name="_gotcha" tabindex="-1" autocomplete="off"></label></div>
        <input type="hidden" name="_subject" value="{esc(f["subject"])}">
        <input type="hidden" name="course" value="{esc(d["title"])}">
        <input type="hidden" name="source" value="course-page">
        <input type="hidden" name="page" id="f-page" value="">
        <input type="hidden" name="utm" id="f-utm" value="">
        <input type="hidden" name="referrer" id="f-referrer" value="">
        <p class="form-privacy">Надсилаючи форму, ви погоджуєтесь із <a href="../../privacy/">політикою конфіденційності</a>.</p>
        <p class="form-status" id="form-status" role="status" aria-live="polite"></p>
        <button class="btn btn-primary btn-lg" type="submit" id="form-submit"><span class="btn-label">Подати заявку</span><span class="btn-loading" aria-hidden="true">Надсилаємо…</span></button>
      </form>
      <div class="form-success glass" id="form-success" hidden>
        <p class="h4">Заявку отримали. Дякуємо!</p>
        <p class="body body-dark">Зв’яжемося у Telegram або на email протягом робочого дня, розкажемо про старт і підтвердимо місце в групі.</p>
      </div>
    </div>
  </section>'''

def related(d):
    cards = "".join(f'''        <a class="related-card glass" href="{esc(r["url"])}">
          <span class="col-tag col-tag-accent">{esc(r["direction"])}</span>
          <span class="related-title">{esc(r["title"])}</span>
          <span class="related-quote">{esc(r["quote"])}</span>
          <span class="link-underline">Переглянути програму <span class="arrow" aria-hidden="true">→</span></span>
        </a>''' for r in d["related"])
    return f'''  <section class="section section-dark" id="related">
    <div class="container">
      <header class="section-head reveal">
        <p class="eyebrow eyebrow-dark">Інші програми</p>
        <h2 class="h2 h2-compact">Якщо ваша задача <span class="accent">звучить інакше</span></h2>
      </header>
      <div class="related-grid reveal">
{cards}
      </div>
    </div>
  </section>'''

def footer(base="../../", course_base="../", contact_href="#apply"):
    """Єдиний футер для всіх сторінок. base — шлях до кореня сайту від сторінки."""
    return f'''<footer class="site-footer">
  <div class="container">
    <div class="footer-grid">
      <div class="footer-brand">
        <a class="brand" href="{base}" aria-label="QAStudy.online">
          <span class="brand-name">QAStudy<span class="brand-accent">.online</span></span>
          <span class="brand-sub">Engineering School</span>
        </a>
        <p class="footer-tagline">Наступний рівень для QA-інженерів: <br>AI Quality, Performance Engineering, QA Architecture.</p>
        <ul class="footer-social">
          <li><a href="https://www.youtube.com/@qastudy.online" target="_blank" rel="noopener" aria-label="YouTube"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M22 8.2c-.2-1.4-.9-2.3-2.3-2.5C17.8 5.4 12 5.4 12 5.4s-5.8 0-7.7.3C2.9 5.9 2.2 6.8 2 8.2 1.8 9.9 1.8 12 1.8 12s0 2.1.2 3.8c.2 1.4.9 2.3 2.3 2.5 1.9.3 7.7.3 7.7.3s5.8 0 7.7-.3c1.4-.2 2.1-1.1 2.3-2.5.2-1.7.2-3.8.2-3.8s0-2.1-.2-3.8zM10 15V9l5.2 3L10 15z" fill="currentColor"/></svg></a></li>
          <li><a href="https://t.me/qastudy" target="_blank" rel="noopener" aria-label="Telegram"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M21 4L3 11.2l6.4 2.2L18 7l-6.6 7.6.4 5.4 3-3.3 4.4 3.3L21 4z" fill="currentColor"/></svg></a></li>
          <li><a href="https://www.linkedin.com/in/yehor-maksymchuk-271039240/" target="_blank" rel="noopener" aria-label="LinkedIn"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6.5 8.5H3.6V21h2.9V8.5zM5 3.5a1.7 1.7 0 100 3.4 1.7 1.7 0 000-3.4zM21 13.4c0-3.4-1.8-5.1-4.3-5.1-2 0-2.9 1.1-3.4 1.9V8.5h-2.9V21h2.9v-7c0-1.8.8-2.9 2.3-2.9s2.4 1 2.4 2.9v7H21v-7.6z" fill="currentColor"/></svg></a></li>
          <li><a href="https://github.com/QAStudyOnline" target="_blank" rel="noopener" aria-label="GitHub"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 2a10 10 0 00-3.2 19.5c.5.1.7-.2.7-.5v-1.8c-2.8.6-3.4-1.2-3.4-1.2-.5-1.2-1.1-1.5-1.1-1.5-.9-.6.1-.6.1-.6 1 .1 1.5 1 1.5 1 .9 1.6 2.4 1.1 3 .9.1-.7.4-1.1.6-1.4-2.2-.3-4.6-1.1-4.6-5 0-1.1.4-2 1-2.7-.1-.2-.4-1.2.1-2.6 0 0 .8-.3 2.8 1a9.6 9.6 0 015 0c1.9-1.3 2.8-1 2.8-1 .5 1.4.2 2.4.1 2.6.6.7 1 1.6 1 2.7 0 3.9-2.4 4.7-4.6 5 .4.3.7.9.7 1.9v2.8c0 .3.2.6.7.5A10 10 0 0012 2z" fill="currentColor"/></svg></a></li>
        </ul>
      </div>
      <nav class="footer-col" aria-label="Програми">
        <h3 class="footer-title">Програми</h3>
        <ul>
          <li><a href="{course_base}agentic-qa/">Agentic QA<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="{course_base}k6-performance-testing/">Performance Testing with k6<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="{course_base}scale-quality/">Scale Quality<span class="arrow" aria-hidden="true">→</span></a></li>
        </ul>
      </nav>
      <nav class="footer-col" aria-label="QAStudy.online">
        <h3 class="footer-title">QAStudy.online</h3>
        <ul>
          <li><a href="{base}">Головна<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="{base}about/">Про школу<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="{base}team/yehor-maksymchuk/">Викладач<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="{base}#learning">Як навчаємо<span class="arrow" aria-hidden="true">→</span></a></li>
        </ul>
      </nav>
      <nav class="footer-col" aria-label="Матеріали">
        <h3 class="footer-title">Матеріали</h3>
        <ul>
          <li><a href="https://www.youtube.com/@qastudy.online" target="_blank" rel="noopener">YouTube<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="https://t.me/qastudy" target="_blank" rel="noopener">Telegram<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="https://www.linkedin.com/in/yehor-maksymchuk-271039240/" target="_blank" rel="noopener">LinkedIn<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="https://github.com/QAStudyOnline" target="_blank" rel="noopener">GitHub<span class="arrow" aria-hidden="true">→</span></a></li>
        </ul>
      </nav>
      <nav class="footer-col" aria-label="Інформація">
        <h3 class="footer-title">Інформація</h3>
        <ul>
          <li><a href="{contact_href}"{' data-open-form' if contact_href == '#contact' else ''}>Контакти<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="{base}oferta/">Публічна оферта<span class="arrow" aria-hidden="true">→</span></a></li>
          <li><a href="{base}privacy/">Політика конфіденційності<span class="arrow" aria-hidden="true">→</span></a></li>
        </ul>
      </nav>
    </div>
    <div class="footer-bottom">
      <ul class="footer-legal">
        <li>© QAStudy.online <span id="year">2026</span></li>
        <li><a href="{base}oferta/">Публічна оферта</a></li>
        <li><a href="{base}privacy/">Політика конфіденційності</a></li>
        <li><a href="{base}terms/">Умови використання</a></li>
        <li><a href="#known-issues" id="known-issues" class="known-issues">Known issues <span class="ki-count">3</span></a></li>
      </ul>
      <div class="footer-ask">
        <span class="footer-ask-icon" aria-hidden="true"><svg viewBox="0 0 24 24"><path d="M12 3C7 3 3 6.4 3 10.5c0 2.3 1.3 4.4 3.3 5.8L5.5 21l4.3-2.3c.7.1 1.4.2 2.2.2 5 0 9-3.4 9-7.5S17 3 12 3z" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linejoin="round"/></svg></span>
        <div><p>Є питання?</p><a href="https://t.me/qastudy" target="_blank" rel="noopener" data-event="telegram_click">Написати в Telegram <span class="arrow" aria-hidden="true">→</span></a></div>
      </div>
    </div>
  </div>
</footer>'''

def sticky(d):
    return f'''<div class="sticky-cta" id="sticky-cta" hidden>
  <div class="container sticky-inner">
    <div class="sticky-info"><strong>{esc(d["title"])}{" · " + esc(d["price"]["amount"]) if d.get("price") else ""}</strong>{lamp(d, "sticky")}</div>
    <a class="btn btn-primary" href="#apply" data-event="course_apply_click" data-place="sticky">Подати заявку <span class="arrow" aria-hidden="true">→</span></a>
  </div>
</div>'''

def jsonld(d):
    return json.dumps({
        "@context": "https://schema.org", "@type": "Course",
        "name": d["title"], "description": d["seo_description"],
        "provider": {"@type": "Organization", "name": "QAStudy.online", "url": "https://qastudy.online/"},
        "inLanguage": "uk",
        "offers": {"@type": "Offer", "price": "40000", "priceCurrency": "UAH", "url": "https://qastudy.online" + d["url"]} if d.get("price") else None,
        "hasCourseInstance": {"@type": "CourseInstance", "courseMode": "online", "startDate": d["cohort"]["date_iso"], "instructor": {"@type": "Person", "name": "Yehor Maksymchuk"}} if d.get("cohort") else None
    }, ensure_ascii=False, indent=2)

def page(d):
    return f'''<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{esc(d["seo_title"])}</title>
  <meta name="description" content="{esc(d["seo_description"])}">
  <link rel="canonical" href="https://qastudy.online{esc(d["url"])}">
  <meta name="theme-color" content="#07061A">
  <meta property="og:type" content="website">
  <meta property="og:site_name" content="QAStudy.online">
  <meta property="og:locale" content="uk_UA">
  <meta property="og:url" content="https://qastudy.online{esc(d["url"])}">
  <meta property="og:title" content="{esc(d["title"])} — {esc(d["direction"])} · QAStudy.online">
  <meta property="og:description" content="{esc(d["promise"])}">
  <meta property="og:image" content="https://qastudy.online/assets/img/og-image.jpg">
  <meta name="twitter:card" content="summary_large_image">
  <link rel="icon" href="../../favicon.svg" type="image/svg+xml">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link rel="stylesheet" href="../../assets/css/course.css">
  <script type="application/ld+json">
{jsonld(d)}
  </script>
  <!-- ANALYTICS: вставте GA4 / GTM snippet тут -->
  <script>window.dataLayer = window.dataLayer || [];</script>
</head>
<body class="course-page">
<a class="skip-link" href="#main">Перейти до контенту</a>
{header()}
<main id="main">
{hero(d)}
{personas(d)}
{skills(d)}
{program(d)}
{project(d)}
{fmt(d)}
{instructor(d)}
{price(d)}
{faq(d)}
{apply(d)}
{related(d)}
</main>
{footer()}
{sticky(d)}
<script src="../../assets/js/easter.js" defer></script>
<script src="../../assets/js/cursor.js" defer></script>
<script src="../../assets/js/exit.js" defer></script>
<script src="../../assets/js/course.js" defer></script>
</body>
</html>
'''

def sync_footer(path, **kw):
    """Замінює <footer>…</footer> у готовій сторінці на стандартний."""
    p = ROOT / path
    html_src = p.read_text(encoding="utf-8")
    new = re.sub(r"<footer class=\"site-footer\">.*?</footer>", lambda m: footer(**kw), html_src, count=1, flags=re.S)
    if "<footer" not in new:
        new = new.replace("</main>", "</main>\n" + footer(**kw), 1)
    p.write_text(new, encoding="utf-8")
    print("footer synced", path)

if __name__ == "__main__":
    src = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else ROOT / "_dev/courses/agentic-qa.json")
    d = json.loads(src.read_text(encoding="utf-8"))
    out = ROOT / "courses" / d["slug"] / "index.html"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(page(d), encoding="utf-8")
    print("built", out.relative_to(ROOT))
    sync_footer("index.html", base="./", course_base="courses/", contact_href="#contact")
    sync_footer("404.html", base="/", course_base="/courses/", contact_href="https://t.me/qastudy")
