---
title: "Agentic QA Course Program"
description: "The full Agentic QA course program: 21 lessons, 6 blocks, a final project, and the target-audience profile."
layout: "program"
registration_url: "https://forms.gle/Lz1ZfjUBWzrK8sQn7"
cta_label: "Apply now →"
course_url: "/courses/agentic-qa/"
back_label: "← back to course"
---

## Course Overview

- **Target audience:** Junior and Middle AI / Dev / Test / Ops engineers
- **Total lessons:** 21
- **Estimated duration:** 11–14 weeks

---

## Block 1. Foundations

*(Lessons 1–2 — basic level, no technical prerequisites)*

### Lesson 1. AI systems as a test object: why everything is different

Understanding how LLM testing differs from traditional deterministic software. Covers the system types encountered in projects: chatbots, RAG systems, agents, and pipelines. Explores failure modes through a practical taxonomy rather than ML theory. Examines how the classical testing pyramid transforms for AI applications, with evaluation testing emerging as a new layer between integration and E2E testing.

**In-class practice:** Students receive a demo chatbot and 10 varied prompts, tasked with classifying failures according to the taxonomy and documenting them as a "structured bug report for an LLM system."

**Homework:** Locate 5 genuine failures in any public AI product and document them with categorization: failure type → input → actual output → expected output → severity.

**Outcome:** Students understand AI-system testing specifics, can document failures in a structured format, and recognize how traditional testing pyramids evolve in AI contexts.

---

### Lesson 2. The architecture of agentic systems through a QA lens

Focuses on failure points rather than agent construction. Examines components: the LLM core, system prompt, tools, memory, orchestration, context window. Explains what occurs during tool calls and identifies risk layers. Demonstrates converting architectural diagrams into test strategies.

**In-class practice:** Students receive a real agentic-system schema (a RAG agent with dual tool calls) and create a risk map, identifying risk types and at least one test idea per component.

**Homework:** Draw an architecture diagram of an AI system from the student's project or invention. Provide at least 2 test ideas per component. Submit: diagram + risk table.

**Outcome:** Students decompose agentic systems into components and build risk maps as the foundation for a test strategy.

---

## Block 2. LLM Testing

*(Lessons 3–9 — intermediate level, basic Python or TypeScript required)*

### Lesson 3. Prompt and context engineering for QA

Why QA engineers must understand prompt engineering — not for writing prompts, but for testing them. Anatomy of a system prompt: instructions, persona, constraints, examples, output format. Prompt types: zero-shot, few-shot, chain-of-thought, ReAct, self-consistency — each fails differently. Engineering techniques: role prompting, step-by-step decomposition, output-format specification, negative prompting. The context window as a resource and how its size affects agent behavior. Context injection and the impact of external data on model responses.

**In-class practice:** Students receive prompts of various types for one task. They run each against prepared input data, compare results, and identify where each technique breaks down uniquely.

**Homework:** Audit a real or invented system prompt: find 3+ problem areas (ambiguities, conflicts, instruction gaps). Rebuild it using at least two prompt techniques. Submit: original + annotated audit + improved version with explanations.

**Outcome:** Students understand prompt types and techniques, recognize their impact on model behavior, and can conduct a structured system-prompt QA audit.

---

### Lesson 4. Metrics in AI testing

Why pass/fail fails for LLM systems. Reviews key metrics: faithfulness, answer relevancy, context recall, hallucination rate, groundedness. Distinguishes quantitative versus qualitative metrics and when to use each. Metric selection tailored to system type: chatbots, RAG, agents, pipelines. Baseline metrics and what constitutes a "good" result. How metrics shift with model, prompt, or data changes.

**In-class practice:** Students interpret eval-run results with multiple metrics, identify system weaknesses, and formulate specific hypotheses about metric performance.

**Homework:** Select an AI system and create a table: relevant metrics → justification → threshold values for an acceptable result. Submit: metrics table + rationale.

**Outcome:** Students can select appropriate metrics for different AI systems and understand what they measure and their limitations.

---

### Lesson 5. Prompt testing: from manual checks to automation

Why manual prompt verification doesn't scale. Golden-dataset construction: sources, size, case balance. DeepEval and Promptfoo selection criteria. Writing assertions for non-deterministic responses. Prompt versioning as an engineering practice — why a prompt change constitutes a release. Regression testing for comparing version A versus B on identical datasets.

