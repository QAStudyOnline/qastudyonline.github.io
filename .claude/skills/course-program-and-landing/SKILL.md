---
name: course-program-and-landing
description: Use this skill when the user wants to design, extend, or restructure an educational course curriculum (lecture plans, modules, blocks, homework, learning outcomes) and/or turn that curriculum into a landing page description, registration form, or marketing copy. Triggers include requests to "create a course program", "розробити программу курсу", "додати заняття", "перебудувати програму", "зроби лендінг для курсу", "опис курсу для сайту", "registration form for a course", or any iterative work on a curriculum document followed by a request to publish/promote it. Also use when asked to generate a SKILL.md, Google Doc, Google Form, or Hugo/static-site landing instructions derived from a course curriculum.
---

# Course Program and Landing Page Creation

A skill for two connected workflows: (1) building and iterating on an educational
course curriculum, and (2) turning a finished or in-progress curriculum into
external-facing artifacts — landing page copy, registration forms, and
implementation instructions for a developer or code agent.

These two workflows are usually sequential within one conversation: the
curriculum gets refined over several turns (add a module, split a session,
reorder by difficulty), and only at the end does the user ask for the
landing/registration layer. Treat the curriculum document as the single
source of truth — every later artifact (landing copy, form fields, lecture
plan) must derive from it, not duplicate or drift from it.

## Part 1 — Building the course curriculum

### Structure of a lecture/session entry

Every session in the curriculum follows this fixed template — do not drop
any section even for "small" additions:

```
Заняття N. <Title>

<2-5 sentences of topic content — what concepts, tools, or techniques
are covered. Dense, specific, name real tools/frameworks/APIs.>

Практика на занятті: <one concrete in-class exercise — what the student
receives, what the task is, what "done" looks like.>

ДЗ: <homework — a specific deliverable with a clear "Здати:" (submit) line
listing exact artifacts: code, report, table, screenshots, etc.>

Результат після заняття: <one sentence — the competency gained, phrased
as "Студент вміє..." / "Студент розуміє...">
```

When the user asks to add a new topic, write a full entry in this template —
never just a title or bullet list. When the user asks to split one session
into two, redistribute content so each half is still a complete, standalone
entry with its own practice/ДЗ/result — don't leave one half thin.

### Organizing into blocks

Group sessions into numbered blocks (БЛОК 1, БЛОК 2, ...) by **difficulty
and prerequisite**, not by chronology of when the user requested them.
When the user asks for a "final sort from basic to advanced":

1. Identify the technical prerequisite for each session (none / basic
   scripting / API + automation experience / CI-CD + DevOps basics)
2. Group sessions sharing a prerequisite level into one block
3. Order blocks so each one's prerequisites are satisfied by the previous
   block's outcomes
4. Renumber all "Заняття N" sequentially across the whole document —
   this is easy to get wrong when sessions were added out of order during
   the conversation; re-derive the full numbering from scratch rather than
   patching old numbers
5. Add a one-line block header noting session range and level, e.g.
   `(Заняття 4–9 — середній рівень, потрібен базовий Python або TypeScript)`

### Final project

If the curriculum includes a capstone/final project, keep it as a separate
section after the last block, structured as:

