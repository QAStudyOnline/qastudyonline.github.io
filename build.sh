#!/bin/bash

# QA Study Online - Simple Build Script with Multi-language Support
# This script builds the site without relying on Jekyll's Sass processing

echo "🔨 Building QA Study Online (English Only)..."

# Create _site directory if it doesn't exist
mkdir -p _site

# Copy assets
echo "📁 Copying assets..."
cp -r assets _site/
cp -r _layouts _site/
cp -r _includes _site/
cp -r _courses _site/
cp -r _posts _site/ 2>/dev/null || mkdir -p _site/_posts
cp -r _data _site/ 2>/dev/null || mkdir -p _site/_data
cp -r _plugins _site/ 2>/dev/null || mkdir -p _site/_plugins

# Copy configuration
cp _config.yml _site/

# Copy main files (avoid overwriting generated index.html)
cp index.md _site/
for f in *.html; do
  if [ "$f" != "index.html" ] && [ -f "$f" ]; then
    cp "$f" _site/
  fi
done

# Create standalone 404 page
cat > "_site/404.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background-color: white; color: #333; line-height: 1.6; }
        .container { min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 1rem; }
        .content { max-width: 32rem; text-align: center; }
        .error-number { font-size: 8rem; font-weight: 900; color: black; margin-bottom: 1rem; line-height: 1; }
        .graphic { width: 16rem; height: 16rem; margin: 0 auto 3rem; position: relative; }
        .graphic svg { width: 100%; height: 100%; }
        .title { font-size: 2.5rem; font-weight: 700; color: black; margin-bottom: 1.5rem; }
        .description { font-size: 1.125rem; color: #666; margin-bottom: 3rem; max-width: 24rem; margin-left: auto; margin-right: auto; }
        .buttons { display: flex; flex-direction: column; gap: 1rem; justify-content: center; margin-bottom: 2rem; }
        .btn { display: inline-flex; align-items: center; justify-content: center; padding: 0.75rem 1.5rem; font-weight: 500; border-radius: 0.5rem; transition: all 0.2s ease; text-decoration: none; border: none; cursor: pointer; font-size: 1rem; }
        .btn-primary { background-color: black; color: white; }
        .btn-primary:hover { background-color: #333; transform: translateY(-1px); }
        .btn-outline { background-color: transparent; color: black; border: 2px solid black; }
        .btn-outline:hover { background-color: black; color: white; transform: translateY(-1px); }
        .btn-ghost { background-color: transparent; color: #666; border: 1px solid transparent; }
        .btn-ghost:hover { background-color: #f3f4f6; color: black; }
        .btn-sm { padding: 0.5rem 1rem; font-size: 0.875rem; }
        .search-box { margin-bottom: 2rem; }
        .search-container { max-width: 24rem; margin: 0 auto; }
        .search-input { width: 100%; padding: 0.75rem 1rem 0.75rem 3rem; font-size: 1rem; color: #333; background-color: #f9fafb; border: 1px solid #d1d5db; border-radius: 0.5rem; outline: none; }
        .search-input:focus { border-color: black; box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.1); }
        .search-icon { position: absolute; left: 0.75rem; top: 50%; transform: translateY(-50%); color: #9ca3af; pointer-events: none; }
        .quick-links { margin-bottom: 2rem; }
        .quick-links h3 { font-size: 1.125rem; font-weight: 600; color: black; margin-bottom: 1rem; }
        .quick-links .links { display: flex; flex-wrap: wrap; justify-content: center; gap: 0.75rem; }
        .back-button { margin-top: 2rem; }
        @media (min-width: 640px) { .buttons { flex-direction: row; } .error-number { font-size: 9rem; } .title { font-size: 3rem; } }
        @media (max-width: 640px) { .error-number { font-size: 4rem; } .title { font-size: 2rem; } .graphic { width: 12rem; height: 12rem; } }
        .fade-in { opacity: 0; transform: translateY(20px); animation: fadeIn 0.6s ease forwards; }
        @keyframes fadeIn { to { opacity: 1; transform: translateY(0); } }
        .fade-in:nth-child(1) { animation-delay: 0.1s; } .fade-in:nth-child(2) { animation-delay: 0.2s; } .fade-in:nth-child(3) { animation-delay: 0.3s; } .fade-in:nth-child(4) { animation-delay: 0.4s; } .fade-in:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <div class="error-number fade-in">404</div>
            <div class="graphic fade-in">
                <svg viewBox="0 0 200 200" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M40 40 L100 160 L160 40" stroke="black" stroke-width="12" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>
            <h1 class="title fade-in">Page Not Found</h1>
            <p class="description fade-in">The page you're looking for doesn't exist or has been moved.</p>
            <div class="buttons fade-in">
                <a href="/" class="btn btn-primary">Go Home</a>
                <a href="/courses/" class="btn btn-outline">Browse Courses</a>
            </div>
            <div class="search-box fade-in">
                <div class="search-container">
                    <div style="position: relative;">
                        <input type="text" id="search-input" placeholder="Search for courses, articles, or topics..." class="search-input">
                        <svg class="search-icon" width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="quick-links fade-in">
                <h3>Quick Links</h3>
                <div class="links">
                    <a href="/about/" class="btn btn-ghost btn-sm">About</a>
                    <a href="/contact/" class="btn btn-ghost btn-sm">Contact</a>
                    <a href="/courses/manual-testing-bootcamp/" class="btn btn-ghost btn-sm">Manual Testing</a>
                    <a href="/courses/automated-testing/" class="btn btn-ghost btn-sm">Automation</a>
                    <a href="/blog/" class="btn btn-ghost btn-sm">Blog</a>
                </div>
            </div>
            <div class="back-button fade-in">
                <button onclick="history.back()" class="btn btn-ghost">
                    <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="margin-right: 0.5rem;">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                    </svg>
                    Go Back
                </button>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('search-input').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                const query = this.value.trim();
                if (query) {
                    window.location.href = '/courses/';
                }
            }
        });
        document.addEventListener('DOMContentLoaded', function() {
            const fadeElements = document.querySelectorAll('.fade-in');
            fadeElements.forEach((el, index) => {
                setTimeout(() => {
                    el.style.opacity = '1';
                    el.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
    </script>
</body>
</html>
EOF

# Create language-specific directories and pages
echo "🌍 Creating language-specific pages..."

# Get languages from config (fallback to default)
LANGUAGES="en"

# Create main index.html for default language (English) - always overwrite to ensure correct content
echo "📄 Creating index.html for English..."
cat > _site/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QAStudy.online - Master QA Testing Skills</title>
    <meta name="description" content="Learn quality assurance, software testing, and automation from industry experts">
    <link rel="stylesheet" href="assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="container">
            <div class="d-flex justify-between align-center py-4">
                <a href="/" class="navbar-brand">
                    QAStudy.online
                </a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="/courses/" class="nav-link">Courses</a>
                    </li>
                    <li class="nav-item">
                        <a href="/about/" class="nav-link">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <div class="hero-text">
                    <h1>Master QA Testing Skills</h1>
                    <p class="hero-description">
                        Learn quality assurance, software testing, and automation from industry experts. Build your career in QA with hands-on projects and real-world experience.
                    </p>
                    <div class="hero-actions">
                        <a href="/courses/" class="btn btn-primary btn-lg">Start Learning</a>
                        <a href="/about/" class="btn btn-secondary btn-lg">Learn More</a>
                    </div>
                </div>
                <div class="hero-image">
                    <div class="hero-img-wrapper">
                        <div class="hero-placeholder">
                            QA Testing Hero
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="py-20 bg-white">
        <div class="container">
            <div class="text-center mb-16">
                <h2 class="h2 mb-4">About QAStudy.online</h2>
                <p class="text-large text-gray-600">Your gateway to mastering QA testing skills</p>
            </div>
            
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 align-center">
                <div class="instructor-image">
                    <div class="instructor-img-wrapper">
                        <div class="instructor-placeholder">
                            Yehor Maksymchuk
                        </div>
                    </div>
                    <div class="social-links-inline mt-6">
                        <a href="https://www.youtube.com/channel/UCS3oHP-HI518g2mY4AnzibA" class="social-link" target="_blank" rel="noopener" aria-label="YouTube Channel">
                            <svg fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
                            </svg>
                        </a>
                        <a href="https://github.com/QAStudyOnline" class="social-link" target="_blank" rel="noopener" aria-label="GitHub Organization">
                            <svg fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                            </svg>
                        </a>
                    </div>
                </div>
                <div class="instructor-bio">
                    <h3 class="h3 mb-4 text-primary">Yehor Maksymchuk</h3>
                    <p class="text-large text-gray-700 mb-4">
                        QA Expert with 10+ years of experience in software testing, test automation, and quality assurance leadership.
                    </p>
                    <p class="text-gray-600 mb-4">
                        I've worked with Fortune 500 companies and startups, building robust testing frameworks and leading QA teams. My passion is helping aspiring QA professionals master the skills they need to succeed in this exciting field.
                    </p>
                    <ul class="space-y-3 mb-6">
                        <li class="flex align-start">
                            <svg class="icon text-primary mr-3 mt-1" fill="currentColor" viewBox="0 0 20 20" width="20" height="20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                            </svg>
                            <span>Certified ISTQB Professional with advanced specializations</span>
                        </li>
                        <li class="flex align-start">
                            <svg class="icon text-primary mr-3 mt-1" fill="currentColor" viewBox="0 0 20 20" width="20" height="20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                            </svg>
                            <span>10,000+ students trained worldwide through online courses</span>
                        </li>
                        <li class="flex align-start">
                            <svg class="icon text-primary mr-3 mt-1" fill="currentColor" viewBox="0 0 20 20" width="20" height="20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                            </svg>
                            <span>Expert in Selenium, JMeter, API Testing, and CI/CD automation</span>
                        </li>
                    </ul>
                    <div class="instructor-cta">
                        <a href="https://www.youtube.com/channel/UCS3oHP-HI518g2mY4AnzibA" class="btn btn-primary" target="_blank" rel="noopener">
                            Watch Free Tutorials on YouTube
                        </a>
                        <a href="https://github.com/QAStudyOnline" class="btn btn-secondary" target="_blank" rel="noopener">
                            Explore GitHub Projects
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-20 bg-gray-50">
        <div class="container">
            <div class="text-center mb-16">
                <h2 class="h2 mb-4">Why Choose QAStudy.online?</h2>
                <p class="text-large text-gray-600">Join thousands of professionals who've advanced their QA careers with us</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="text-center">
                    <div class="w-16 h-16 bg-primary-100 rounded-full d-flex align-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-primary" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <h3 class="h4 mb-3">Industry Expert Instructors</h3>
                    <p class="text-gray-600">Learn from experienced QA professionals who've worked at top tech companies.</p>
                </div>

                <div class="text-center">
                    <div class="w-16 h-16 bg-primary-100 rounded-full d-flex align-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-primary" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3z"></path>
                        </svg>
                    </div>
                    <h3 class="h4 mb-3">Hands-on Projects</h3>
                    <p class="text-gray-600">Build real-world testing projects that you can showcase in your portfolio.</p>
                </div>

                <div class="text-center">
                    <div class="w-16 h-16 bg-primary-100 rounded-full d-flex align-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-primary" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z"></path>
                        </svg>
                    </div>
                    <h3 class="h4 mb-3">Career Support</h3>
                    <p class="text-gray-600">Get help with resume reviews, interview preparation, and job placement assistance.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section footer-brand">
                    <div class="brand-info">
                        <h3>QAStudy.online</h3>
                        <p>Master QA Testing Skills - Learn quality assurance, software testing, and automation from industry experts</p>
                    </div>
                </div>

                <div class="footer-section">
                    <h3>Learn</h3>
                    <ul class="footer-links">
                        <li><a href="/courses/">All Courses</a></li>
                        <li><a href="/about/">About Us</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Connect</h3>
                    <ul class="footer-links">
                        <li><a href="https://www.youtube.com/channel/UCS3oHP-HI518g2mY4AnzibA" target="_blank" rel="noopener">YouTube Channel</a></li>
                        <li><a href="https://github.com/QAStudyOnline" target="_blank" rel="noopener">GitHub Projects</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Support</h3>
                    <ul class="footer-links">
                        <li><a href="/help/">Help Center</a></li>
                        <li><a href="/contact/">Contact Us</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="footer-bottom-content">
                    <p>&copy; 2024 QAStudy.online. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="assets/js/main.js"></script>
</body>
</html>
EOF

# Language-specific pages removed - English only

# Create courses index page
echo "📚 Creating courses index page..."
cat > "_site/courses/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QA Courses - QA Study Online</title>
    <link rel="stylesheet" href="/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        .course-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            overflow: hidden;
        }
        .course-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }
        .course-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
        }
        .course-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        .course-subtitle {
            font-size: 1rem;
            opacity: 0.9;
        }
        .course-body {
            padding: 1.5rem;
        }
        .course-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            flex-wrap: wrap;
        }
        .meta-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }
        .course-description {
            color: #4b5563;
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }
        .course-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 1.5rem;
            background: #f9fafb;
            border-top: 1px solid #e5e7eb;
        }
        .course-price {
            font-size: 1.25rem;
            font-weight: 700;
            color: #059669;
        }
        .course-btn {
            background: #667eea;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.2s;
        }
        .course-btn:hover {
            background: #5a67d8;
        }
        .courses-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            margin-top: 2rem;
        }
        @media (max-width: 1024px) {
            .courses-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 768px) {
            .courses-grid {
                grid-template-columns: 1fr;
            }
        }
        .page-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        .page-title {
            font-size: 3rem;
            font-weight: 800;
            color: #1f2937;
            margin-bottom: 1rem;
        }
        .page-subtitle {
            font-size: 1.25rem;
            color: #6b7280;
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container mx-auto px-4 py-8">
        <nav class="mb-8">
            <a href="/" class="text-purple-600 hover:text-purple-800">← Back to Home</a>
        </nav>
        
        <div class="page-header">
            <h1 class="page-title">QA Courses</h1>
            <p class="page-subtitle">Master the art of quality assurance with our comprehensive course collection</p>
        </div>
        
        <div class="courses-grid">
EOF

# Define course order
COURSE_ORDER=(
    "career-qa-manager"
    "ai-agent-testing" 
    "performance-testing"
    "api-automation"
    "automated-testing"
    "manual-testing-bootcamp"
)

# Add course cards in specific order
for course_slug in "${COURSE_ORDER[@]}"; do
    course_file="_courses/${course_slug}.md"
    if [ -f "$course_file" ]; then
        course_name="$course_slug"
        title=$(grep "^title:" "$course_file" | head -1 | sed 's/title: *"//' | sed 's/"//')
        subtitle=$(grep "^subtitle:" "$course_file" | head -1 | sed 's/subtitle: *"//' | sed 's/"//')
        description=$(grep "^description:" "$course_file" | head -1 | sed 's/description: *"//' | sed 's/"//')
        duration=$(grep "^duration:" "$course_file" | head -1 | sed 's/duration: *"//' | sed 's/"//')
        lessons=$(grep "^lessons:" "$course_file" | head -1 | sed 's/lessons: *//')
        level=$(grep "^level:" "$course_file" | head -1 | sed 's/level: *"//' | sed 's/"//')
        price=$(grep "^price:" "$course_file" | head -1 | sed 's/price: *//')
        
        cat >> "_site/courses/index.html" << EOF
            <div class="course-card">
                <div class="course-header">
                    <h2 class="course-title">$title</h2>
                    <p class="course-subtitle">$subtitle</p>
                </div>
                <div class="course-body">
                    <div class="course-meta">
                        <div class="meta-item">
                            <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"></path>
                            </svg>
                            $duration
                        </div>
                        <div class="meta-item">
                            <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"></path>
                            </svg>
                            $lessons lessons
                        </div>
                        <div class="meta-item">
                            <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                            </svg>
                            $level
                        </div>
                    </div>
                    <p class="course-description">$description</p>
                </div>
                <div class="course-footer">
                    <div class="course-price">\$$price</div>
                    <a href="/courses/$course_name/" class="course-btn">View Course</a>
                </div>
            </div>
EOF
    fi
done

# Close the HTML
cat >> "_site/courses/index.html" << 'EOF'
        </div>
    </div>
    <script src="/assets/js/main.js"></script>
</body>
</html>
EOF

# Create course pages for each language
echo "📚 Creating course pages for all languages..."
for course in _courses/*.md; do
    if [ -f "$course" ]; then
        course_name=$(basename "$course" .md)
        
        # Extract title from front matter
        title=$(grep "^title:" "$course" | head -1 | sed 's/title: *"//' | sed 's/"//')
        
        # Extract other front matter data
        subtitle=$(grep "^subtitle:" "$course" | head -1 | sed 's/subtitle: *"//' | sed 's/"//')
        description=$(grep "^description:" "$course" | head -1 | sed 's/description: *"//' | sed 's/"//')
        duration=$(grep "^duration:" "$course" | head -1 | sed 's/duration: *"//' | sed 's/"//')
        lessons=$(grep "^lessons:" "$course" | head -1 | sed 's/lessons: *//')
        level=$(grep "^level:" "$course" | head -1 | sed 's/level: *"//' | sed 's/"//')
        price=$(grep "^price:" "$course" | head -1 | sed 's/price: *//')
        
        # Extract content after front matter (everything after line 185)
        content=$(tail -n +186 "$course")
        
        # Create course page for English only
                mkdir -p "_site/courses/$course_name"
                cat > "_site/courses/$course_name/index.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title - QA Study Online</title>
    <link rel="stylesheet" href="/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        /* Enhanced Course Page Styles */
        .course-hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4rem 0;
            margin-bottom: 3rem;
        }
        .course-hero h1 {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 1rem;
        }
        .course-hero .subtitle {
            font-size: 1.25rem;
            opacity: 0.9;
            margin-bottom: 1.5rem;
        }
        .course-hero .description {
            font-size: 1.1rem;
            opacity: 0.95;
            max-width: 600px;
        }
        .course-meta-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin: 2rem 0;
        }
        .meta-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .meta-value {
            font-size: 2rem;
            font-weight: 700;
            color: #667eea;
            margin-bottom: 0.5rem;
        }
        .meta-label {
            color: #6b7280;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        .course-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            text-align: left;
            overflow-x: visible;
        }
        .course-content p {
            color: #4b5563;
            line-height: 1.7;
            margin-bottom: 1rem;
            padding-left: 0;
            margin-left: 0;
            text-indent: 0;
        }
        .course-content h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #1f2937;
            margin: 2rem 0 1rem 0;
            padding-bottom: 0.5rem;
            border-bottom: 3px solid #667eea;
        }
        .course-content h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #374151;
            margin: 1.5rem 0 1rem 0;
        }
        .course-content h4 {
            font-size: 1.25rem;
            font-weight: 600;
            color: #4b5563;
            margin: 1rem 0 0.5rem 0;
        }
        .course-content p {
            color: #4b5563;
            line-height: 1.7;
            margin-bottom: 1rem;
        }
        .course-content ul, .course-content ol {
            margin: 1rem 0;
            padding-left: 1.5rem;
        }
        .course-content li {
            color: #4b5563;
            line-height: 1.6;
            margin-bottom: 0.5rem;
        }
        .course-content strong {
            color: #1f2937;
            font-weight: 600;
        }
        .course-content em {
            color: #6b7280;
            font-style: italic;
        }
        .highlight-box {
            background: #f0f9ff;
            border-left: 4px solid #0ea5e9;
            padding: 1.5rem;
            margin: 1.5rem 0;
            border-radius: 0 8px 8px 0;
        }
        .cta-section {
            background: #f8fafc;
            padding: 3rem 2rem;
            text-align: center;
            margin: 3rem 0;
            border-radius: 12px;
        }
        .cta-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1rem 2rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            display: inline-block;
            transition: transform 0.2s;
        }
        .cta-button:hover {
            transform: translateY(-2px);
        }
        .back-button {
            background: #f3f4f6;
            color: #374151;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.2s;
            margin-bottom: 2rem;
        }
        .back-button:hover {
            background: #e5e7eb;
            transform: translateX(-2px);
        }
        .markdown-content {
            width: 100%;
            overflow-x: visible;
        }
        .markdown-content p:first-child {
            margin-top: 0;
        }
        .markdown-content h2:first-child {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <!-- Course Hero Section -->
    <div class="course-hero">
        <div class="container mx-auto px-4">
            <a href="/" class="back-button">← Back to Home</a>
            <h1>$title</h1>
            <p class="subtitle">$subtitle</p>
            <p class="description">$description</p>
        </div>
    </div>
    
    <div class="container mx-auto px-4">
        <!-- Course Meta Info -->
        <div class="course-meta-grid">
            <div class="meta-card">
                <div class="meta-value">$duration</div>
                <div class="meta-label">Duration</div>
            </div>
            <div class="meta-card">
                <div class="meta-value">$lessons</div>
                <div class="meta-label">Lessons</div>
            </div>
            <div class="meta-card">
                <div class="meta-value">$level</div>
                <div class="meta-label">Level</div>
            </div>
            <div class="meta-card">
                <div class="meta-value">\$$price</div>
                <div class="meta-label">Price</div>
            </div>
        </div>
        
        <!-- Course Content -->
        <div class="course-content">
            <div class="markdown-content">
                $(echo "$content" | sed 's/^## /<h2>/g; s/^### /<h3>/g; s/^#### /<h4>/g; s/^# /<h1>/g; s/^\- /<li>/g; s/^\* /<li>/g; s/^[0-9]\+\. /<li>/g; s/^$/<\/p><p>/g; s/^[^<]/<p>/g' | sed 's/<p><h/<h/g; s/<\/h><\/p>/<\/h>/g' | sed 's/<p>s /<p>As /g; s/<p>raditional/<p>Traditional/g; s/<p>he /<p>The /g; s/<p>aking/<p>Making/g')
            </div>
            
            <!-- Call to Action -->
            <div class="cta-section">
                <h2>Ready to Start Learning?</h2>
                <p>Join thousands of students mastering QA testing</p>
                <a href="/courses/" class="cta-button">Browse All Courses</a>
            </div>
        </div>
    </div>
    <script src="/assets/js/main.js"></script>
</body>
</html>
EOF
            else
                mkdir -p "_site/$lang/courses/$course_name"
                cat > "_site/$lang/courses/$course_name/index.html" << EOF
<!DOCTYPE html>
<html lang="$lang">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title - QA Study Online</title>
    <link rel="stylesheet" href="/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto px-4 py-8">
        <nav class="mb-8">
            <a href="/$lang/" class="text-purple-600 hover:text-purple-800">← Back to Home</a>
        </nav>
        <h1 class="text-4xl font-bold text-gray-900 mb-8">$title</h1>
        <div class="prose prose-lg max-w-none">
            <p>Course content will be displayed here.</p>
        </div>
    </div>
    <script src="/assets/js/main.js"></script>
</body>
</html>
EOF
    fi
done

echo "✅ Build complete! Site is in _site/ directory"
echo "🌐 You can serve it with: python3 -m http.server 8000"
echo "🌍 English-only site built successfully" 