---
title: "Performance Testing з k6"
description: "Практичний курс з навантажувального тестування на k6 для DevOps та QA: від НФР і написання тестів до Observability, CI/CD, Kubernetes та Chaos Engineering. 15 занять, 4 блоки, рівень Middle–Senior."
date: 2026-06-15
draft: false
layout: "landing"

# Картка в списку курсів
level: "Middle–Senior"
category: "Performance тестування"
instructor: "Єгор Максимчук"
duration: "15 тижнів"
lessons: 15

# Посилання
registration_url: "https://forms.gle/e8LFL62Qd7WwQNwX8"
program_url: "/k6-performance-testing-program/"
doc_label: "Програма курсу повністю"

# Hero
eyebrow: "Курс"
subtitle: "Практичний курс для DevOps та QA: пишіть навантажувальні тести в k6, будуйте дашборди в Grafana, інтегруйте перформенс тестування в CI/CD та Kubernetes — і перевіряйте стійкість системи через chaos-тестування."
cta_label: "Залишити заявку →"
meta_pills:
  - "15 занять"
  - "Middle–Senior"
  - "Практика + ДЗ на кожному занятті"

audience:
  heading: "Для кого цей курс"
  cards:
    - role: "QA-інженери (middle/senior)"
      jtbd: "«Я вмію тестувати функціонал, але коли мене питають „а як воно поводиться під навантаженням“ — я губляюсь і не знаю, з чого почати». Навчишся формулювати НФР, писати й підтримувати k6-тести, читати метрики (InfluxQL/PromQL), будувати дашборди Grafana та знаходити регресії перформенсу до релізу."
    - role: "DevOps-інженери (middle/senior)"
      jtbd: "«У нас є CI/CD і моніторинг, але перформенс тести хтось запускає вручну раз на квартал — хочу, щоб це працювало автоматично і давало зрозумілий результат». Збудуєш observability-стек (k6 → storage → Grafana), вбудуєш k6 у CI/CD як gate, запустиш розподілені тести в Kubernetes через k6-operator і додаси AI-аналіз та chaos-експерименти."

competencies:
  heading: "Чого навчишся"
  items:
    - label: "НФР і процес"
      text: "Формулювати НФР і будувати процес перформенс тестування на проєкті."
    - label: "Тести в k6"
      text: "Писати якісні навантажувальні тести в k6, включно з AI-генерацією."
    - label: "Аналіз метрик"
      text: "Глибоко аналізувати метрики через InfluxDB (InfluxQL) та Prometheus (PromQL)."
    - label: "Дашборди Grafana"
      text: "Будувати дашборди в Grafana, включно з порівнянням run-to-run."
    - label: "UI Performance"
      text: "Тестувати UI-перформенс через k6 browser та вимірювати Web Vitals."
    - label: "CI/CD та Kubernetes"
      text: "Інтегрувати k6 в CI/CD та запускати розподілені тести в Kubernetes (k6-operator)."
    - label: "AI-аналіз і Chaos"
      text: "Підключати AI-агента для аналізу результатів і робити Chaos Testing з xk6-disruptor."

curriculum:
  heading: "Програма курсу"
  blocks:
    - title: "Блок 1. Основи процесу перформенс тестування"
      meta: "заняття 1 · базовий рівень"
      open: true
      lessons:
        - "Заняття 1. НФР та побудова процесу перформенс тестування на проєкті"
    - title: "Блок 2. k6 — написання тестів, дашборди та AI-генерація"
      meta: "заняття 2–4 · середній рівень"
      lessons:
        - "Заняття 2. Writing Tests, Key Metrics"
        - "Заняття 3. Default Dashboard (k6 dashboard extension та Grafana)"
        - "Заняття 4. AI-Powered Test Generation"
    - title: "Блок 3. Observability та метрики: InfluxDB, Prometheus, Grafana"
      meta: "заняття 5–9 · середній рівень"
      lessons:
        - "Заняття 5. Концепція Observability: ключові метрики та компоненти"
        - "Заняття 6. InfluxDB як metric storage та InfluxQL"
        - "Заняття 7. Prometheus як metric storage та PromQL"
        - "Заняття 8. Grafana як основний opensource visualization tool та інтеграція з Influx і Prometheus"
        - "Заняття 9. k6: відправка метрик з tags, groups та fields для Influx і Prometheus + load-профілі"
    - title: "Блок 4. Просунуте перформенс тестування та DevOps-інтеграція"
      meta: "заняття 10–15 · просунутий"
      lessons:
        - "Заняття 10. UI Performance Testing за допомогою k6 browser-тестів"
        - "Заняття 11. Побудова дашборду для порівняння результатів між запусками"
        - "Заняття 12. CI/CD інтеграція"
        - "Заняття 13. Запуск k6-тестів у Kubernetes з k6-operator"
        - "Заняття 14. AI-агент з Grafana MSP для аналізу результатів k6-тестів"
        - "Заняття 15. Chaos Testing разом з xk6-disruptor"

