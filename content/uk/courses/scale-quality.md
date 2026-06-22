---
title: "Scale Quality"
description: "Курс для Senior QA та Lead-інженерів: побудуй QA-архітектуру та стратегію тестування за ISTQB CTAL-TM, ISO 29119, DORA та CT-AI. 35 занять, 7 блоків, Capstone-захист."
date: 2026-06-22
draft: false
layout: "landing"

# Картка в списку курсів
level: "Senior → Lead/Architect"
category: "Test Management & QA Architecture"
instructor: "Єгор Максимчук"
duration: "~33 тижні"
lessons: 35

# Посилання
registration_url: "#"
program_url: "/scale-quality-program/"
doc_label: "Повна програма курсу"

# Hero
eyebrow: "Курс"
subtitle: "Побудуй QA-архітектуру та стратегію тестування, яка витримає ріст продукту і команди."
cta_label: "Подати заявку →"
meta_pills:
  - "35 занять"
  - "~33 тижні"
  - "ISTQB CTAL-TM · ISO 29119 · DORA · CT-AI"

audience:
  heading: "Для кого цей курс"
  cards:
    - role: "Senior QA → Lead"
      jtbd: "«Я добре тестую, але не знаю, як масштабувати вплив на якість за межами власних тасок». Навчишся читати архітектуру системи як джерело ризиків, будувати risk-based стратегію й говорити з product мовою рішень — а не мовою дефектів."
    - role: "Lead → Test Manager / Head of QA"
      jtbd: "«Я відповідаю за процес і релізи, але governance, OKR і C-level комунікація — моє слабке місце». Отримаєш фреймворк QA-функції: RACI-модель, metrics-based управління й вмітимеш захищати quality-рішення перед steering committee."
    - role: "Senior QA / SDET → QA Architect"
      jtbd: "«Хочу бути власником технічної тест-стратегії й архітектури якості на рівні продукту». Пройдеш повний ланцюг: architecture-to-risk map, risk-based стратегія, DORA-метрики, тестування AI-систем, governance та стратегічний вплив."

competencies:
  heading: "Чого ти навчишся"
  items:
    - label: "Architecture-to-risk"
      text: "Читати архітектуру системи (monolith, microservices, cloud-native) і перетворювати її на карту ризиків і тест-рівнів."
    - label: "Risk-based стратегія"
      text: "Будувати project test strategy за ISO 29119 — від risk register до quality gates і release readiness."
    - label: "DORA + DX Core 4"
      text: "Вимірювати якість через delivery-метрики й будувати GQM-дашборди, які реально читають у команді."
    - label: "AI-SDLC тестування"
      text: "Тестувати AI-системи без детермінованого oracle: metamorphic-тести, red-teaming, CT-AI / CT-GenAI."
    - label: "Governance & OKR"
      text: "Проєктувати QA-функцію (CoE, RACI), каскадувати OKR/KPI і вести working agreements (DoR/DoD/AC)."
    - label: "Стратегічний вплив"
      text: "Комунікувати ризик executives мовою бізнесу і захищати trade-offs перед steering committee."

