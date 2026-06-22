---
title: "Повна програма курсу: Scale Quality — Test Management & QA Architecture"
description: "Детальна програма курсу Scale Quality для Senior QA: 35 занять, 7 блоків — від architecture-to-risk до Capstone-захисту перед steering committee. ISTQB CTAL-TM · ISO 29119 · DORA · CT-AI."
layout: "program"
registration_url: "#"
cta_label: "Подати заявку →"
course_url: "/courses/scale-quality/"
back_label: "← Назад до опису курсу"
---

## Загальна інформація

- **Рівень:** Senior QA → Lead / Test Manager / QA Architect
- **Формат:** живі заняття 2–3 год + домашнє завдання + фідбек + Capstone-захист
- **Тривалість:** ~33 тижні (Блоки 0–7)
- **Кількість занять:** 1 вступний модуль + 35 занять (Блоки 1–7) + Capstone-захист (Заняття 28)
- **Наскрізний проєкт:** «Project X» — реальна або обрана студентом система (microservices + GenAI-фіча); всі домашні завдання формують єдиний Capstone Test Strategy пакет

**Наскрізний ланцюг:**
> Архітектурна свідомість → Ризик-стратегія → Вимірюване покращення → AI-SDLC адаптація → Організаційне врядування → Стратегічний вплив

---

## Зміст

