---
title: "Agentic QA"
description: "A hands-on course on testing AI-agentic systems for QA, SDET, and Tech Lead engineers. 21 lessons from fundamentals to a production-ready CI/CD pipeline."
date: 2026-06-11
draft: false
layout: "landing"

# Course-list card
level: "Junior–Middle"
category: "AI testing"
instructor: "Yehor Maksymchuk"
duration: "11–14 weeks"
lessons: 21

# Links
registration_url: "https://forms.gle/Lz1ZfjUBWzrK8sQn7"
program_url: "/agentic-qa-program/"
doc_label: "Full course curriculum"

# Hero
eyebrow: "Course"
subtitle: "Learn to test AI agents, RAG systems, and agentic pipelines — from your first eval to production CI/CD."
cta_label: "Apply now →"
meta_pills:
  - "21 lessons"
  - "11–14 weeks"
  - "Junior–Middle"

audience:
  heading: "Who this course is for"
  cards:
    - role: "QA Engineer Middle+"
      jtbd: "My project moved to LLMs — I don't know how to test it properly."
    - role: "Automation QA / SDET"
      jtbd: "I want a concrete technical stack for testing AI, not just \"test it somehow\"."
    - role: "Tech Lead / QA Lead"
      jtbd: "I'm afraid of production incidents and don't know what to ask my team."

competencies:
  heading: "What you'll learn"
  items:
    - label: "Risk mapping"
      text: "Decompose an agentic system and build a risk map as the basis of your test strategy."
    - label: "Eval automation"
      text: "Write eval suites with DeepEval or Promptfoo instead of manual checks."
    - label: "RAG & dialog testing"
      text: "Measure RAG quality with RAGAS and catch context failures."
    - label: "LLM-as-a-Judge"
      text: "Implement and calibrate judge-based scoring and wire it into CI."
    - label: "Security & red teaming"
      text: "Run a red team session against the OWASP LLM Top 10."
    - label: "CI/CD quality gates"
      text: "Embed eval gates and agentic workflows into a GitHub Actions pipeline."

curriculum:
  heading: "Course curriculum"
  blocks:
    - title: "Block 1. Foundations"
      meta: "lessons 1–2 · basic level"
      open: true
      lessons:
        - "Lesson 1. AI systems as a test object: why everything is different"
        - "Lesson 2. The architecture of agentic systems through a QA lens"
    - title: "Block 2. LLM Testing"
      meta: "lessons 3–9 · intermediate level"
      lessons:
        - "Lesson 3. Prompt and context engineering for QA"
        - "Lesson 4. Metrics in AI testing"
        - "Lesson 5. Prompt testing: from manual checks to automation"
        - "Lesson 6. RAG testing: hallucination, faithfulness, relevancy"
        - "Lesson 7. Testing multi-step dialogs and context management"
        - "Lesson 8. Testing different models and GitHub Models"
        - "Lesson 9. Local models for testing: Ollama and Lemonade AI Runtime"
    - title: "Block 3. Agentic Testing"
      meta: "lessons 10–14 · intermediate level"
      lessons:
        - "Lesson 10. LLM as a Judge: implementation and pitfalls"
        - "Lesson 11. Security testing: Prompt Injection and Red Teaming"
        - "Lesson 12. Tool call testing and MCP"
        - "Lesson 13. Observability and cost testing"
        - "Lesson 14. AI-assisted Test Case Generation and Code Review"
    - title: "Block 4. Automation and frameworks"
      meta: "lessons 15–16 · advanced"
      lessons:
        - "Lesson 15. Building a framework for automated AI testing"
        - "Lesson 16. Eval pipeline in CI/CD: Quality Gates with DeepEval and LLM-as-a-Judge"
    - title: "Block 5. System level and Agentic CI/CD"
      meta: "lessons 17–18 · advanced"
      lessons:
        - "Lesson 17. Agentic CI/CD: AI agents as part of the development pipeline"
        - "Lesson 18. Documentation and Test Generation as part of the agentic workflow"
    - title: "Block 6. Final project"
      meta: "lessons 19–21 · synthesis"
      lessons:
        - "Lesson 19. Final project prep: consultations and peer review"
        - "Lesson 20–21. Defense: a live CI/CD pipeline demo + Q&A from the group"

final_project:
  heading: "Final project: AI-Powered Application — the full cycle"
  intro: "Each student builds an AI app on their own and submits:"
  items:
    - "An AI app (300–800 lines, built with Claude Code or Copilot)"
    - "A test strategy (2–4 pages, go/no-go criteria)"
    - "A risk-based test coverage matrix"
    - "Tests at every level: eval · RAG · LLM-judge · security · E2E"
    - "An AI test framework with LLM-as-a-Judge and a report"
    - "A CI/CD pipeline: quality gates + AI code review + automatic release"
    - "Documentation: README + notes on where the AI assistant helped and where it got in the way"

bottom_cta:
  text: "Leave your contact — I'll share the details on start date, format, and price."
---
