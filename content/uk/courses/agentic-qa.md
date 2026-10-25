---
aliases:
- /agentic-qa-program/
card:
  anchor: program-agentic-qa
  create:
  - AI Test Strategy
  - Eval Suite
  - AI Test Framework
  event: program_agentic_click
  master:
  - Evals та LLM-as-a-Judge
  - Тестування RAG і AI-агентів
  - Red teaming за OWASP LLM Top 10
  - Quality gates у CI/CD
  meta:
  - label: Рівень
    value: Middle–Lead
  - label: Занять
    value: '21'
  - label: Тривалість
    value: 11–14 тижнів
  quote: «У продукті з’явився AI, і я не знаю, як гарантувати його якість»
cohort:
  date: 10 листопада 2026
  date_iso: '2026-11-10'
  details:
  - 21 заняття
  - 11–14 тижнів
  - група до 12 осіб
  - онлайн
  note: Розклад занять узгоджуємо з групою перед стартом.
  seats_taken: 5
  seats_total: 12
description: 'Agentic QA: 6 модулів, 21 заняття. Навчіться тестувати LLM, RAG і AI-агентів — від risk strategy та evals до quality gates у CI/CD. Малі групи, персональний review, production-ready проєкт у GitHub.'
direction: AI Quality
enrollment:
  label: Набір відкрито · старт 10.11.2026
  state: open
faq:
- a: 'Так, на рівні читання і написання простого коду: Python або JavaScript. Ви будете писати evals, assertions і збирати framework — але з підтримкою Claude Code чи Copilot і з review від викладача.'
  q: Чи потрібно вміти програмувати?
- a: Подивитеся запис і здасте домашнє завдання у своєму темпі. Review отримаєте так само, як і решта групи.
  q: Що буде, якщо я пропущу заняття?
- a: Одне заняття плюс домашнє завдання. Орієнтуйтеся на 4–6 годин на тиждень разом із практикою.
  q: Скільки часу потрібно щотижня?
- a: Знадобиться доступ до однієї з cloud-моделей для практики. Окремий модуль присвячений локальним моделям — навчимо зменшувати залежність від дорогих запитів.
  q: Чи потрібен доступ до платних AI-моделей?
- a: Так. Надамо рахунок і документи для оплати юридичною особою — напишіть про це у заявці.
  q: Чи може за навчання заплатити компанія?
- a: Ми зв’яжемося протягом робочого дня, коротко обговоримо ваш рівень і задачі та підтвердимо місце в групі.
  q: Що буде після заявки?
form:
  subject: QAStudy.online — заявка на Agentic QA
format:
- desc: 8–12 інженерів. Викладач бачить код і рішення кожного.
  title: Онлайн, у малій групі
- desc: Домашнє завдання після кожної зустрічі — і воно стає частиною вашого фінального проєкту.
  title: Практика на кожному занятті
- desc: 'Кожне домашнє завдання отримує розбір від викладача: чому працює, де зламається, як зробити краще.'
  title: Персональний review
- desc: Пропустили зустріч — подивитеся запис і здасте завдання у своєму темпі.
  title: Записи занять
instructor_line: Автор внутрішнього курсу EPAM «AI-Infused Application Testing». Розробляє AI-агентів для SDLC і будує QA-архітектуру для AI-продуктів у US fintech.
lessons_total: 21
level_path:
- Middle
- Senior
- Lead
meta:
- label: Занять
  value: '21'
- label: Тривалість
  value: 11–14 тижнів
- label: Рівень
  value: Middle–Lead
- label: Група
  value: 8–12 осіб
modules:
- artifacts:
  - Risk Map
  - Coverage Matrix
  - AI Test Strategy
  color: blue
  lessons:
  - desc: Розберетеся, чому звичайного pass/fail недостатньо для LLM та AI-агентів. Навчитеся бачити основні типи помилок і розуміти, що саме потрібно перевіряти.
    'n': '1'
    title: Що змінюється для QA, коли в продукті зʼявляється AI
  - desc: Навчитеся розкладати AI-систему на компоненти й ризики, визначати пріоритети та будувати coverage під реальний продукт.
    'n': '2'
    title: Як побудувати test strategy для AI-продукту
  lessons_count: 2 заняття
  milestone: Ви вмієте розібрати AI-систему як QA
  num: 1
  output: Risk Map + Coverage Matrix + AI Test Strategy
  title: Як тестувати AI-продукт системно