- [Блок 0. Mindset & Framing](#блок-0-mindset--framing)
- [Блок 1. Architecture-aware QA](#блок-1-architecture-aware-qa)
- [Блок 2. Ризики, тест-стратегія та документація](#блок-2-ризики-тест-стратегія-та-документація)
- [Блок 3. Метрики, аналітика та покращення процесів](#блок-3-метрики-аналітика-та-покращення-процесів)
- [Блок 4. AI-SDLC та тестування AI-систем](#блок-4-ai-sdlc-та-тестування-ai-систем)
- [Блок 5. Governance, люди та управління процесами](#блок-5-governance-люди-та-управління-процесами)
- [Блок 6. Комунікація, вплив і захист Capstone](#блок-6-комунікація-вплив-і-захист-capstone)
- [Блок 7. Лідерські навички: вплив, зміни та кризи](#блок-7-лідерські-навички-вплив-зміни-та-кризи)
- [Фінальний проєкт (Capstone)](#фінальний-проєкт-capstone)

---

## Блок 0. Mindset & Framing

*Вступний модуль. Без домашнього завдання. Задає мову курсу й запускає наскрізний ланцюг.*

Питання модуля: що насправді означає «масштабувати вплив на якість» — і як QA-лідер переходить від технічних задач до стратегічних рішень?

**Зміст:**
- Чотири осі курсу: risk, metrics, governance, strategy
- Career ladder: Senior QA → Lead → Test Manager / QA Architect → Head of Quality
- «Project X» як наскрізний носій усіх артефактів курсу

**Практика:** кожен студент формулює кандидата на власний Project X і пояснює, де зараз у ланцюгу.

---

## Блок 1. Architecture-aware QA

*Заняття 1–3. Мета блоку: навчитись читати архітектуру системи як джерело ризиків і тест-рівнів.*

### Заняття 1. Application architectures для QA

Як архітектурний стиль системи диктує, де ставити тест-рівні й де народжуються ризики якості?

- Monolith vs microservices vs serverless vs event-driven — де змінюється форма тест-піраміди
- Інтеграційні vs контрактні межі; multi-tenant ізоляція
- Cloud-native: autoscaling, service mesh, observability як джерело тест-сигналів

**Практика:** розбір реальної архітектурної діаграми — класифікація стилю, позначення тест-рівнів і risk-точок.

**ДЗ (M1):** Project X brief + адаптована тест-піраміда + перевірка tenant isolation.

### Заняття 2. Читання системи: testability, risk hotspots, тест-рівні

Як із архітектурної картини знайти зони ризику й точки нетестованості раніше, ніж вони стануть інцидентом?

- Залежності та інтеграційні межі як концентратори ризику
- Точки нетестованості: де бракує спостережуваності, контролю стану, ізоляції
- Дані як джерело ризику: спільні сторіджі, прихований стан

**Практика:** позначення 5 risk hotspots на спільній діаграмі з аргументацією пріоритету.

**ДЗ (M1):** Architecture-to-risk map для Project X (компонент → ризик якості → тест-рівень).

### Заняття 3. Outsourcing vs product company: різниця в управлінні

Як той самий продукт вимагає різної стратегії, метрик і governance залежно від моделі залучення?

- Де закінчується твоя відповідальність і починається клієнтська
- Engagement-моделі: staff augmentation, managed/TCoE, dedicated team
- Як змінюється набір метрик і канал комунікації

**Практика:** для одного продукту — що змінюється в підході QA-лідера як аутсорсера vs власника продукту.

**ДЗ (M1):** one-page порівняння керування якістю Project X як аутсорсер vs product owner.

---

## Блок 2. Ризики, тест-стратегія та документація

*Заняття 4–8. Мета блоку: перетворити карту ризиків на стратегію й артефакти за ISO 29119 + ISTQB. Ядро курсу.*

### Заняття 4. Risk-based testing від початку до кінця

Як систематично перетворити «що може піти не так» на пріоритети тестування — до того, як щось пішло не так?

- Quality risks vs project risks; likelihood × impact
- Risk register + risk matrix + мітигація через пріоритезацію тестів
- Залишковий ризик як те, що доведеться явно прийняти

**Практика:** побудова risk matrix, калібрування likelihood/impact у групі.

**ДЗ (M2):** Risk register ≥12 ризиків + risk matrix для Project X.

### Заняття 5. Ієрархія документів: policy → strategy → plan

Який документ за що відповідає — і чому плутанина рівнів руйнує governance?

- Organizational test policy vs organizational test strategy vs project test strategy vs test plan
- Risk-based підхід як мандат ISO 29119 Part 3
- Шаблони та позиціонування Project X у ієрархії

**Практика:** розкласти набір реальних документів по рівнях ієрархії 29119.

**ДЗ:** чернетка organizational test policy + позначення рівня Project X.

### Заняття 6. Навіщо існують артефакти: traceability, auditability, «just enough»

Як відрізнити артефакт, що знижує ризик, від документації заради документації?

- Traceability, auditability, onboarding, decision records — що ламається без кожного
- Ціна over- і under-documentation; «just enough» як свідоме рішення

**Практика:** критика over- і under-documented прикладів з пропозицією балансу.

**ДЗ:** artifact justification table для 6 артефактів Project X (навіщо, хто споживач, ризик відсутності).

### Заняття 7. Написання тест-стратегії (Test Strategy v1)

Як зібрати ризики, архітектуру й контекст в одну project test strategy, захищувану перед бордом?

- Test approach як наслідок архітектури (Блок 1) і ризиків (Заняття 4)
- SMART test objectives; узгодження стратегії з ризиками
- Де стратегія найчастіше розривається з реальністю

**Практика:** написання секції «test approach + objectives» для навчального кейсу.

**ДЗ (M2):** Draft Test Strategy v1 (scope, approach, levels, objectives, risks-link).

### Заняття 8. Quality gates і release readiness

На яких даних і хто приймає go/no-go — і як явно прийняти залишковий ризик?

- Вхідні / вихідні критерії gate як контракт, а не формальність
- Residual risk sign-off: чия відповідальність
- Де gate перетворюється на бюрократію й гальмує реліз

**Практика:** проєктування одного quality gate з вхідними/вихідними критеріями.

**ДЗ (M2):** quality-gate / release-readiness checklist для Project X.

---

## Блок 3. Метрики, аналітика та покращення процесів

*Заняття 9–13. Мета блоку: зробити стратегію вимірюваною через метрики, DORA та моделі зрілості.*

### Заняття 9. Метрики тестування, що мають значення

Чим «метрика для команди» відрізняється від «метрики для борду»?

- Management / monitoring / control / completion metrics — різні споживачі
- Defect density, escaped defects, test effectiveness, coverage, flakiness
- Де метрика викривлює поведінку команди

**Практика:** для сценарію обрати 5 метрик і аргументувати вибір.

**ДЗ:** metrics specification для Project X (метрика + формула + джерело).

### Заняття 10. Delivery & quality analytics: DORA + DX Core 4

Як поєднати швидкість доставки і стабільність в одну картину?

- Throughput (deployment frequency, lead time, recovery time) + stability (change failure rate)
- DX Core 4: speed, effectiveness, quality, impact
- DORA 2025: AI підвищує throughput, але дестабілізує delivery без сильного тестування

**Практика:** інтерпретація набору DORA-даних — де команда сильна, де нестабільність.

**ДЗ (M3):** metrics spec v2 + макет dashboard з QA + DORA + DX Core 4 метриками.

### Заняття 11. Quality dashboard, vanity metrics і GQM

Як зібрати дашборд, який реально читають?

- Чому дашборди вмирають: забагато, не під рішення, без власника
- Vanity metrics і гейміфікація як ризик довіри до даних
- GQM: метрика як наслідок цілі, а не навпаки

**Практика:** GQM від однієї бізнес-цілі до 2–3 метрик.

**ДЗ:** GQM-дерево для Project X + рефайн mock dashboard.

### Заняття 12. Моделі покращення процесів: TMMi та IDEAL

Як оцінити зрілість тест-процесу об'єктивно й спланувати покращення на даних?

- TMMi (5 рівнів, 16 process areas); IDEAL як цикл покращення
- Analytical vs model-based improvement; ретроспектива як інструмент

**Практика:** швидкий TMMi self-assessment навчальної організації.

**ДЗ (M3):** TMMi maturity self-assessment + improvement roadmap для Project X.

### Заняття 13. Релізний процес і контроль якості на ньому

Де в CI/CD-конвеєрі живе контроль якості?

- Місце тест-стейджу в pipeline; що блокує, а що сигналить
- CI/CD quality signals як джерело даних для quality gate (Заняття 8)
- Release trains: якість при частих релізах

**Практика:** нанесення quality signals на схему CI/CD pipeline.

**ДЗ (M3):** release-process quality-control checklist для Project X.

---

## Блок 4. AI-SDLC та тестування AI-систем

*Заняття 14–18. Мета блоку: апгрейд стратегії під non-determinism, нові ризики й gates. ISTQB CT-AI / CT-GenAI, ISO 25059.*

### Заняття 14. Ландшафт AI-SDLC

Де AI прискорює доставку, а де дестабілізує?

- DORA 2025: AI підвищує throughput, але потребує сильного тестування / version control / feedback loops
- DORA AI Capabilities Model; фази SDLC — де прискорення vs де компенсаційне тестування

**Практика:** AI-SDLC impact map для Project X (фаза → допомога → ризик нестабільності).

**ДЗ:** AI-SDLC impact map для Project X.

### Заняття 15. GenAI для тестувальної роботи

Як застосувати GenAI до реальних тест-задач так, щоб якість не «провисала»?

- Генерація тест-кейсів з user stories, synthetic data; human-review як обов'язковий gate
- Self-healing automation і regression selection — межі довіри; ландшафт інструментів

**Практика:** генерація тест-кейсів з поганим та хорошим входом — порівняти якість.

**ДЗ (M4):** prompt-engineered test-artifact pack + human-review log.

### Заняття 16. Тестування AI-систем

Як перевіряти систему без детермінованого oracle?

- Non-determinism і проблема test oracle; bias / data quality / drift
- Metamorphic testing і сурогатний oracle; CT-AI / CT-GenAI; ISO 25059
- Red-teaming для LLM/RAG: prompt injection, jailbreak, витік даних

**Практика:** проєктування metamorphic-тестів і сурогатного oracle для недетермінованого виходу.

**ДЗ:** test approach для AI/GenAI-фічі Project X (non-deterministic поведінка, drift, bias).

### Заняття 17. Ризики й governance AI у QA

Які ризики AI неможливо «відтестувати» технічно?

- Hallucinations, data privacy, bias, drift — що технічне, а що організаційне
- Human-in-the-loop sign-off як обов'язковий gate; responsible-AI guardrails

**Практика:** побудова AI-risk register на навчальному кейсі.

**ДЗ:** AI-risk register для Project X (hallucination, bias, privacy, drift) з мітигацією.

### Заняття 18. Test Strategy в умовах AI-SDLC (v2)

Як апгрейдити класичну тест-стратегію до AI-SDLC?

- Де AI прискорює, де люди мусять верифікувати; нові quality gates під AI-фічі
- Апгрейд Test Strategy v1 → v2: AI-ризики, gates, метрики недетермінованої поведінки

**Практика:** модифікація одного наявного quality gate під AI-фічу.

**ДЗ (M4):** AI-SDLC upgrade до Test Strategy v2.

---

## Блок 5. Governance, люди та управління процесами

*Заняття 19–24. Мета блоку: побудувати організаційний каркас навколо стратегії.*

### Заняття 19. Проєктування governance

Як спроєктувати governance під масштаб проєкту?

- TCoE / QA CoE: централізоване governance + децентралізоване виконання
- RACI, escalation paths, quality councils; де governance душить замість уможливлювати

**Практика:** CoE-структура для заданої організації.

**ДЗ (M5):** governance model + RACI для Project X (large + medium варіанти).

### Заняття 20. Goal-setting: OKR, KPI, SMART

Як перетворити quality-ціль на каскад OKR/KPI?

- OKR vs KPI: outcome vs measure; каскадування company → QA team → individual
- SMART-цілі; робочі QA-OKR (escape rate 15% → 3%)

**Практика:** написати один QA-OKR з key results і відрізнити від KPI.

**ДЗ (M5):** QA OKR/KPI set для Project X (3 OKR + supporting KPIs).

### Заняття 21. Agile-фреймворки для QA-лідерів

Де в Scrum чи Kanban живе test management?

- Механіка Scrum і Kanban: де QA-активності; гібридні моделі
- Де тестування «випадає» з процесу і як це виправити

**Практика:** розміщення QA-активностей у Scrum-спринті vs Kanban-потоці.

**ДЗ:** QA-in-delivery model для Project X (де QA, як рухаються test-таски).

### Заняття 22. Working agreements: DoR / DoD / Acceptance Criteria

Як зробити DoR/DoD/AC живими working agreements?

- DoR: коли item testable / estimable / sized; testability як зона QA-лідера
- DoD (story / sprint / release): операціоналізує quality gate Заняття 8
- AC: Given/When/Then, rule-based, checklist; зв'язок з ATDD/BDD

**Практика:** переписати слабкий набір AC у Given/When/Then + додати testability в DoR.

**ДЗ (M5):** working-agreements pack (DoR-чеклист, багаторівневий DoD, AC-шаблон + 3 приклади).

### Заняття 23. Управління людьми для QA-лідерів

Як побудувати й розвивати QA-команду, щоб якість трималася на системі, а не на героїзмі?

- Структура команди, hiring, менторинг, performance, 1:1, career development
- Estimation і resource allocation як джерело ризику зриву

**Практика:** hiring scorecard для однієї QA-ролі.

**ДЗ (M5):** team structure + hiring/mentoring plan для Project X.

### Заняття 24. Управління процесами

Як проєктувати дефект-менеджмент і capacity planning?

- Defect lifecycle governance: workflow зі станами й переходами
- Capacity planning як основа реалістичних обіцянок

**Практика:** defect workflow зі станами й правилами переходів.

**ДЗ:** defect lifecycle + capacity plan для Project X.

---

## Блок 6. Комунікація, вплив і захист Capstone

*Заняття 25–28. Мета блоку: довести технічно правильне рішення до прийнятого.*

### Заняття 25. Письмова комунікація технічного лідера

Як написати повідомлення про ризик так, щоб executive прийняв рішення за 30 секунд?

- Frontloading контексту: purpose → context → requested action → urgency
- Вибір каналу: chat / email / shared docs; decision logs як інституційна пам'ять

**Практика:** переписати розпливчасте повідомлення у decision-oriented форму.

**ДЗ (M6):** communication pack — risk-escalation email, go/no-go status, decision log entry.

### Заняття 26. Вплив на стейкхолдерів без формальної влади

Як зробити, щоб «релізний ризик у $X» переважив «ми знайшли 200 багів»?

- Фреймінг якості бізнес-мовою: ризик у грошах і наслідках
- Побудова go/no-go кейсу для борду; escalation etiquette

**Практика:** зібрати бізнес-аргумент за/проти релізу для умовного борду.

**ДЗ:** executive one-pager — обґрунтувати одне quality-рішення мовою бізнесу.

### Заняття 27. Capstone integration workshop

Як зібрати артефакти M1–M5 в один board-ready пакет без суперечностей?

- Точки конфлікту: стратегія vs метрики vs governance
- Peer review як механізм виявлення суперечностей; цілісність наративу

**Практика:** складання чернетки пакета + cross-review між студентами.

**ДЗ:** Integrated Capstone Test Strategy package (M1–M5 в одному документі).

### Заняття 28. Захист Capstone перед steering committee

Чи здатен студент захистити стратегічне рішення під тиском питань?

- 20 хвилин презентації + 15 хвилин питань від менторів у ролі steering committee
- Фокус: trade-offs, залишкові ризики, обґрунтування метрик і go/no-go
- Приклади питань: «Який залишковий ризик ти свідомо приймаєш?», «Чому ця метрика, а не та?»

**ДЗ (M6):** defense deck + живий захист.

---

## Блок 7. Лідерські навички: вплив, зміни та кризи

*Заняття 29–35. Завершальний блок курсу: лідерські інструменти для QA-лідера.*

### Заняття 29. Storytelling для QA-лідера

Як перетворити сухі метрики на наратив, який топ-менеджмент запам'ятає?

Структура «ситуація → ускладнення → вирішення → результат»; адаптація під аудиторію (команда / менеджмент / C-level).

**ДЗ (M7.1):** storytelling-версія метрик-звіту Project X (до 1 стор. + нотатки для усної подачі).

### Заняття 30. How to Sell: продаж ідей і якості всередині організації

Як «продати» QA-ініціативу через цінність для стейкхолдера — і подолати «нема часу / бюджету / не пріоритет»?

Value proposition для QA-ініціативи; подолання заперечень; продаж тиском vs цінністю.

**ДЗ (M7.2):** pitch на продаж однієї QA-ініціативи Project X.

### Заняття 31. Driving the Change: управління змінами в QA-процесах

Чому зміни в процесах провалюються — і як провести трансформацію, щоб вона закріпилася?

ADKAR / Kotter для QA-трансформацій; роль change agent; sustain після впровадження.

**ДЗ (M7.3):** change-management plan для однієї зміни в Project X.

### Заняття 32. TaaS (Testing as a Service)

Коли TaaS доцільний, а коли краще власна команда?

Моделі ціноутворення; ризики: залежність від провайдера, контроль якості, knowledge transfer.

**ДЗ (M7.4):** one-page аналіз TaaS для частини тестування Project X.

### Заняття 33. Discovery: оцінка проєкту на старті залучення

Як за перші два тижні в новому проєкті зібрати картину, якої ще немає?

Стейкхолдери, процеси, болі команди, очікування клієнта; типові помилки — поспішні висновки.

**ДЗ (M7.5):** discovery plan для нового залучення на Project X.

### Заняття 34. Firefighting: управління якістю в кризі

Як діяти, коли якість «горить» — і як вийти з режиму постійного пожежника?

Продакшн-інцидент, провалений дедлайн, масовий приплив дефектів: пріоритети та комунікація.

**ДЗ (M7.6):** firefighting playbook для Project X (ролі, комунікація, ескалація, post-mortem).

### Заняття 35. Basics of Successful Negotiations

Як вести переговори про терміни, обсяг тестування й бюджет з позиції інтересів?

Позиції vs інтереси; BATNA як джерело сили; win-win замість конфронтації.

**ДЗ (M7.7):** negotiation brief для кейсу в Project X (інтереси, BATNA, тактики іншої сторони).

---

## Фінальний проєкт (Capstone)

**Що проєкт доводить:** студент здатен прийняти й захистити стратегічне рішення про якість продукту в умовах AI-SDLC. Capstone демонструє всі сім стадій ланцюга на одній системі (Project X).

### Deliverables (M1–M7) — 19 артефактів

1. Architecture-to-risk map (M1) — ≥10 рядків
2. Risk register + risk matrix (M2) — ≥12 ризиків
3. Project Test Strategy v1 → v2 (M2→M4) — 29119-aligned + AI-SDLC апгрейд
4. Quality-gate / release-readiness checklist (M2)
5. Metrics specification + mock dashboard (M3) — QA + DORA + DX Core 4
6. TMMi maturity assessment + improvement roadmap (M3)
7. AI-risk register + AI-feature test approach (M4)
8. Governance model + RACI, large & medium (M5)
9. Working-agreements pack — DoR / DoD / AC (M5)
10. QA OKR/KPI set + team & hiring/mentoring plan (M5)
11. Communication pack — escalation email, go/no-go status, decision log (M6)
12. Defense deck (M6)
13. Storytelling-наратив: метрики → наратив для топ-менеджменту (M7)
14. Sales pitch: продаж QA-ініціативи (M7)
15. Change-management plan за ADKAR / Kotter (M7)
16. TaaS feasibility analysis: скоуп, ризики, SLA (M7)
17. Discovery plan: перші два тижні в новому проєкті (M7)
18. Firefighting playbook: ролі, комунікація, ескалація, post-mortem (M7)
19. Negotiation brief: інтереси, BATNA, тактики іншої сторони (M7)

### Формат захисту (Заняття 28)

~20 хв презентація + ~15 хв питань від «steering committee». Фокус — trade-offs, залишкові ризики, обґрунтування метрик і go/no-go.

Приклади питань: «Чому саме такий threshold?», «Який залишковий ризик ти свідомо приймаєш?», «Де в AI-фічі немає детермінованого oracle і як ти це компенсуєш?»