**In-class practice:** Students run a prepared eval-suite with 5 tests in DeepEval, analyze which tests fluctuate, and refine assertions to prevent false positives.

**Homework:** Take a real or invented prompt. Write a golden dataset with 10 input/expected-output examples. Create and run an eval-suite. Submit: code + results + a brief analysis of findings.

**Outcome:** Students build golden datasets and run eval-suites through DeepEval or Promptfoo instead of manual checking.

---

### Lesson 6. RAG testing: hallucination, faithfulness, relevancy

Where RAG-pipeline problems emerge: retrieval, augmentation, generation. RAGAS metrics: faithfulness, answer relevancy, context recall. An introduction to the LLM-as-judge pattern — when and how to use it. Distinguishing hallucination from incomplete context. A real production hallucination case study.

**In-class practice:** Students deploy a demo RAG system and run a RAGAS evaluation on prepared questions, analyzing low faithfulness scores and instances of fabrication.

**Homework:** Build a minimal RAG eval: any documentation → demo RAG → 10 questions with known answers → RAGAS. Submit: metrics + a conclusion on weaknesses + one concrete improvement recommendation.

**Outcome:** Students understand RAG-specific testing and can measure answer quality through RAGAS metrics.

---

### Lesson 7. Testing multi-step dialogs and context management

Where agents lose context and why. Context-failure patterns: contradictions between steps, forgotten important data, degradation over a long dialogue. Programmatic multi-step scenario simulation. Context-window limits as a source of bugs.

**In-class practice:** Students run a support agent through an 8-step scenario, finding at least 2 places where context is lost or contradictions appear, and write test cases for the discovered issues.

**Homework:** Write a full test plan for a multi-step scenario: 3 happy paths, 3 edge cases with context failures, 2 adversarial scenarios. For each: input → expected result → pass/fail criteria.

**Outcome:** Students design multi-step dialogue test scenarios and locate context failures at various stages.

---

### Lesson 8. Testing different models and GitHub Models

Models aren't constants. Identical systems behave differently across GPT-4o, Claude Sonnet, Gemini, Llama. What changes: temperature sensitivity, instruction following, output consistency, hallucination rates. GitHub Models for comparative testing: fast access to multiple providers without separate API keys. Model benchmarking strategy and automation. When and why to switch models in production.

**In-class practice:** Students run an identical eval-suite on two different models via GitHub Models, compare results, identify significant behavioral differences, and recommend which model suits the use case.

**Homework:** Build a model-comparison report: run a golden dataset on 3+ models, documenting metrics, cost, and latency. Submit: comparison table + a justified recommendation.

**Outcome:** Students compare model behavior across eval-suites and make evidence-based model-selection recommendations.

---

### Lesson 9. Local models for testing: Ollama and Lemonade AI Runtime

Why LLM-as-a-Judge costs become problematic at CI/CD scale: "$0.003 per judge-call × 500 tests × 10 PRs/day = a real budget." Local models solve this: zero per-call cost, full privacy, no rate limits or network dependencies. Ollama overview: supported models (Llama 3, Mistral, Phi-3, Gemma 2, Qwen). Lemonade AI Runtime as an alternative emphasizing Windows and NPU acceleration. Local-model selection: RAM size, judgment quality, and speed trade-offs. Where local models suffice for judges versus requiring the cloud.

**Judge selection strategy:**
- Local development → Ollama + Phi-3 Mini (3.8B) — runs on a laptop, 2–5 sec response
- CI on GitHub Actions → Ollama + Llama 3.1 8B in Docker — free, no secrets needed
- Pre-release gate → Claude Haiku or GPT-4o Mini — higher judgment quality
- Regression tests (500+) → local model — cloud costs unacceptable

**In-class practice:** The instructor demonstrates a live Ollama deployment and Lemonade runtime setup, connects to DeepEval via a custom model wrapper, runs an eval-suite first with a cloud model as judge, then local, and compares results and costs.

**Homework:** Deploy Ollama locally and integrate it as a judge into an eval-suite. Run tests with three configurations: cloud model, large Ollama model (7B+), small Ollama model (3B or less). Submit: an accuracy/latency/cost table + a conclusion on the optimal configuration per pipeline stage.

