# QA Study Online - Hugo Website

A bilingual (Ukrainian / English) static site for QA education platform built with Hugo Extended.

## 🚀 Quick Start

### Prerequisites

**Hugo Extended** is required (for SASS compilation):

```bash
brew install hugo
hugo version   # should show "extended"
```

### Local Development

```bash
# Start development server with live reload
hugo server --navigateToChanged

# Open in browser: http://localhost:1313
```

### Production Build

```bash
hugo --minify
# Output is in ./public/
```

## 📝 Adding New Content

### Adding a Course

Create a markdown file in both language directories:

```bash
touch content/uk/courses/my-new-course.md
touch content/en/courses/my-new-course.md
```

Course frontmatter schema (see [CLAUDE.md](CLAUDE.md) for full reference):

```yaml
---
title: ""
description: ""
price: 0.00
original_price: 0.00   # optional
instructor: ""
rating: 4.8
students: 0
duration: ""
lessons: 0
level: "Початківець"   # uk: Початківець | Середній | Просунутий
category: ""
features: []
requirements: []
curriculum:
  - title: ""
    lessons:
      - title: ""
        duration: ""
---
```

### Adding a Page

```bash
touch content/uk/my-page.md
touch content/en/my-page.md
```

Add front matter and content. The page will be available at `/my-page/` (uk) and `/en/my-page/` (en).

## 📁 Project Structure

```
qastudy.online/
├── hugo.toml                    # Site config (languages, menus, params)
├── content/
│   ├── uk/                      # Ukrainian content (primary, served at /)
│   │   ├── _index.md            # Homepage
│   │   ├── about.md
│   │   └── courses/
│   │       └── *.md             # Course pages
│   └── en/                      # English content (served at /en/)
│       └── ...
├── layouts/
│   ├── _default/
│   │   ├── baseof.html          # Base HTML shell
│   │   ├── list.html            # Courses list
│   │   └── single.html          # Generic single page
│   ├── courses/
│   │   └── single.html          # Course detail page
│   ├── index.html               # Homepage
│   └── partials/                # Navbar, hero, footer, language-switcher
├── assets/
│   └── sass/                    # SASS compiled via Hugo Pipes (no build step)
├── i18n/
│   ├── uk.yaml                  # Ukrainian UI strings
│   └── en.yaml                  # English UI strings
└── static/
    └── CNAME                    # Custom domain: qastudy.online
```

## 🛠️ Development Workflow

1. Edit content in `content/uk/` or `content/en/`
2. Edit templates in `layouts/`
3. Edit styles in `assets/sass/` — Hugo Pipes compiles SASS automatically
4. Browser auto-reloads via `hugo server --navigateToChanged`

### Troubleshooting

**Hugo not found / wrong version:**
```bash
brew install hugo
hugo version   # must show "extended"
```

**Styles not updating:**
```bash
hugo server --disableFastRender
```

**Build errors:**
```bash
hugo --verbose
```

## 🚀 Deployment

Deployed automatically via GitHub Actions on push to `main`. The workflow runs `hugo --minify` and publishes `./public/` to GitHub Pages. Custom domain is set via `static/CNAME`.

## 🌐 Languages

| Language | URL | Content directory |
|---|---|---|
| Ukrainian (default) | `https://qastudy.online/` | `content/uk/` |
| English | `https://qastudy.online/en/` | `content/en/` |

UI strings are in `i18n/uk.yaml` and `i18n/en.yaml`, referenced in templates with `{{ i18n "key" }}`.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run `hugo server` to verify locally
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.
