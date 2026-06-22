# Руководство по управлению контентом сайта

Сайт работает на **Hugo** — статическом генераторе сайтов. Всё содержимое хранится в виде обычных текстовых файлов (`.md`) с метаданными в шапке (frontmatter). Никакой базы данных нет.

---

## Структура языков

| URL | Папка | Язык |
|-----|-------|------|
| `qastudy.online/` | `content/uk/` | Украинский (основной) |
| `qastudy.online/en/` | `content/en/` | Английский |

Каждая страница создаётся **дважды**: один файл в `content/uk/`, второй — в `content/en/`.

---

## Часть 1 — Редактирование существующих страниц

### Главная страница

**Файлы:**
- `content/uk/_index.md` — украинская версия
- `content/en/_index.md` — английская версия

Файл состоит из двух частей:

```
---
[frontmatter — данные для hero-секции]
---

[HTML-контент — секции страницы]
```

**Изменить hero-секцию** (заголовок, описание, кнопки):

```yaml
---
title: "Опануйте Навички QA Тестування"
description: "..."

hero:
  title: "Опануйте Навички QA Тестування"   # ← большой заголовок
  description: "Вивчайте..."                  # ← подзаголовок
  primary_cta:
    text: "Почати Навчання"                   # ← текст кнопки 1
    url: "/courses/"                          # ← ссылка кнопки 1
  secondary_cta:
    text: "Переглянути Курси"                 # ← текст кнопки 2
    url: "/courses/"
---
```

**Изменить секции под hero** (карточки навыков, featured курсы, "Почему мы"):
Всё это — обычный HTML внутри файла после `---`. Редактируется напрямую.

---

### Страница «Про нас»

**Файлы:**
- `content/uk/about.md`
- `content/en/about.md`

Обычный Markdown. Редактируйте текст под шапкой `---`:

```markdown
---
title: "Про нас"
description: "..."
---

## Наша місія

Обычный текст, **жирный**, *курсив*, [ссылки](https://...).

## Новый раздел

Добавьте любой текст здесь.
```

---

### Страницы курсов

**Файлы:**
- `content/uk/courses/<slug>.md` — украинская версия
- `content/en/courses/<slug>.md` — английская версия

Каждый курс управляется frontmatter-полями:

```yaml
---
title: "Повний Буткемп з Ручного Тестування"
description: "Короткое описание для SEO и карточки"
price: 49.99
original_price: 79.99        # зачёркнутая цена (необязательно)
instructor: "Сара Джонсон"
rating: 4.8
students: 2845
duration: "8 годин"
lessons: 42
level: "Початківець"         # Початківець / Середній / Просунутий

# Кнопки действий (необязательно — если нет, секция скрывается)
youtube_url: "https://youtube.com/watch?v=..."
github_url: "https://github.com/..."
udemy_url: "https://udemy.com/course/..."

# Секция "Что вы изучите"
features:
  - "Пункт 1"
  - "Пункт 2"

# Требования
requirements:
  - "Требование 1"

# Программа курса
curriculum:
  - title: "Назва модуля"
    lessons:
      - title: "Назва уроку"
        duration: "12:30"

# Инструменты (необязательно)
tools:
  - "Postman"
  - "Jira"

# Отзывы (необязательно)
testimonials:
  - name: "Ім'я"
    title: "Посада"
    rating: "★★★★★"
    text: "Текст відгуку"
---

Markdown-текст под программой курса (описание, карьерные возможности и т.д.)
```

**Добавить новый курс:**

```bash
# Создать файлы
touch content/uk/courses/новый-курс.md
touch content/en/courses/new-course.md
```

Заполните по образцу любого существующего курса.

URL будет: `qastudy.online/courses/новый-курс/`

---

### UI-строки (кнопки, подписи, навигация)

Переводимые строки интерфейса хранятся отдельно от контента:

- `i18n/uk.yaml` — украинские строки
- `i18n/en.yaml` — английские строки

Пример: чтобы изменить текст кнопки «Записатися Зараз» в карточках курсов:

```yaml
# i18n/uk.yaml
courses_enroll_now: "Записатися Зараз"   # ← изменить здесь
```

---

### Навигационное меню

Пункты главного меню настраиваются в `hugo.toml`:

```toml
# Украинское меню
[[languages.uk.menus.main]]
  name   = "Курси"
  url    = "/courses/"
  weight = 10          # порядок (меньше = левее)

[[languages.uk.menus.main]]
  name   = "Блог"
  url    = "/blog/"
  weight = 15

[[languages.uk.menus.main]]
  name   = "Про нас"
  url    = "/about/"
  weight = 20

# Английское меню
[[languages.en.menus.main]]
  name   = "Courses"
  url    = "/en/courses/"
  weight = 10

[[languages.en.menus.main]]
  name   = "Blog"
  url    = "/en/blog/"
  weight = 15
```

---

## Часть 2 — Добавление новых разделов

### Статическая страница (пример: /offerta)

**Шаг 1.** Создать два файла:

