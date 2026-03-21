# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

QAStudy.online is a Hugo static site for QA testing courses. Ukrainian is the primary language (default, no URL prefix). English is secondary (`/en/`). Deployed to GitHub Pages via GitHub Actions.

**Hugo Extended is required** (for SASS compilation). Install: `brew install hugo`

## Common Commands

```bash
# Development server (http://localhost:1313)
hugo server --navigateToChanged

# Production build
hugo --minify

# Verify build output
ls public/
```

## Architecture

### Languages
- `defaultContentLanguage = "uk"` — Ukrainian at `/`, English at `/en/`
- `content/uk/` — Ukrainian content (primary)
- `content/en/` — English content
- `i18n/uk.yaml` and `i18n/en.yaml` — UI strings, referenced in templates with `{{ i18n "key" }}`

### Content Structure
- `content/{lang}/courses/*.md` — Course pages (8 courses per language)
- `content/{lang}/_index.md` — Homepage content including hero config in frontmatter
- `content/{lang}/about.md` — About page

### Layouts
- `layouts/_default/baseof.html` — Base HTML shell (SASS/JS via Hugo Pipes, hreflang)
- `layouts/index.html` — Home page (`{{ partial "hero.html" . }}` + content)
- `layouts/courses/single.html` — Course detail page
- `layouts/_default/list.html` — Courses list page
- `layouts/partials/` — navbar, hero, footer, language-switcher

### Styling
Hugo Pipes compiles `assets/sass/main.scss` → minified + fingerprinted CSS automatically on `hugo server` or `hugo build`. No separate build step needed.
- `assets/sass/design-system/` — Variables, base, typography, buttons, cards, forms, utilities
- `assets/sass/components/` — Navbar, hero, footer, course-grid
- Course-page-specific styles are in `assets/sass/main.scss` directly

### Configuration
- `hugo.toml` — Site-wide config: bilingual setup, menus, social params
- Navigation menus are defined in `hugo.toml` under `[[languages.uk.menus.main]]` / `[[languages.en.menus.main]]`
- Footer links are hardcoded in `layouts/partials/footer.html` using i18n keys

### Deployment
GitHub Actions (`.github/workflows/hugo.yml`) triggers on push to `main`, runs `hugo --minify`, uploads `./public/` to GitHub Pages.
`static/CNAME` sets the custom domain to `qastudy.online`.

## Course Frontmatter Schema

```yaml
title: ""
description: ""
price: 0.00
original_price: 0.00   # optional
instructor: ""
rating: 4.8
students: 0
duration: ""
lessons: 0
level: "Початківець | Середній | Просунутий"   # uk
       "Beginner | Intermediate | Advanced"      # en
category: ""
tools: []              # optional
features: []
requirements: []
curriculum:
  - title: ""
    lessons:
      - title: ""
        duration: ""
testimonials:          # optional
  - name: ""
    title: ""
    rating: "★★★★★"
    text: ""
youtube_url: ""        # optional
github_url: ""         # optional
```