**Outcome:** Students deploy local models via Ollama or Lemonade, integrate them as judges in DeepEval, and make informed decisions on local versus cloud judge deployment.

---

## Block 3. Agentic Testing

*(Lessons 10–14 — intermediate level, API experience and basic automation required)*

### Lesson 10. LLM as a Judge: implementation and pitfalls

LLM-as-a-Judge is now standard in AI evaluation. Covers architecture: prompt selection, model choice, response format. When judges are reliable and when they mislead: positional bias, verbosity bias, self-preference. Judge calibration: human validation, inter-rater agreement, prompt tuning. Implementation via DeepEval and RAGAS. When an LLM-judge replaces humans versus complements them. Cost and latency considerations for CI.

**In-class practice:** Students write custom judge-prompts for demo-agent responses, compare against ground truth, identify judge errors, and refine prompts to reduce false evaluations.

**Homework:** Implement LLM-as-a-Judge for your own system: write a judge-prompt, run it on 10 examples, manually validate all 10, calculate judge accuracy. Submit: prompt + results + an analysis of judge failures.

**Outcome:** Students implement and tune the LLM-as-a-Judge pattern and understand its limitations.

---

### Lesson 11. Security testing: Prompt Injection and Red Teaming

OWASP LLM Top 10 as a practical checklist. Direct prompt injection: instruction overwriting. Indirect injection: attacks via external content (documents, pages, tool results). Jailbreaking methods and defenses. Data exfiltration through agents. How system prompts and context engineering shape the attack surface. Red-team session methodology: structure, documentation, prioritization.

**In-class practice:** Students receive a demo agent with intentional vulnerabilities. Goal: find at least 2 vulnerabilities of different types from the OWASP LLM Top 10 within 30 minutes, documented in security-report format.

**Homework:** Conduct an independent red-team session on a public AI product or demo. Document 3+ vulnerabilities: vulnerability → attack vector → severity → mitigation recommendation.

**Outcome:** Students conduct basic red-team sessions per the OWASP LLM Top 10 and document findings in security-report format.

---

### Lesson 12. Tool call testing and MCP

Tool-call testing essentials: correct tool, correct parameters, correct order. Playwright MCP as both a testing object and a testing tool. Programmatic tool-call interception and verification. Common bugs: superfluous calls, missed calls, incorrect parameters.

**In-class practice:** Students run a prepared agent with Playwright MCP, observe tool calls in the trace, locate one incorrect call in a prepared scenario, and write an assertion to catch it automatically.

**Homework:** Write automated tool-call behavior tests — at least 5 test cases: correct call, call with wrong parameters, missed call, superfluous call, incorrect order. Submit: code + execution results.

**Outcome:** Students understand tool-call testing specifics and write automated checks for agent behavior during tool interaction.

---

### Lesson 13. Observability and cost testing

Why QA needs agent tracing. LangSmith and Phoenix/Arize: what they show and how to read them. What to find in traces: latency anomalies, token loops, unexpected tool calls, quality degradation. Cost testing: identifying expensive scenarios. Production-monitoring metrics.

**In-class practice:** Students connect LangSmith to a demo agent and run a scenario with an intentional token loop. Task: locate the anomaly in the trace, identify the misstep, calculate the cost of the failed versus normal scenario.

**Homework:** Configure observability for a demo agent. Run 5 scenarios comparing latency, tokens, cost, tool-call count. Identify the most expensive scenario. Submit: trace screenshots + a comparison table + an optimization recommendation.

**Outcome:** Students configure agent-system tracing and locate behavioral and cost anomalies through observability tools.

---

### Lesson 14. AI-assisted Test Case Generation and Code Review

Using AI for test-case generation — and validating quality. Patterns: generation from requirements, generation from code, edge-case generation from golden datasets. GitHub Copilot and Claude as test-design assistants. AI-assisted code review for test code: prompting models to find weak assertions and incomplete tests. Risks of over-trusting AI-generated tests: false coverage, implicit assumptions. Validating generated-test quality.

**In-class practice:** Students ask AI to generate test cases for agent functionality. Task: critically evaluate the results — find tests that appear correct but check nothing, and rewrite them.