```
content/uk/offerta.md
content/en/offerta.md
```

**Шаг 2.** Заполнить содержимое:

```markdown
---
title: "Публічна оферта"
description: "Умови надання освітніх послуг QAStudy.online"
---

## 1. Загальні положення

Текст оферты...

## 2. Предмет договору

...
```

Готово. Страница будет доступна по адресу:
- `qastudy.online/offerta/` — украинская
- `qastudy.online/en/offerta/` — английская

Никаких изменений в шаблонах не нужно — Hugo автоматически применит `layouts/_default/single.html`.

**Необязательно:** добавить в футер. Откройте `layouts/partials/footer.html` и добавьте ссылку в нужную секцию:

```html
<li><a href="{{ "/offerta/" | relLangURL }}">{{ i18n "footer_offerta" }}</a></li>
```

Затем добавьте строку в оба i18n-файла:

```yaml
# i18n/uk.yaml
footer_offerta: "Публічна оферта"

# i18n/en.yaml
footer_offerta: "Terms of Offer"
```

---

### Блог, привязанный к темам курсов

Блог в Hugo — это встроенный тип контента (`posts`). Статьи будут связываться с курсами через **таксономию `topics`**.

#### Шаг 1. Включить таксономию в `hugo.toml`

Откройте `hugo.toml` и найдите блок `[taxonomies]`, добавьте `topic`:

```toml
[taxonomies]
  level  = "levels"
  category = "categories"
  topic  = "topics"        # ← добавить эту строку
```

#### Шаг 2. Создать папки для блога

```
content/uk/blog/
content/en/blog/
```

#### Шаг 3. Создать страницу-список блога

```
content/uk/blog/_index.md
content/en/blog/_index.md
```

```markdown
---
title: "Блог"
description: "Статті про QA тестування, автоматизацію та кар'єру"
---
```

#### Шаг 4. Написать статью

Файл: `content/uk/blog/what-is-regression-testing.md`

```markdown
---
title: "Що таке регресійне тестування і навіщо воно потрібне"
date: 2026-03-21
description: "Пояснюємо регресійне тестування на реальних прикладах"
author: "Команда QAStudy"

# Привязка к темам/курсам — перечислить slugи курсов
topics:
  - "manual-testing-bootcamp"
  - "manual-qa"

# Категория статьи
categories:
  - "ручне-тестування"

# SEO
draft: false
---

## Вступ

Текст статьи в обычном Markdown...

## Що таке регресійне тестування?

...
```

URL статьи: `qastudy.online/blog/what-is-regression-testing/`
Страница темы: `qastudy.online/topics/manual-testing-bootcamp/` — покажет все статьи, привязанные к этому курсу.

#### Шаг 5. Создать шаблоны блога

**`layouts/blog/single.html`** — страница одной статьи:

```html
{{ define "main" }}
<article class="py-16">
  <div class="container" style="max-width: 800px; margin: 0 auto;">

    <header style="margin-bottom: 2rem;">
      <h1>{{ .Title }}</h1>
      <div style="color: #6b7280; font-size: 0.875rem; margin-top: 0.5rem;">
        {{ .Date.Format "02.01.2006" }}
        {{ with .Params.author }} · {{ . }}{{ end }}
      </div>

      {{ with .Params.topics }}
      <div style="margin-top: 1rem; display: flex; flex-wrap: wrap; gap: 0.5rem;">
        {{ range . }}
        <a href="{{ "/topics/" | relLangURL }}{{ . }}/"
           style="padding: 0.25rem 0.75rem; background: #ede9fe; color: #6d28d9;
                  border-radius: 9999px; font-size: 0.75rem; text-decoration: none;">
          {{ . }}
        </a>
        {{ end }}
      </div>
      {{ end }}
    </header>

    <div class="prose">
      {{ .Content }}
    </div>

    {{ with .Params.topics }}
    <div style="margin-top: 3rem; padding: 1.5rem; background: #f3f4f6; border-radius: 0.75rem;">
      <h3 style="margin-top: 0;">Пов'язані курси</h3>
      {{ range . }}
        {{ $course := $.Site.GetPage (printf "/courses/%s" .) }}
        {{ if $course }}
        <a href="{{ $course.RelPermalink }}"
           style="display: block; padding: 0.5rem 0; color: #7c3aed; font-weight: 500;">
          → {{ $course.Title }}
        </a>
        {{ end }}
      {{ end }}
    </div>
    {{ end }}

  </div>
</article>
{{ end }}
```

**`layouts/blog/list.html`** — список всех статей блога:

