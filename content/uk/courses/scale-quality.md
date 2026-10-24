---
aliases:
- /scale-quality-program/
card:
  anchor: program-scale-quality
  create:
  - Quality Strategy
  - Risk Map
  - Governance Framework
  event: program_scale_click
  master:
  - Архітектура як карта ризиків
  - Risk-based стратегія за ISO 29119
  - DORA-метрики та governance
  - Комунікація з product і C-level
  meta:
  - label: Рівень
    value: Senior–Architect
  - label: Занять
    value: '35'
  - label: Тривалість
    value: ~33 тижні
  quote: «Хочу впливати на якість на рівні архітектури і процесів, а не окремих тестів»
  waitlist: scale-quality
description: 'Курс для Senior QA та Lead-інженерів: побудуйте QA-архітектуру та стратегію тестування за ISTQB CTAL-TM, ISO 29119, DORA та CT-AI. 35 занять, 8 блоків, Capstone-захист.'
direction: QA Architecture
enrollment:
  label: Набір скоро відкриється
  state: soon
faq:
- a: Так. Курс розроблений саме для тих, хто вже в Lead-ролі або впритул до неї. Якщо ви виконуєте роботу лідера, але ще не маєте системних інструментів (стратегія, governance, OKR, C-level комунікація) — ви в правильному місці.
  q: Я вже QA Lead — чи підійде мені цей курс?
- a: Для обох. Блоки з архітектурного аналізу ризиків і стратегії тестування однаково актуальні для product і outsource. Заняття 3 (Outsourcing vs product company) і заняття 33 (Discovery) дають окремий фрейм для сервісних компаній.
  q: Курс для продуктових компаній чи аутсорсу?
- a: Ні. Курс орієнтований на стратегію, архітектуру та управління, а не на написання тестів. Базове розуміння SDLC і тестування — достатньо.
  q: Чи потрібна технічна база — автоматизація, код?
- a: 2–3 год на живе заняття + 2–4 год на домашнє завдання (Capstone-артефакт для свого проєкту). Загалом 4–7 год/тиждень.
  q: Скільки часу потрібно на тиждень?
- a: Кожне заняття записується. Запис доступний одразу після заняття. Домашнє завдання можна здати з відставанням на 1 тиждень без штрафів.
  q: Що якщо я пропущу заняття?
- a: 'Так, сертифікат про проходження курсу. Але головний результат — це Capstone-пакет: реальний board-ready артефакт, який ви захищаєте і кладете в портфоліо.'
  q: Чи є сертифікат після завершення?
- a: Групи малі — деталі про старт і розмір групи уточнюються індивідуально. Залиште контакт — напишемо особисто.
  q: Коли старт і скільки людей у групі?
form:
  subject: QAStudy.online — заявка на Scale Quality
format:
- desc: 2–3 години на занятті, запис кожного.
  title: Живі заняття
- desc: Розбір кожного домашнього завдання і peer review між студентами групи.
  title: Персональний фідбек
- desc: Персональний фідбек на кожне ДЗ, а не формальна перевірка «пройшов / не пройшов».
  title: Мала група
- desc: Кожен студент захищає власний Capstone перед steering committee.
  title: Capstone-захист
# NEEDS CONFIRMATION: lessons, modules and duration for this program (playbook §29: 35 lessons, ~33 weeks)
lessons_total: 35
level_path:
- Senior
- Lead
- Architect
meta:
- label: Занять
  value: '35'
- label: Тривалість
  value: ~33 тижні
- label: Рівень
  value: Senior–Architect
- label: Група
  value: 8–12 осіб
modules:
- color: blue
  lessons:
  - desc: Розвилка ролей QA Manager vs QA Architect, чотири спільні осі (risk, metrics, governance, strategy), career ladder та вибір Project X.
    'n': Вступ
    practice: кожен студент формулює кандидата на власний Project X і пояснює, де зараз у ланцюгу.
    title: Mindset & Framing
  lessons_count: 1 заняття
  meta: 1 вступний модуль · без домашнього завдання
  num: 0
  title: Mindset & Framing