final_project:
  heading: "Фінальний проєкт"
  intro: "Студент проходить повний цикл перформенс тестування з реальним стеком і здає:"
  items:
    - "НФР та процес — документ з НФР для 3–5 сценаріїв + опис процесу перформенс тестування"
    - "Протокольні k6-тести — мінімум 3 сценарії з checks і thresholds (частково AI-генеровані)"
    - "Browser-тест(и) — k6 browser-тест з вимірюванням Web Vitals"
    - "Observability-стек — custom load-профіль, tags/groups, метрики в InfluxDB та Prometheus"
    - "Дашборди — стандартний + кастомний + порівняльний (run-to-run)"
    - "CI/CD пайплайн — k6-тести з thresholds як gate"
    - "Kubernetes-запуск — TestRun через k6-operator"
    - "AI-аналіз — звіт від AI-агента (Grafana MSP)"
    - "Chaos-експеримент — load-тест + xk6-disruptor, звіт про стійкість системи"

pricing:
  heading: "Чому саме 33 000 грн"
  price_note: "33 000 грн за весь курс"
  caption: "Це 15 занять по 2-3 години практики з ментором, перевірка ДЗ та зворотний зв'язок, плюс готовий стек технологій (k6, Grafana, Prometheus, k8s-маніфести)."
  career: "Навички курсу ведуть у напрямки, які в QA оплачуються найвище: Performance Engineer та SDET — серед позицій з найвищими зарплатами в тестуванні, що часто прирівнюються до Senior-розробника. За даними зимового зарплатного звіту DOU 2026, медіанна зарплата DevOps/SRE — $4200, QA Tech Lead — $4600. Курс готує саме до переходу в ці напрямки."
  source:
    text: "DOU, зарплатний звіт QA, зима 2026"
    url: "https://dou.ua/lenta/articles/salary-report-qa-winter-2026/"

instructor_section:
  heading: "Викладач"
  name: "Yehor Maksymchuk"
  role: "QA & Performance Architect, 14+ років в IT"
  photo: "/img/instructor-yehor.jpg"
  photo_alt: "Yehor Maksymchuk — QA & Performance Architect"
  bio:
    - "Веде перформенс-напрям як практик, а не теоретик. Зараз — Performance Test Engineer / QA-Performance & Automation Architect у US fintech (платіжний провайдер): будує перформенс-фреймворки, observability-стек (k6, JMeter, Gatling, Grafana, InfluxDB, Prometheus, sitespeed.io) і вбудовує навантажувальне тестування в CI/CD."
    - "За 14+ років пройшов шлях від QA-інженера до архітектора якості в EPAM, SoftServe та Zoolatech; координував QA в проєктах до 22 скрам-команд одночасно. Те, що ти вивчиш на курсі — це його щоденний робочий стек, а не навчальні приклади."
  chips:
    - "EPAM QA Architect"
    - "14+ років в IT"
    - "Azure AZ-900"
    - "k6 / JMeter / Gatling"
    - "Grafana / InfluxDB / Prometheus"
  links:
    - { label: "LinkedIn", url: "https://www.linkedin.com/in/yehor-maksymchuk-271039240/" }
    - { label: "GitHub", url: "https://github.com/YegorMaksymchuk" }
    - { label: "YouTube", url: "https://www.youtube.com/@AIDevTestOps" }

bottom_cta:
  text: "15 занять, практика на кожному занятті, фінальний проєкт з реальним стеком для перформенс тестування."
---