curriculum:
  heading: "Програма курсу"
  blocks:
    - title: "Блок 0. Mindset & Framing"
      meta: "1 вступний модуль · без домашнього завдання"
      open: true
      lessons:
        - "Mindset & Framing: розвилка ролей QA Manager vs QA Architect, чотири спільні осі (risk, metrics, governance, strategy), career ladder та вибір Project X"
    - title: "Блок 1. Architecture-aware QA"
      meta: "заняття 1–3 · Senior"
      lessons:
        - "Заняття 1. Application architectures для QA: monolith, microservices, serverless, cloud-native — де народжуються ризики якості"
        - "Заняття 2. Читання системи: testability, risk hotspots, тест-рівні"
        - "Заняття 3. Outsourcing vs product company: різниця в управлінні якістю"
    - title: "Блок 2. Ризики, тест-стратегія та документація"
      meta: "заняття 4–8 · Senior → Lead"
      lessons:
        - "Заняття 4. Risk-based testing від початку до кінця: risk register, risk matrix, мітигація"
        - "Заняття 5. Ієрархія документів: policy → strategy → plan (ISO 29119)"
        - "Заняття 6. Навіщо існують артефакти: traceability, auditability, «just enough»"
        - "Заняття 7. Написання тест-стратегії (Test Strategy v1, 29119-aligned)"
        - "Заняття 8. Quality gates і release readiness: go/no-go на даних"
    - title: "Блок 3. Метрики, аналітика та покращення процесів"
      meta: "заняття 9–13 · Lead"
      lessons:
        - "Заняття 9. Метрики тестування, що мають значення: defect density, escaped defects, test effectiveness"
        - "Заняття 10. Delivery & quality analytics: DORA + DX Core 4"
        - "Заняття 11. Quality dashboard, vanity metrics і GQM-метод"
        - "Заняття 12. Моделі покращення процесів: TMMi та IDEAL"
        - "Заняття 13. Релізний процес і вбудований контроль якості"
    - title: "Блок 4. AI-SDLC та тестування AI-систем"
      meta: "заняття 14–18 · Lead → Architect"
      lessons:
        - "Заняття 14. Ландшафт AI-SDLC: де AI прискорює, де дестабілізує (DORA 2025)"
        - "Заняття 15. GenAI для тестувальної роботи: генерація тест-кейсів, human-review gate"
        - "Заняття 16. Тестування AI-систем: non-determinism, metamorphic testing, red-teaming LLM/RAG"
        - "Заняття 17. Ризики й governance AI у QA: hallucination, bias, drift, human-in-the-loop"
        - "Заняття 18. Test Strategy в умовах AI-SDLC (Test Strategy v1 → v2)"
    - title: "Блок 5. Governance, люди та управління процесами"
      meta: "заняття 19–24 · Lead"
      lessons:
        - "Заняття 19. Проєктування governance: TCoE, QA CoE, RACI, escalation paths"
        - "Заняття 20. Goal-setting: OKR, KPI, SMART — каскадування від company до інженера"
        - "Заняття 21. Agile-фреймворки для QA-лідерів: Scrum, Kanban, гібридні моделі"
        - "Заняття 22. Working agreements: DoR / DoD / Acceptance Criteria"
        - "Заняття 23. Управління людьми для QA-лідерів: hiring, менторинг, 1:1"
        - "Заняття 24. Управління процесами: defect lifecycle, capacity planning"
    - title: "Блок 6. Комунікація, вплив і захист Capstone"
      meta: "заняття 25–28 · Lead → Manager/Architect"
      lessons:
        - "Заняття 25. Письмова комунікація технічного лідера: decision-oriented повідомлення, risk-escalation"
        - "Заняття 26. Вплив на стейкхолдерів без формальної влади: якість мовою бізнесу"
        - "Заняття 27. Capstone integration workshop: складання board-ready пакета M1–M5"
        - "Заняття 28. Захист Capstone перед steering committee (20 хв + 15 хв питань)"
    - title: "Блок 7. Лідерські навички: вплив, зміни та кризи"
      meta: "заняття 29–35 · Lead → Manager/Architect"
      lessons:
        - "Заняття 29. Storytelling для QA-лідера: дані → наратив для топ-менеджменту"
        - "Заняття 30. How to Sell: продаж ідей і якості всередині організації"
        - "Заняття 31. Driving the Change: управління змінами в QA-процесах (ADKAR / Kotter)"
        - "Заняття 32. TaaS (Testing as a Service): оцінка доцільності та ризики"
        - "Заняття 33. Discovery: оцінка проєкту на старті залучення"
        - "Заняття 34. Firefighting: управління якістю в кризі та вихід із реактивного режиму"
        - "Заняття 35. Basics of Successful Negotiations: переговори про терміни, обсяг і бюджет"