```html
{{ define "main" }}
<section class="py-16">
  <div class="container">
    <div class="text-center mb-16">
      <h1>{{ .Title }}</h1>
      {{ with .Description }}<p class="text-large text-gray-600">{{ . }}</p>{{ end }}
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      {{ range .Pages }}
      <article class="card">
        <div class="card-body">
          {{ with .Params.topics }}
          <div style="display: flex; flex-wrap: wrap; gap: 0.25rem; margin-bottom: 0.75rem;">
            {{ range . }}
            <span style="padding: 0.125rem 0.5rem; background: #ede9fe; color: #6d28d9;
                         border-radius: 9999px; font-size: 0.7rem;">{{ . }}</span>
            {{ end }}
          </div>
          {{ end }}

          <h2 class="h4" style="margin-top: 0;">
            <a href="{{ .RelPermalink }}" style="color: inherit; text-decoration: none;">
              {{ .Title }}
            </a>
          </h2>
          <p style="color: #6b7280; font-size: 0.875rem;">{{ .Description }}</p>
          <div style="color: #9ca3af; font-size: 0.75rem; margin-top: 1rem;">
            {{ .Date.Format "02.01.2006" }}
          </div>
        </div>
      </article>
      {{ end }}
    </div>
  </div>
</section>
{{ end }}
```

**`layouts/topics/list.html`** — страница темы (все статьи по курсу):

```html
{{ define "main" }}
<section class="py-16">
  <div class="container">
    <div class="text-center mb-12">
      <h1>Статті по темі: {{ .Title }}</h1>
    </div>

    {{ $course := .Site.GetPage (printf "/courses/%s" .Title) }}
    {{ if $course }}
    <div style="background: #ede9fe; border-radius: 0.75rem; padding: 1.25rem 1.5rem; margin-bottom: 2rem;">
      Пов'язаний курс:
      <a href="{{ $course.RelPermalink }}" style="color: #6d28d9; font-weight: 600;">
        {{ $course.Title }} →
      </a>
    </div>
    {{ end }}

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      {{ range .Pages }}
      <article class="card">
        <div class="card-body">
          <h2 class="h4" style="margin-top: 0;">
            <a href="{{ .RelPermalink }}" style="color: inherit; text-decoration: none;">
              {{ .Title }}
            </a>
          </h2>
          <p style="color: #6b7280; font-size: 0.875rem;">{{ .Description }}</p>
        </div>
      </article>
      {{ end }}
    </div>
  </div>
</section>
{{ end }}
```

#### Шаг 6. Добавить «Блог» в меню навигации

В `hugo.toml`:

```toml
[[languages.uk.menus.main]]
  name   = "Блог"
  url    = "/blog/"
  weight = 15

[[languages.en.menus.main]]
  name   = "Blog"
  url    = "/en/blog/"
  weight = 15
```

#### Итоговая структура URL блога

| URL | Содержимое |
|-----|-----------|
| `/blog/` | Список всех статей |
| `/blog/название-статьи/` | Одна статья |
| `/topics/` | Список всех тем |
| `/topics/manual-testing-bootcamp/` | Все статьи по курсу «Manual Testing Bootcamp» |
| `/topics/api-automation/` | Все статьи по курсу «API Automation» |

---

## Часть 3 — Структура файлов: быстрая справка

```
content/
├── uk/                          ← украинский контент
│   ├── _index.md                ← главная страница (hero + секции)
│   ├── about.md                 ← страница «Про нас»
│   ├── offerta.md               ← новая страница оферты
│   ├── courses/
│   │   ├── _index.md            ← список курсов (заголовок)
│   │   ├── manual-qa.md         ← страница курса
│   │   └── ...
│   └── blog/
│       ├── _index.md            ← список статей блога
│       └── назва-статті.md      ← одна статья
└── en/                          ← английский контент (зеркало)
    └── ...

hugo.toml                        ← меню, языки, параметры
i18n/uk.yaml                     ← украинские UI-строки
i18n/en.yaml                     ← английские UI-строки
layouts/partials/footer.html     ← ссылки в футере
```

---

## Часть 4 — Рабочий процесс

```bash
# 1. Запустить локальный сервер (обновляется при каждом сохранении)
hugo server --navigateToChanged

# 2. Редактировать файлы в content/ — браузер обновляется автоматически

# 3. Проверить финальную сборку без ошибок
hugo --minify

# 4. Сохранить в git и задеплоить
git add .
git commit -m "Add blog section and offerta page"
git push origin main
# GitHub Actions автоматически задеплоит на qastudy.online
```

---

## Часть 5 — Частые операции

### Изменить цену курса
Откройте `content/uk/courses/назва-курсу.md`, найдите `price:` в frontmatter:
```yaml
price: 49.99
original_price: 79.99   # убрать строку, если нет скидки
```

### Изменить ссылку на YouTube/Udemy в курсе
```yaml
youtube_url: "https://youtube.com/watch?v=НОВЫЙ_ID"
udemy_url: "https://udemy.com/course/назва/"
```

### Добавить отзыв к курсу
```yaml
testimonials:
  - name: "Ім'я Прізвище"
    title: "Посада, компанія"
    rating: "★★★★★"
    text: "Текст відгуку..."
```

### Скрыть курс из списка, не удаляя файл
```yaml
draft: true
```

### Изменить SEO-описание страницы
```yaml
description: "Новый текст для мета-тега description (до 160 символов)"
```