- color: green
  lessons:
  - desc: Як архітектурний стиль системи диктує, де ставити тест-рівні й де народжуються ризики якості?
    homework: Project X brief + адаптована тест-піраміда + перевірка tenant isolation.
    'n': '1'
    practice: розбір реальної архітектурної діаграми — класифікація стилю, позначення тест-рівнів і risk-точок.
    title: Application architectures для QA
  - desc: Як із архітектурної картини знайти зони ризику й точки нетестованості раніше, ніж вони стануть інцидентом?
    homework: Architecture-to-risk map для Project X (компонент → ризик якості → тест-рівень).
    'n': '2'
    practice: позначення 5 risk hotspots на спільній діаграмі з аргументацією пріоритету.
    title: 'Читання системи: testability, risk hotspots, тест-рівні'
  - desc: Як той самий продукт вимагає різної стратегії, метрик і governance залежно від моделі залучення?
    homework: one-page порівняння керування якістю Project X як аутсорсер vs product owner.
    'n': '3'
    practice: для одного продукту — що змінюється в підході QA-лідера як аутсорсера vs власника продукту.
    title: 'Outsourcing vs product company: різниця в управлінні'
  lessons_count: 3 заняття
  meta: заняття 1–3 · Senior
  num: 1
  title: Architecture-aware QA
- color: orange
  lessons:
  - desc: Як систематично перетворити «що може піти не так» на пріоритети тестування — до того, як щось пішло не так?
    homework: Risk register ≥12 ризиків + risk matrix для Project X.
    'n': '4'
    practice: побудова risk matrix, калібрування likelihood/impact у групі.
    title: Risk-based testing від початку до кінця
  - desc: Який документ за що відповідає — і чому плутанина рівнів руйнує governance?
    homework: чернетка organizational test policy + позначення рівня Project X.
    'n': '5'
    practice: розкласти набір реальних документів по рівнях ієрархії 29119.
    title: 'Ієрархія документів: policy → strategy → plan'
  - desc: Як відрізнити артефакт, що знижує ризик, від документації заради документації?
    homework: artifact justification table для 6 артефактів Project X (навіщо, хто споживач, ризик відсутності).
    'n': '6'
    practice: 'критика over- і under-documented прикладів з пропозицією балансу.'
    title: 'Навіщо існують артефакти: traceability, auditability, «just enough»'
  - desc: Як зібрати ризики, архітектуру й контекст в одну project test strategy, захищувану перед бордом?
    homework: Draft Test Strategy v1 (scope, approach, levels, objectives, risks-link).
    'n': '7'
    practice: написання секції «test approach + objectives» для навчального кейсу.
    title: Написання тест-стратегії (Test Strategy v1)
  - desc: На яких даних і хто приймає go/no-go — і як явно прийняти залишковий ризик?
    homework: quality-gate / release-readiness checklist для Project X.
    'n': '8'
    practice: проєктування одного quality gate з вхідними/вихідними критеріями.
    title: Quality gates і release readiness
  lessons_count: 5 занять
  meta: заняття 4–8 · Senior → Lead
  num: 2
  title: Ризики, тест-стратегія та документація
- color: red
  lessons:
  - desc: Чим «метрика для команди» відрізняється від «метрики для борду»?
    homework: metrics specification для Project X (метрика + формула + джерело).
    'n': '9'
    practice: для сценарію обрати 5 метрик і аргументувати вибір.
    title: Метрики тестування, що мають значення
  - desc: Як поєднати швидкість доставки і стабільність в одну картину?
    homework: metrics spec v2 + макет dashboard з QA + DORA + DX Core 4 метриками.
    'n': '10'
    practice: інтерпретація набору DORA-даних — де команда сильна, де нестабільність.
    title: 'Delivery & quality analytics: DORA + DX Core 4'
  - desc: Як зібрати дашборд, який реально читають?
    homework: GQM-дерево для Project X + рефайн mock dashboard.
    'n': '11'
    practice: GQM від однієї бізнес-цілі до 2–3 метрик.
    title: Quality dashboard, vanity metrics і GQM
  - desc: Як оцінити зрілість тест-процесу об'єктивно й спланувати покращення на даних?
    homework: TMMi maturity self-assessment + improvement roadmap для Project X.
    'n': '12'
    practice: швидкий TMMi self-assessment навчальної організації.
    title: 'Моделі покращення процесів: TMMi та IDEAL'
  - desc: Де в CI/CD-конвеєрі живе контроль якості?
    homework: release-process quality-control checklist для Project X.
    'n': '13'
    practice: нанесення quality signals на схему CI/CD pipeline.
    title: Релізний процес і контроль якості на ньому
  lessons_count: 5 занять
  meta: заняття 9–13 · Lead
  num: 3
  title: Метрики, аналітика та покращення процесів
