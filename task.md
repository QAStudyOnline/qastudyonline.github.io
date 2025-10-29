Great – using Jekyll and GitHub Pages is a solid choice for maintaining a lightweight, scalable educational website like qastudy.online. Here’s a set of structured recommendations for organizing your site and landing pages, specifically tailored for your use case:

⸻

✅ RECOMMENDED LANDING PAGE STRUCTURE

1. Homepage – qastudy.online

Purpose: Introduction to QAStudy, explain value, show course categories
Suggested content:
•	Short tagline: “QA, Automation, and AI Testing Courses”
•	Hero section with CTA buttons: “Start Learning” / “Explore Courses”
•	Brief intro to you (Yehor) + experience
•	Course categories grid (Performance Testing, AI Agent Testing, API Automation, etc.)
•	Link to your YouTube channel and GitHub org
•	Testimonials or quote from students (if available)
•	Footer with contact info, socials, privacy links

⸻

2. Course Landing Pages – e.g. qastudy.online/performance

Purpose: Dedicated landing page per course
URL Structure: /[course-slug] (simple, lowercase)

For each course landing page:

Page Elements:
•	Course title + subtitle
e.g. “Performance Testing with JMeter & Docker”
•	Short description: What users will learn
•	Video intro (embed YouTube)
•	Curriculum overview (list lessons or modules)
•	Tools covered (JMeter, Docker, InfluxDB, Grafana, etc.)
•	Audience level: Beginner, Intermediate, Advanced
•	Call to action:
•	“Watch on YouTube” (link)
•	“Download examples from GitHub”
•	“Enroll on Udemy”
•	Quiz or Assignment preview (if available)
•	Optional: Testimonials / feedback
•	Contact / feedback form

Example pages:
•	/performance
•	/ai-agent-testing
•	/api-automation
•	/manual-qa
•	/career-qa-manager
•	/security-testing

⸻

🧱 JEKYLL STRUCTURE RECOMMENDATIONS

Since you’re using Jekyll, set up each course as a collection or subfolder.

Directory structure:

.
├── _config.yml
├── index.md  # Homepage
├── performance/
│   ├── index.md  # Performance course landing page
│   └── assets/   # Images, downloads, etc.
├── ai-agenttesting/
│   ├── index.md
│   └── assets/
...

_config.yml Example Snippet:

collections:
performance:
output: true
ai-agenttesting:
output: true


⸻

🎨 DESIGN TIPS
•	Use a consistent layout and design style across all landing pages.
•	Use Jekyll includes or layout templates to avoid repeating code (e.g. header/footer).
•	Use responsive YouTube embeds for videos.
•	Make use of Jekyll SEO plugin for better Google indexing.
•	Consider adding schema.org structured data to improve course discoverability in search results.

⸻

🔗 GitHub Pages + Git Integration
•	Host your Jekyll site on a dedicated branch (typically gh-pages) or root if using a user/org site.
•	Automate deploys using GitHub Actions if needed.
•	Keep all course assets (code, examples, quizzes) in your GitHub org and link to them directly from course pages.

⸻

⚙️ FUTURE IDEAS
•	Add /blog section to write short articles or updates.
•	Add /newsletter for lead generation (Mailchimp or Buttondown).
•	Include a JSON feed or RSS for updates.
•	Track analytics with Google Analytics 4 or Plausible.io

⸻

Would you like me to generate a Jekyll starter structure for you based on this setup? I can create the necessary files and templates for index.md, /performance, etc. Let me know!