- One-paragraph framing of the goal (what it proves, not just what's built)
- A numbered list of required deliverables, each with a one-line description
  of format/scope (page count, line count, minimum test counts, etc.)
- For deliverables that are tables (e.g. test coverage matrix, test level
  breakdown), render as an actual markdown table with example rows
- Defense/presentation format if applicable (duration split, question focus)

### Target audience segments

If the curriculum targets multiple personas (e.g. junior vs lead), keep a
dedicated section with one block per segment containing: profile (years of
experience, current tools, current pain), what they'll learn, what they'll
be able to do after (bulleted, action-verb-first), and a JTBD quote in their
own voice ("Я не розумію як...", "Хочу конкретний...").

### Output format for the curriculum

When the curriculum is finalized or substantially revised, offer to put it
in a Google Doc via `Google Drive:create_file` (mimeType
`application/vnd.google-apps.document`, plain-text content with simple
visual separators — heavy unicode box-drawing lines like `━━━` work well
for block separators since Google Docs renders plain text directly).
Always return the resulting `https://docs.google.com/document/d/<id>/edit`
link to the user.

## Part 2 — Landing page and registration form

### Registration form (Google Forms)

Google Forms cannot be created programmatically via available tools. Do not
attempt `Google Drive:create_file` with a form mimetype. Instead:

1. Use the Visualizer (`visualize:show_widget`, `mockup` module) to render
   a realistic preview of the form — actual field labels, types, helper
   text, in the visual style the user would want
2. Below the preview, give a numbered "how to build this in Google Forms"
   checklist: field name, field type (Short answer / Paragraph / Multiple
   choice / etc.), required vs optional, any validators (e.g. Email format),
   and helper text to add as the field description
3. If the user provides a theme color or the course has an established
   palette, state the hex value to set as the Forms theme color

Standard fields for a "leave your contact" course-interest form, in order:

- Ім'я (Short answer, required)
- Email (Short answer, required, Email response-validation)
- Telegram або WhatsApp (Short answer, optional, helper text explaining
  @username vs phone number format)
- Хто ти зараз? (Multiple choice + "Other", required) — populate options
  from the curriculum's target-audience segments
- Що хочеш отримати від курсу? (Paragraph, optional)

### Validating an existing form

If the user shares a `forms.gle` link and asks for validation, attempt to
open it with `Claude in Chrome`. If the browser tool is unavailable, ask the
user for a screenshot instead — do not block on the browser. When reviewing
a screenshot or live form, check specifically for:

- Duplicate required-marker asterisks in field labels (a common Google Forms
  copy-paste artifact — `Ім'я * *` should be `Ім'я *`)
- Field order — name before email is more natural than email-first
- Missing response validation on Email fields
- Missing helper/description text on ambiguous fields (e.g. contact fields
  that accept multiple formats)
- Whether all fields planned in the design actually made it into the form

Report findings as a short prioritized list (🔴 must-fix vs 🟡 nice-to-have),
not as flowing prose — these are discrete actionable bugs.

### Landing page instructions for a code agent

When the user wants the curriculum turned into a landing page on an existing
site (Hugo, or similar static-site generators), produce a single markdown
file intended to be handed to Claude Code or another coding agent — not a
landing page built directly in this conversation, unless the user explicitly
asks for that instead.

The instruction file must:

1. **Start with exploration**, not file creation — tell the agent to inspect
   the existing repo structure (config, content layout, theme, CSS approach)
   before writing anything, so generated files match existing conventions
   instead of assuming a structure
2. **Map every curriculum section to a page section** with an explicit
   content spec:
   - Hero: course title, one-sentence value prop, primary CTA button linking
     to the registration form (new tab), key meta (session count, duration,
     level)
   - Audience section: one card per target-audience segment from Part 1,
     using their JTBD line as the hook
   - "What you'll learn": condense the curriculum into 5-7 headline
     competencies, not a re-listing of every session
   - Full curriculum: collapsible accordion, one block per curriculum block,
     first block open by default, rest collapsed — provide the exact text
     for every block and session title
   - Final project: checklist-style rendering of deliverables
   - Closing CTA: repeat the registration link with supporting copy, plus a
     link to the full curriculum doc
3. **Specify the registration URL as a templated/front-matter variable**,
   never hardcoded inline in the template body, so it can be updated without
   touching markup
4. **Include concrete CSS** for the CTA button, accordion (`<details>`/
   `<summary>`, no JS framework required), and responsive card grid — but
   frame these as defaults to use only if the site has no equivalent
   existing pattern; tell the agent to check `tailwind.config.js` /
   `_variables.scss` first and prefer existing tokens
5. **End with a verification checklist** (`hugo server -D`, mobile width
   check, link check, build with `--minify`) and an explicit "do NOT" list
   covering the most likely ways a code agent over-edits a shared theme
   (modifying `baseof.html` globally, adding jQuery, hardcoding URLs,
   replacing the theme)

Deliver this as a single `.md` file via `create_file` to
`/mnt/user-data/outputs/`, then `present_files`. Do not create the actual
Hugo files yourself unless the user has an actual repo open in this
environment and asks for direct implementation.

## Cross-cutting notes

- Keep all curriculum and landing copy in the same language the user has
  been using for the curriculum (this skill was developed against a
  Ukrainian-language course, but applies the same structure regardless of
  language)
- When the user asks for incremental changes ("split session 11 into two",
  "renumber", "add a session about X between Y and Z"), make the edit and
  then re-output the **full** updated document or the **full** affected
  block — don't make the user manually stitch together fragments across
  multiple responses
- Don't invent tool names, pricing, or external product details for the
  curriculum content — if the user's domain (e.g. AI testing tools) has
  fast-moving specifics, use what's in the conversation/uploaded references
  rather than guessing