- color: violet
  lessons:
  - desc: Де AI прискорює доставку, а де дестабілізує?
    homework: AI-SDLC impact map для Project X.
    'n': '14'
    practice: AI-SDLC impact map для Project X (фаза → допомога → ризик нестабільності).
    title: Ландшафт AI-SDLC
  - desc: Як застосувати GenAI до реальних тест-задач так, щоб якість не «провисала»?
    homework: prompt-engineered test-artifact pack + human-review log.
    'n': '15'
    practice: генерація тест-кейсів з поганим та хорошим входом — порівняти якість.
    title: GenAI для тестувальної роботи
  - desc: Як перевіряти систему без детермінованого oracle?
    homework: test approach для AI/GenAI-фічі Project X (non-deterministic поведінка, drift, bias).
    'n': '16'
    practice: проєктування metamorphic-тестів і сурогатного oracle для недетермінованого виходу.
    title: Тестування AI-систем
  - desc: Які ризики AI неможливо «відтестувати» технічно?
    homework: AI-risk register для Project X (hallucination, bias, privacy, drift) з мітигацією.
    'n': '17'
    practice: побудова AI-risk register на навчальному кейсі.
    title: Ризики й governance AI у QA
  - desc: Як апгрейдити класичну тест-стратегію до AI-SDLC?
    homework: AI-SDLC upgrade до Test Strategy v2.
    'n': '18'
    practice: модифікація одного наявного quality gate під AI-фічу.
    title: Test Strategy в умовах AI-SDLC (v2)
  lessons_count: 5 занять
  meta: заняття 14–18 · Lead → Architect
  num: 4
  title: AI-SDLC та тестування AI-систем
- color: blue
  lessons:
  - desc: Як спроєктувати governance під масштаб проєкту?
    homework: governance model + RACI для Project X (large + medium варіанти).
    'n': '19'
    practice: CoE-структура для заданої організації.
    title: Проєктування governance
  - desc: Як перетворити quality-ціль на каскад OKR/KPI?
    homework: QA OKR/KPI set для Project X (3 OKR + supporting KPIs).
    'n': '20'
    practice: написати один QA-OKR з key results і відрізнити від KPI.
    title: 'Goal-setting: OKR, KPI, SMART'
  - desc: Де в Scrum чи Kanban живе test management?
    homework: QA-in-delivery model для Project X (де QA, як рухаються test-таски).
    'n': '21'
    practice: розміщення QA-активностей у Scrum-спринті vs Kanban-потоці.
    title: Agile-фреймворки для QA-лідерів
  - desc: Як зробити DoR/DoD/AC живими working agreements?
    homework: working-agreements pack (DoR-чеклист, багаторівневий DoD, AC-шаблон + 3 приклади).
    'n': '22'
    practice: переписати слабкий набір AC у Given/When/Then + додати testability в DoR.
    title: 'Working agreements: DoR / DoD / Acceptance Criteria'
  - desc: Як побудувати й розвивати QA-команду, щоб якість трималася на системі, а не на героїзмі?
    homework: team structure + hiring/mentoring plan для Project X.
    'n': '23'
    practice: hiring scorecard для однієї QA-ролі.
    title: Управління людьми для QA-лідерів
  - desc: Як проєктувати дефект-менеджмент і capacity planning?
    homework: defect lifecycle + capacity plan для Project X.
    'n': '24'
    practice: defect workflow зі станами й правилами переходів.
    title: Управління процесами
  lessons_count: 6 занять
  meta: заняття 19–24 · Lead
  num: 5
  title: Governance, люди та управління процесами
- color: green
  lessons:
  - desc: Як написати повідомлення про ризик так, щоб executive прийняв рішення за 30 секунд?
    homework: communication pack — risk-escalation email, go/no-go status, decision log entry.
    'n': '25'
    practice: переписати розпливчасте повідомлення у decision-oriented форму.
    title: Письмова комунікація технічного лідера
  - desc: Як зробити, щоб «релізний ризик у $X» переважив «ми знайшли 200 багів»?
    homework: executive one-pager — обґрунтувати одне quality-рішення мовою бізнесу.
    'n': '26'
    practice: зібрати бізнес-аргумент за/проти релізу для умовного борду.
    title: Вплив на стейкхолдерів без формальної влади
  - desc: Як зібрати артефакти M1–M5 в один board-ready пакет без суперечностей?
    homework: Integrated Capstone Test Strategy package (M1–M5 в одному документі).
    'n': '27'
    practice: складання чернетки пакета + cross-review між студентами.
    title: Capstone integration workshop
  - desc: Чи здатен студент захистити стратегічне рішення під тиском питань?
    homework: defense deck + живий захист.
    'n': '28'
    title: Захист Capstone перед steering committee
  lessons_count: 4 заняття
  meta: заняття 25–28 · Lead → Manager/Architect
  num: 6
  title: Комунікація, вплив і захист Capstone