**Homework:** Generate test cases for a chosen component using an AI agent integrated in the pipeline, then perform a manual review. Submit: a GitHub repository with the original tests + review comments. Execution as part of a local agentic workflow.

**Outcome:** Students use AI as a test-generation tool and critically assess result quality. They configure agentic workflows in CI/CD environments.

---

## Block 4. Automation and frameworks

*(Lessons 15–16 — advanced level, experience writing automated tests required)*

### Lesson 15. Building a framework for automated AI testing

What distinguishes AI test frameworks from standard automation frameworks. Key components: dataset management, eval runner, assertion engine, result storage, reporting. Designing frameworks that support unit-level eval and E2E agent testing. Patterns: LLM response fixtures, golden-dataset factories, model wrappers. Test versioning alongside prompt versioning. Framework portability across providers (OpenAI, Anthropic, local models).

**In-class practice:** Students receive a basic framework skeleton and complete the missing components: dataset loader, assertion wrapper, HTML report generation.

**Homework:** Design and implement a minimal AI test framework for a chosen system. Minimum requirements: dataset loading, eval execution, result storage, basic reporting. Submit: repository + README + execution example.

**Outcome:** Students build structured AI-testing frameworks rather than isolated scripts, understanding the critical components.

---

### Lesson 16. Eval pipeline in CI/CD: Quality Gates with DeepEval and LLM-as-a-Judge

Why eval belongs in release pipelines — standard unit-test gates are insufficient for AI systems. Quality-gate architecture: what to check, frequency, deployment blockers. GitHub Actions + DeepEval: step-by-step configuration from scratch. LLM-as-a-Judge as an automated gate without human intervention. Benchmark thresholds: setting metric baselines and when to review them. Simulating a prompt-change regression to verify gate effectiveness. Flaky eval causes and solutions: seed, retry logic, threshold bands. Reporting eval results in pull requests: annotations, summary comments, Slack notifications.

**In-class practice:** Students clone a prepared repository with a basic GitHub Actions configuration. Task: add two gates — one DeepEval metric-based, one LLM-judge-based. Simulate a prompt change that breaks both gates.

**Homework:** Mature an eval-suite into a CI/CD pipeline with at least two quality gates — one rule-based (DeepEval metric), one model-based (LLM judge). Submit: repository + a green-run screenshot + a blocked-run screenshot (simulated regression) + a threshold-logic explanation.

**Outcome:** Students embed eval-based and judge-based quality gates in CI/CD pipelines with automatic deployment blocking on quality degradation.

---

## Block 5. System level and Agentic Workflows

*(Lessons 17–19 — advanced level, CI/CD experience and DevOps basics required)*

### Lesson 17. Agentic CI/CD: AI agents as part of the development pipeline

Agentic workflows differ from eval gates: agents act, not just verify. Usage patterns: automated code review through GitHub Copilot or Claude Code in PRs, automatic test generation or updates on code changes, automatic documentation updates on prompt or specification changes. Implementation via GitHub Actions + MCP: giving agents repository access while controlling capabilities. Claude Code and GitHub Copilot as pipeline agents: where each excels. Validating agent work quality: validation gates following agent actions. Agentic CI/CD risks: infinite loops, technical debt from low-quality generation, excessive permissions.

**In-class practice:** Students configure a GitHub Actions workflow where an agent (Claude Code or Copilot) automatically code-reviews test files on PR opening and leaves comments. Task: evaluate review quality on a prepared PR with intentional problems and assess the agent's detection.

**Homework:** Implement an agentic workflow for one option: automatic code review of tests in a PR, or auto-test generation on a specification change. Submit: repository + demo execution + an analysis of the agent's result quality + a list of omissions/errors.

**Outcome:** Students understand where agentic CI/CD delivers ROI and where it creates risks, implementing basic versions with quality validation.

---

### Lesson 18. Documentation and Test Generation as part of an agentic workflow

How agentic workflows keep documentation and tests current. Pattern: an AI agent reads the PR diff → generates or updates test cases → proposes documentation changes. GitHub Actions + MCP implementation. Validating auto-generated documentation quality. Where agents help versus create debt. Real product-team implementation examples.

**In-class practice:** Students configure a simple GitHub Actions workflow: on prompt-file changes, the agent automatically generates updated test cases and opens a PR with them.