final_project:
  heading: "Фінальний проєкт: Capstone Test Strategy"
  intro: "Протягом курсу ти будуєш 19 артефактів для свого «Project X» і здаєш єдиний board-ready пакет:"
  items:
    - "Architecture-to-risk map + Project X brief (M1)"
    - "Risk register ≥12 ризиків + risk matrix (M2)"
    - "Project Test Strategy v1 → v2 з AI-SDLC апгрейдом (M2→M4)"
    - "Quality-gate / release-readiness checklist (M2)"
    - "Metrics specification + mock dashboard: QA + DORA + DX Core 4 (M3)"
    - "TMMi maturity assessment + improvement roadmap (M3)"
    - "AI-risk register + test approach для AI/GenAI-фічі (M4)"
    - "Governance model + RACI — large & medium варіанти (M5)"
    - "Working-agreements pack: DoR / DoD / AC (M5)"
    - "QA OKR/KPI set + team & hiring plan (M5)"
    - "Communication pack: risk-escalation email, go/no-go status, decision log (M6)"
    - "Defense deck + захист 20 хв + 15 хв питань від steering committee (M6)"
    - "Storytelling-наратив: метрики → наратив для топ-менеджменту (M7)"
    - "Sales pitch: продаж QA-ініціативи з відпрацюванням заперечень (M7)"
    - "Change-management plan за ADKAR / Kotter (M7)"
    - "TaaS feasibility analysis: скоуп, ризики, SLA (M7)"
    - "Discovery plan: перші два тижні в новому проєкті (M7)"
    - "Firefighting playbook: ролі, комунікація, ескалація, post-mortem (M7)"
    - "Negotiation brief: інтереси, BATNA, тактики іншої сторони (M7)"

pricing:
  heading: "Вартість"
  amount: "120 000 грн"
  amount_label: "за весь курс"
  per_session: "≈ 17 100 грн / модуль · ≈ 3 400 грн / заняття"
  meta: "7 блоків · 35 занять · ~33 тижні"
  includes_label: "Що входить:"
  includes:
    - "Живі заняття 2–3 год + запис кожного"
    - "Персональний фідбек на кожне домашнє завдання"
    - "Peer review між студентами групи"
    - "Capstone-захист перед steering committee"
    - "Шаблони, canvas, чеклисти для всіх 12 артефактів"
    - "Telegram-спільнота групи та підтримка між заняттями"
    - "Board-ready Test Strategy пакет — реальний артефакт для портфоліо"
  group_headline: "Мала група"
  group_text: "Малі групи — персональний фідбек на кожне ДЗ, а не формальна перевірка «пройшов / не пройшов». Кожен студент захищає власний Capstone перед steering committee."

bottom_cta:
  text: "35 занять, 8 блоків, ~33 тижні, Capstone-захист. Залиши контакт — розкажу про старт і формат."
---

## Чому курс окупається

Head of QA та QA Architect — серед найвище оплачуваних ролей у тестуванні. За даними Glassdoor (2026):

- **Великобританія:** £83&nbsp;554/рік (~£6&nbsp;960/міс), топ-10% — до £122&nbsp;253
- **Німеччина:** €97&nbsp;001/рік (~€8&nbsp;080/міс)
- **США:** $189&nbsp;075/рік (~$15&nbsp;750/міс)

Курс готує саме до цього переходу — і окупається за один–два місяці після зміни ролі.

Джерела: [Glassdoor UK](https://www.glassdoor.co.uk/Salaries/head-of-qa-salary-SRCH_KO0,10.htm) · [Glassdoor DE](https://www.glassdoor.com/Salaries/germany-head-of-qa-salary-SRCH_IL.0,7_IN96_KO8,18.htm) · [Glassdoor US](https://www.glassdoor.com/Salaries/head-of-qa-salary-SRCH_KO0,10.htm)