- artifacts:
  - Golden Dataset
  - LLM Eval Suite
  - RAG Evaluation
  - Model Benchmark
  color: green
  lessons:
  - desc: Навчитеся перевіряти, як зміни prompt та context впливають на результат, і знаходити проблеми до production.
    'n': '3'
    title: Як тестувати prompts і context
  - desc: Розберетеся, що робити, коли немає одного правильного expected result, і які метрики потрібні саме вашому сценарію.
    'n': '4'
    title: Як оцінювати якість AI-відповідей
  - desc: Створите повторювані eval-перевірки та навчитеся знаходити regression після зміни prompt або model.
    'n': '5'
    title: Як автоматизувати перевірку AI-відповідей
  - desc: 'Навчитеся визначати, де саме виникла проблема: у retrieval, context чи фінальній генерації відповіді.'
    'n': '6'
    title: Як тестувати RAG
  - desc: Знаходитимете втрату контексту, суперечності та деградацію поведінки в multi-step сценаріях.
    'n': '7'
    title: Як тестувати довгі діалоги
  - desc: Зможете порівнювати моделі за якістю, стабільністю, latency та cost і аргументовано обирати варіант для продукту.
    'n': '8'
    title: Як порівнювати різні моделі
  - desc: Дізнаєтеся, коли локальні моделі підходять для QA-задач і як зменшити залежність від дорогих cloud-запитів.
    'n': '9'
    title: Як використовувати локальні моделі для evals
  lessons_count: 7 занять
  milestone: Ви вмієте вимірювати якість LLM і RAG
  num: 2
  output: Golden Dataset + LLM Eval Suite + RAG Evaluation + Model Benchmark
  title: Як вимірювати якість LLM і RAG
- artifacts:
  - Agent Test Suite
  - Security Report
  - Observability Setup
  color: orange
  lessons:
  - desc: Навчитеся автоматично оцінювати AI-відповіді за допомогою іншої моделі та розуміти межі надійності такого підходу.
    'n': '10'
    title: Як використовувати LLM-as-a-Judge
  - desc: Проведете базовий red teaming і навчитеся знаходити prompt injection, витік даних та інші security-ризики.
    'n': '11'
    title: Як перевіряти AI на небезпечні сценарії
  - desc: Перевірятимете, який tool вибрав агент, з якими параметрами і чи правильно він побудував послідовність дій.
    'n': '12'
    title: Як тестувати tool calls
  - desc: Виявлятимете зайві кроки, loops, дорогі запити, latency-проблеми та неправильні tool calls.
    'n': '13'
    title: Як аналізувати поведінку агента через traces
  - desc: Розберете практичні сценарії для test generation, edge-case discovery та code review і навчитеся перевіряти якість того, що згенерував AI.
    'n': '14'
    title: 'Як контролювати якість AI-генерацій: tests, edge cases, review'
  lessons_count: 5 занять
  milestone: Ви вмієте знаходити помилки AI-агентів
  num: 3
  output: Agent Test Suite + Security Report + Observability Setup
  title: Як тестувати AI-агентів
- artifacts:
  - Reusable AI Test Framework
  - CI/CD Quality Gates
  color: red
  lessons:
  - desc: Обʼєднаєте datasets, evals, assertions, reports та роботу з різними моделями в одну підтримувану систему.
    'n': '15'
    title: Як зібрати власний AI test framework
  - desc: Запускатимете evals у pipeline, задаватимете thresholds і блокуватимете зміни, якщо якість AI-функціональності погіршилась.
    'n': '16'
    title: Як додати AI quality checks у CI/CD
  lessons_count: 2 заняття
  milestone: Ви вмієте автоматизувати AI-тестування
  num: 4
  output: Reusable AI Test Framework + CI/CD Quality Gates
  title: Як автоматизувати AI-тестування
- artifacts:
  - Code Review
  - Test Generation
  - Documentation
  color: blue
  lessons:
  - desc: Побудуєте workflow, у якому AI-агент допомагає аналізувати код, review PR та запускати додаткові QA-перевірки.
    'n': '17'
    title: Agentic CI/CD
  - desc: Навчитеся використовувати AI для генерації й оновлення тестів і документації через контрольований review-процес.
    'n': '18'
    title: Автоматичне оновлення тестів і документації
  lessons_count: 2 заняття
  milestone: Ви вмієте вбудувати AI-агентів у QA workflow
  num: 5
  output: Agentic QA Workflow для Code Review, Test Generation і Documentation
  title: Як використовувати AI-агентів у QA workflow