**Homework:** Implement an agentic workflow for one option: automatic documentation update on a prompt change, or auto-test generation on a specification change. Submit: repository + demo execution + a result-quality analysis + a list of agent errors.

**Outcome:** Students understand where agentic workflows deliver QA ROI and implement basic versions.

---

## Block 6. Final project

*(Lessons 19–21 — synthesis of the whole course)*

### Lesson 19. Final-project prep: consultations and peer review

Students present their current project status. Peer review: repository exchange and structured feedback via a checklist. The instructor discusses common mistakes and answers questions.

### Lessons 20–21. Final-project defense

Each student: a 10-minute live pipeline demo + 5 minutes of Q&A.
Question focus: "Why that threshold in the quality gate," "Where does your judge fail," "What would you change with another week," "What decision did the assistant make and do you agree."

---

## Final project: AI-Powered Application — the full cycle

Students independently develop an AI application, cover it with tests, configure a complete CI/CD pipeline, and document the quality strategy. Goal: demonstrate the independent construction of a production process around an AI system — from the initial commit through automatic release — not just tool proficiency.

### What to develop

**1. AI application (with a code assistant's help)**

Students build a minimal but real AI application — a chatbot, RAG agent, tool-equipped agent, or pipeline — using GitHub Copilot, Claude Code, or an equivalent. Requirements: multiple components and non-trivial logic. Scope: 300–800 lines of core logic. Document the student's decisions versus the assistant's decisions and the assistant's errors.

**2. Test strategy**

A structured document: system description and risks, testing-level selection (unit / integration / eval / E2E / security), priority justification, the approach per level, tool selection and rationale, release go/no-go criteria. Length: 2–4 pages.

**3. Risk-based test coverage matrix**

A components list, risk assessment per component (impact × likelihood), test-case coverage mapping, gaps — where coverage is absent and why that's acceptable or problematic. Format: an annotated table.

**4. Tests — all levels**

| Level | Minimum | Tools |
|-------|---------|-------|
| Unit / component eval | 10 test cases | DeepEval or Promptfoo |
| RAG or dialog testing | metrics on 10 examples | RAGAS or DeepEval |
| LLM-as-a-Judge | a one-category judge | custom implementation |
| Security | 3 attack vectors | manual red team |
| E2E | 2 complete scenarios | Playwright or pytest |

**5. System test framework with LLM-as-a-Judge**

A separate repository module: dataset loader, eval runner, judge integration, result storage, HTML/Markdown reporting. The framework enables a full system eval via a single command, with metrics and judge-score reports. Designed for reapplication to different systems (dataset and config changes only).

**6. CI/CD pipeline on GitHub Actions**

A complete pipeline on PR and main-branch push:
- Eval-suite with quality gates (DeepEval + judge) — blocks merge on failure
- AI code-review agent (Claude Code or Copilot) — comments in the PR
- Security checks
- Automatic release on main push: build → test → deploy (GitHub Pages, Railway, Fly.io, or similar) → smoke test post-deployment

**7. Documentation**

A README with execution instructions. An architecture description. Documentation of AI-assistant usage in development and testing — honestly: what helped, what hindered, what required manual rework.

---

## Target audience

**Segment 1: QA Engineer Middle+ (the primary segment)**

Profile: 2–5 years of testing experience, already uses AI tools for test generation, doesn't understand how to test AI systems themselves. Works in a product company or feels pressure from an AI-stack transition.
JTBD: "Our product moved to LLMs. I don't understand how to test it properly — and I fear becoming irrelevant. I want concrete tools and approaches to confidently discuss AI-system quality with the team next week."

**Segment 2: Automation QA / SDET Middle+ (the technical segment)**

Profile: Writes automated tests, Python or JS at a script-writing level, understands CI/CD. Wants to automate AI-system testing like traditional software.
JTBD: "I automate traditional QA well. Now teams build agents and ask me to 'somehow test this.' I want a specific technical stack — frameworks, tools, approaches — to do this right."

**Segment 3: Tech Lead / QA Lead (the strategic segment)**

Profile: Responsible for overall product quality. The team already builds or plans LLM features. Understands the big picture but lacks a structured AI QA framework.
JTBD: "We're launching AI features but I don't understand quality assurance. I fear production incidents and don't know what to ask to verify the testing. I want structure and confidence."