- color: orange
  lessons:
  - desc: Як перетворити сухі метрики на наратив, який топ-менеджмент запам'ятає? Структура «ситуація → ускладнення → вирішення → результат»; адаптація під аудиторію (команда / менеджмент / C-level).
    homework: storytelling-версія метрик-звіту Project X (до 1 стор. + нотатки для усної подачі).
    'n': '29'
    title: Storytelling для QA-лідера
  - desc: Як «продати» QA-ініціативу через цінність для стейкхолдера — і подолати «нема часу / бюджету / не пріоритет»? Value proposition для QA-ініціативи; подолання заперечень; продаж тиском vs цінністю.
    homework: pitch на продаж однієї QA-ініціативи Project X.
    'n': '30'
    title: 'How to Sell: продаж ідей і якості всередині організації'
  - desc: Чому зміни в процесах провалюються — і як провести трансформацію, щоб вона закріпилася? ADKAR / Kotter для QA-трансформацій; роль change agent; sustain після впровадження.
    homework: change-management plan для однієї зміни в Project X.
    'n': '31'
    title: 'Driving the Change: управління змінами в QA-процесах'
  - desc: 'Коли TaaS доцільний, а коли краще власна команда? Моделі ціноутворення; ризики: залежність від провайдера, контроль якості, knowledge transfer.'
    homework: one-page аналіз TaaS для частини тестування Project X.
    'n': '32'
    title: TaaS (Testing as a Service)
  - desc: Як за перші два тижні в новому проєкті зібрати картину, якої ще немає? Стейкхолдери, процеси, болі команди, очікування клієнта; типові помилки — поспішні висновки.
    homework: discovery plan для нового залучення на Project X.
    'n': '33'
    title: 'Discovery: оцінка проєкту на старті залучення'
  - desc: 'Як діяти, коли якість «горить» — і як вийти з режиму постійного пожежника? Продакшн-інцидент, провалений дедлайн, масовий приплив дефектів: пріоритети та комунікація.'
    homework: firefighting playbook для Project X (ролі, комунікація, ескалація, post-mortem).
    'n': '34'
    title: 'Firefighting: управління якістю в кризі'
  - desc: Як вести переговори про терміни, обсяг тестування й бюджет з позиції інтересів? Позиції vs інтереси; BATNA як джерело сили; win-win замість конфронтації.
    homework: negotiation brief для кейсу в Project X (інтереси, BATNA, тактики іншої сторони).
    'n': '35'
    title: Basics of Successful Negotiations
  lessons_count: 7 занять
  meta: заняття 29–35 · Lead → Manager/Architect
  num: 7
  title: 'Лідерські навички: вплив, зміни та кризи'
personas:
- outcome: Навчитеся читати архітектуру системи як джерело ризиків, будувати risk-based стратегію й говорити з product мовою рішень — а не мовою дефектів.
  quote: «Я добре тестую, але не знаю, як масштабувати вплив на якість за межами власних тасок»
  role: Senior QA → Lead
- outcome: 'Отримаєте фреймворк QA-функції: RACI-модель, metrics-based управління — і вмітимете захищати quality-рішення перед steering committee.'
  quote: «Я відповідаю за процес і релізи, але governance, OKR і C-level комунікація — моє слабке місце»
  role: Lead → Test Manager / Head of QA
- outcome: 'Пройдете повний ланцюг: architecture-to-risk map, risk-based стратегія, DORA-метрики, тестування AI-систем, governance та стратегічний вплив.'
  quote: «Хочу бути власником технічної тест-стратегії й архітектури якості на рівні продукту»
  role: Senior QA / SDET → QA Architect
