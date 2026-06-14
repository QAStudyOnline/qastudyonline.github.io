---
title: "Agentic QA"
description: "Практичний курс з тестування AI-агентних систем для QA, SDET і Tech Lead інженерів. 21 заняття від основ до production-ready CI/CD pipeline."
date: 2026-06-11
draft: false
layout: "landing"

# Картка в списку курсів
level: "Middle-Lead"
category: "AI тестування"
instructor: "Єгор Максимчук"
duration: "11–14 тижнів"
lessons: 21

# Посилання
registration_url: "https://forms.gle/Lz1ZfjUBWzrK8sQn7"
program_url: "/agentic-qa-program/"
doc_label: "Програма курсу повністю"

# Hero
eyebrow: "Курс"
subtitle: "Навчись тестувати AI-агентів, RAG-системи і agentic pipelines — від першого eval до production CI/CD."
cta_label: "Подати заявку →"
meta_pills:
  - "21 заняття"
  - "11–14 тижнів"
  - "Middle-Lead"

audience:
  heading: "Для кого цей курс"
  cards:
    - role: "QA Engineer Middle+"
      jtbd: "Проєкт перейшов на LLM — не знаю як тестувати по-нормальному"
    - role: "Automation QA / SDET"
      jtbd: "Хочу конкретний технічний стек для тестування AI, а не «якось протестувати»"
    - role: "Tech Lead / QA Lead"
      jtbd: "Боюся production-інцидентів і не знаю що запитати у команди"

competencies:
  heading: "Чого ти навчишся"
  items:
    - label: "Risk mapping"
      text: "Декомпозувати агентну систему і будувати risk map як основу тест-стратегії."
    - label: "Eval automation"
      text: "Писати eval-suite з DeepEval або Promptfoo замість ручних перевірок."
    - label: "RAG & dialog testing"
      text: "Вимірювати якість RAG через RAGAS і знаходити context failure."
    - label: "LLM-as-a-Judge"
      text: "Реалізувати і калібрувати judge-оцінку, підключити до CI."
    - label: "Security & red teaming"
      text: "Проводити red team сесію за OWASP LLM Top 10."
    - label: "CI/CD quality gates"
      text: "Вбудувати eval gates і agentic workflows у GitHub Actions pipeline."

curriculum:
  heading: "Програма курсу"
  blocks:
    - title: "Блок 1. Фундамент"
      meta: "заняття 1–2 · базовий рівень"
      open: true
      lessons:
        - "Заняття 1. AI-системи як об'єкт тестування: чому все інакше"
        - "Заняття 2. Архітектура агентних систем очима QA"
    - title: "Блок 2. Тестування LLM"
      meta: "заняття 3–9 · середній рівень"
      lessons:
        - "Заняття 3. Промпт та контекст інжиніринг для QA"
        - "Заняття 4. Метрики в тестуванні ШІ"
        - "Заняття 5. Тестування промптів: від ручних перевірок до автоматизації"
        - "Заняття 6. Тестування RAG: hallucination, faithfulness, relevancy"
        - "Заняття 7. Тестування багатокрокових діалогів і context management"
        - "Заняття 8. Тестування різних моделей й приклади у GitHub Models"
        - "Заняття 9. Локальні моделі для тестування: Ollama і Lemonade AI Runtime"
    - title: "Блок 3. Agentic Testing"
      meta: "заняття 10–14 · середній рівень"
      lessons:
        - "Заняття 10. LLM as a Judge: імплементація і підводні камені (Deep-Eval + Spring AI Test)"
        - "Заняття 11. Security testing: Prompt Injection і Red Teaming"
        - "Заняття 12. Tool call testing і MCP"
        - "Заняття 13. Observability і cost testing"
        - "Заняття 14. AI-assisted Test Case Generation і Code Review"
    - title: "Блок 4. Автоматизація і фреймворки"
      meta: "заняття 15–16 · просунутий"
      lessons:
        - "Заняття 15. Побудова фреймворку для автоматизованого тестування ШІ"
        - "Заняття 16. Eval pipeline у CI/CD: Quality Gates з DeepEval і LLM-as-a-Judge"
    - title: "Блок 5. Системний рівень і Agentic CI/CD"
      meta: "заняття 17–18 · просунутий"
      lessons:
        - "Заняття 17. Agentic CI/CD: AI-агенти як частина пайплайну розробки"
        - "Заняття 18. Documentation і Test Generation як частина agentic workflow"
    - title: "Блок 6. Фінальний проєкт"
      meta: "заняття 19–21 · синтез"
      lessons:
        - "Заняття 19. Підготовка фінального проєкту: консультації і peer review"
        - "Заняття 20–21. Захист: демо живого CI/CD pipeline + запитання від групи"

final_project:
  heading: "Фінальний проєкт: AI-Powered Application — повний цикл"
  intro: "Студент самостійно будує AI-додаток і здає:"
  items:
    - "AI-додаток (300–800 рядків, з допомогою Claude Code або Copilot)"
    - "Тест-стратегія (2–4 сторінки, go/no-go критерії)"
    - "Risk-based test coverage matrix"
    - "Тести на всіх рівнях: eval · RAG · LLM-judge · security · E2E"
    - "AI test framework з LLM-as-a-Judge і звітом"
    - "CI/CD pipeline: quality gates + AI code review + автоматичний реліз"
    - "Документація: README + опис де AI-асистент допоміг і де заважав"

pricing:
  heading: "Вартість"
  amount: "40 000 грн"
  amount_label: "за весь курс"
  per_session: "≈ 1 900 грн / заняття"
  meta: "21 заняття · 11–14 тижнів"
  includes_label: "Що входить:"
  includes:
    - "Всі матеріали курсу: презентації, код прикладів, лекційні нотатки"
    - "Фідбек на кожне домашнє завдання"
    - "Ревʼю фінального проєкту з лектором"
    - "Доступ до записів занять"
    - "Виконаний власний проект: AI-agent з CI/CD та Тест Стратегією і Agentic workflow на базі Claude Code або GitHub Copilot"
  group_headline: "Група 8–12 людей"
  group_text: "Малі групи — персональний фідбек на кожне домашнє завдання, а не формальна перевірка «пройшов / не пройшов»."

bottom_cta:
  text: "Залишити контакт — розкажу деталі про старт, формат і вартість."
---