- artifacts:
  - Production-ready Project у GitHub
  color: violet
  lessons:
  - desc: Отримаєте review архітектури, test strategy, coverage, evals, framework та CI/CD перед фінальним захистом.
    'n': '19'
    title: Project Review
  - desc: 'Покажете повний pipeline у роботі та обґрунтуєте свої engineering decisions: coverage, thresholds, quality gates і залишкові ризики.'
    'n': 20–21
    title: Захист проєкту
  lessons_count: 3 заняття
  milestone: Ви можете показати це роботодавцю
  num: 6
  output: Production-ready Agentic QA Project у GitHub
  title: Фінальний Agentic QA Project
personas:
- outcome: Побудуєте test strategy для AI-функціональності та навчитеся вимірювати якість там, де немає одного правильного результату.
  quote: «Проєкт перейшов на LLM, і я не знаю, як тестувати це по-нормальному»
  role: QA Engineer, Middle+
- outcome: 'Зберете власний AI test framework: datasets, evals, LLM-as-a-Judge, assertions, звіти — і вбудуєте його в CI/CD.'
  quote: «Хочу конкретний технічний стек для тестування AI, а не „якось протестувати“»
  role: Automation QA / SDET
- outcome: Отримаєте risk map, coverage matrix і quality gates — інструменти, щоб керувати якістю AI-продукту, а не сподіватися на неї.
  quote: «Боюся production-інцидентів з AI і не знаю, що запитати у команди»
  role: Tech Lead / QA Lead
price:
  amount: 40 000 грн
  company:
    text: Багато учасників навчаються за рахунок роботодавця. Надамо рахунок, договір і закриваючі документи — просто вкажіть це у заявці.
    title: Оплата від компанії
  currency: UAH
  included:
  - 'Усі матеріали курсу: презентації, код прикладів, лекційні нотатки'
  - Персональний feedback на кожне домашнє завдання
  - Review фінального проєкту з викладачем
  - Доступ до записів занять
  - Власний production-ready проєкт у GitHub
  note: 'Повна вартість програми: 21 заняття, 11–14 тижнів. Матеріали, записи та review вже всередині.'
  value: 40000
program_intro: 'Курс побудований навколо реальних задач QA в AI-продуктах: від risk strategy та evals до автоматизованих quality gates у CI/CD.'
project:
  intro: Ви самостійно будуєте AI-застосунок і повний цикл його тестування. Усе — у вашому GitHub, готове показати на інтерв’ю або принести у свою команду.
  items:
  - desc: AI-застосунок, 300–800 рядків, з Claude Code або Copilot
    name: ai-application/
  - desc: Test strategy на 2–4 сторінки з go/no-go критеріями
    name: TEST_STRATEGY.md
  - desc: Risk-based coverage matrix
    name: coverage-matrix.xlsx
  - desc: LLM та RAG evals на golden dataset
    name: evals/llm/ · evals/rag/
  - desc: Agent tests, tool-call checks, red teaming
    name: tests/agent/ · tests/security/
  - desc: AI test framework з LLM-as-a-Judge і звітом
    name: framework/
  - desc: 'CI/CD pipeline: quality gates + AI code review + release'
    name: .github/workflows/
  - desc: Agentic QA workflow для review, test generation, документації
    name: agentic-workflow/
  - desc: 'Документація і чесний опис: де AI допоміг, а де заважав'
    name: README.md
  title: Production-ready Agentic QA Project
promise: 'Навчіться тестувати системи без одного правильного expected result: LLM, RAG та AI-агенти — від risk strategy до quality gates у production CI/CD.'
registration_url: https://forms.gle/Lz1ZfjUBWzrK8sQn7
related:
- k6-performance-testing
- scale-quality
seo_title: Agentic QA — курс з тестування LLM, RAG та AI-агентів | QAStudy.online
skills:
- Будувати test strategy для AI-продуктів
- Тестувати системи без одного expected result
- Автоматизувати LLM та RAG evals
- Тестувати AI-агентів і tool calls
- Знаходити AI security-ризики
- Збирати власний AI test framework
- Вбудовувати quality gates у CI/CD
- Використовувати AI-агентів у QA workflow
stack:
- group: Evals
  items:
  - DeepEval
  - Promptfoo
  - RAGAS
  - LLM-as-a-Judge
- group: Агенти та інструменти
  items:
  - MCP
  - Tool calls
  - Traces
- group: Моделі
  items:
  - Ollama
  - Cloud LLM
  - Model Benchmark
- group: Security
  items:
  - OWASP LLM Top 10
  - Red teaming
- group: CI/CD та AI-асистенти
  items:
  - GitHub Actions
  - Claude Code
  - GitHub Copilot
title: Agentic QA
transition: Middle+ QA → AI Quality Engineer
weight: 1
---