price:
  amount: 120 000 грн
  aside:
    links:
    - text: Glassdoor UK
      url: https://www.glassdoor.co.uk/Salaries/head-of-qa-salary-SRCH_KO0,10.htm
    - text: Glassdoor DE
      url: https://www.glassdoor.com/Salaries/germany-head-of-qa-salary-SRCH_IL.0,7_IN96_KO8,18.htm
    - text: Glassdoor US
      url: https://www.glassdoor.com/Salaries/head-of-qa-salary-SRCH_KO0,10.htm
    text: 'Head of QA та QA Architect — серед найвище оплачуваних ролей у тестуванні. За даними Glassdoor (2026): Великобританія — £83 554/рік, Німеччина — €97 001/рік, США — $189 075/рік. Курс готує саме до цього переходу — і окупається за один–два місяці після зміни ролі.'
    title: Чому курс окупається
  currency: UAH
  included:
  - Живі заняття 2–3 год + запис кожного
  - Персональний фідбек на кожне домашнє завдання
  - Peer review між студентами групи
  - Capstone-захист перед steering committee
  - Шаблони, canvas, чеклисти для всіх 19 артефактів
  - Telegram-спільнота групи та підтримка між заняттями
  - Board-ready Test Strategy пакет — реальний артефакт для портфоліо
  note: 'Повна вартість програми: 8 блоків, 35 занять, ~33 тижні.'
  value: 120000
program_intro: 'Побудуйте QA-архітектуру та стратегію тестування, яка витримає ріст продукту і команди: від architecture-to-risk map до захисту Capstone перед steering committee.'
project:
  intro: 'Протягом курсу ви будуєте реальний board-ready пакет для свого поточного проєкту — не навчальний кейс, а робочий артефакт, з яким виходите на наступну роль. 19 deliverables, єдиний захист:'
  items:
  - desc: Architecture-to-risk map + Project X brief
    name: M1
  - desc: Risk register ≥12 ризиків + risk matrix
    name: M2
  - desc: Project Test Strategy v1 → v2 з AI-SDLC апгрейдом
    name: M2→M4
  - desc: Quality-gate / release-readiness checklist
    name: M2
  - desc: 'Metrics specification + mock dashboard: QA + DORA + DX Core 4'
    name: M3
  - desc: TMMi maturity assessment + improvement roadmap
    name: M3
  - desc: AI-risk register + test approach для AI/GenAI-фічі
    name: M4
  - desc: Governance model + RACI — large & medium варіанти
    name: M5
  - desc: 'Working-agreements pack: DoR / DoD / AC'
    name: M5
  - desc: QA OKR/KPI set + team & hiring plan
    name: M5
  - desc: 'Communication pack: risk-escalation email, go/no-go status, decision log'
    name: M6
  - desc: Defense deck + захист 20 хв + 15 хв питань від steering committee
    name: M6
  - desc: 'Storytelling-наратив: метрики → наратив для топ-менеджменту'
    name: M7
  - desc: 'Sales pitch: продаж QA-ініціативи з відпрацюванням заперечень'
    name: M7
  - desc: Change-management plan за ADKAR / Kotter
    name: M7
  - desc: 'TaaS feasibility analysis: скоуп, ризики, SLA'
    name: M7
  - desc: 'Discovery plan: перші два тижні в новому проєкті'
    name: M7
  - desc: 'Firefighting playbook: ролі, комунікація, ескалація, post-mortem'
    name: M7
  - desc: 'Negotiation brief: інтереси, BATNA, тактики іншої сторони'
    name: M7
  title: Capstone Test Strategy
promise: Побудуйте QA-архітектуру та стратегію тестування, яка витримає ріст продукту і команди.
registration_url: https://forms.gle/PcUc2AhwqZQPfg9y7
related:
- agentic-qa
- k6-performance-testing
seo_title: Scale Quality — QA-архітектура та стратегія якості для Senior і Lead | QAStudy.online
skills:
- Читати архітектуру системи (monolith, microservices, cloud-native) і перетворювати її на карту ризиків і тест-рівнів — бачити проблеми до того, як їх побачили розробники
- Будувати project test strategy за ISO 29119 — від risk register до quality gates і release readiness
- Вимірювати якість через delivery-метрики й будувати GQM-дашборди, які реально читають у команді
- 'Тестувати AI-системи без детермінованого oracle: metamorphic-тести, red-teaming, CT-AI / CT-GenAI'
- Проєктувати QA-функцію (CoE, RACI), каскадувати OKR/KPI і вести working agreements — керувати якістю організаційно, а не тільки технічно
- Комунікувати ризик executives мовою бізнесу і захищати trade-offs перед steering committee
title: Scale Quality
transition: Senior QA / Lead → QA Architect / Head of QA
weight: 3
---
