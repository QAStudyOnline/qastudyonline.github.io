#!/bin/bash

# QA Study Online - Simple Build Script with Multi-language Support
# This script builds the site without relying on Jekyll's Sass processing

echo "🔨 Building QA Study Online with Multi-language Support..."

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

# Copy main files
cp index.md _site/
cp *.html _site/ 2>/dev/null || true

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
LANGUAGES="en es fr de uk"

# Create main index.html for default language (English)
if [ ! -f "_site/index.html" ]; then
    echo "📄 Creating index.html for English..."
    cat > _site/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QA Study Online</title>
    <link rel="stylesheet" href="/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-8">QA Study Online</h1>
        <p class="text-xl text-gray-600 mb-8">Welcome to our QA education platform!</p>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Manual Testing</h3>
                    <p class="card-text">Learn the fundamentals of manual testing.</p>
                    <a href="/courses/manual-testing-bootcamp/" class="btn btn-primary">Learn More</a>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Automated Testing</h3>
                    <p class="card-text">Master automated testing tools and frameworks.</p>
                    <a href="/courses/automated-testing/" class="btn btn-primary">Learn More</a>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Performance Testing</h3>
                    <p class="card-text">Learn performance testing methodologies.</p>
                    <a href="/courses/performance-testing/" class="btn btn-primary">Learn More</a>
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/js/main.js"></script>
</body>
</html>
EOF
fi

# Create language-specific directories and pages
for lang in $LANGUAGES; do
    if [ "$lang" != "en" ]; then
        echo "🌍 Creating pages for $lang..."
        mkdir -p "_site/$lang"
        
        # Create language-specific index.html
        case $lang in
            "es")
                title="QA Study Online"
                subtitle="¡Bienvenido a nuestra plataforma de educación QA!"
                card1_title="Testing Manual"
                card1_text="Aprende los fundamentos del testing manual."
                card2_title="Testing Automatizado"
                card2_text="Domina las herramientas y frameworks de testing automatizado."
                card3_title="Testing de Rendimiento"
                card3_text="Aprende metodologías de testing de rendimiento."
                ;;
            "fr")
                title="QA Study Online"
                subtitle="Bienvenue sur notre plateforme d'éducation QA !"
                card1_title="Test Manuel"
                card1_text="Apprenez les fondamentaux du test manuel."
                card2_title="Test Automatisé"
                card2_text="Maîtrisez les outils et frameworks de test automatisé."
                card3_title="Test de Performance"
                card3_text="Apprenez les méthodologies de test de performance."
                ;;
            "de")
                title="QA Study Online"
                subtitle="Willkommen auf unserer QA-Bildungsplattform!"
                card1_title="Manuelles Testen"
                card1_text="Lernen Sie die Grundlagen des manuellen Testens."
                card2_title="Automatisiertes Testen"
                card2_text="Meistern Sie Tools und Frameworks für automatisiertes Testen."
                card3_title="Leistungstests"
                card3_text="Lernen Sie Methoden für Leistungstests."
                ;;
            "uk")
                title="QA Study Online"
                subtitle="Ласкаво просимо на нашу платформу QA освіти!"
                card1_title="Ручне Тестування"
                card1_text="Вивчайте основи ручного тестування."
                card2_title="Автоматизоване Тестування"
                card2_text="Опануйте інструменти та фреймворки автоматизованого тестування."
                card3_title="Тестування Продуктивності"
                card3_text="Вивчайте методології тестування продуктивності."
                ;;
            *)
                title="QA Study Online"
                subtitle="Welcome to our QA education platform!"
                card1_title="Manual Testing"
                card1_text="Learn the fundamentals of manual testing."
                card2_title="Automated Testing"
                card2_text="Master automated testing tools and frameworks."
                card3_title="Performance Testing"
                card3_text="Learn performance testing methodologies."
                ;;
        esac
        
        cat > "_site/$lang/index.html" << EOF
<!DOCTYPE html>
<html lang="$lang">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    <link rel="stylesheet" href="/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-8">$title</h1>
        <p class="text-xl text-gray-600 mb-8">$subtitle</p>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">$card1_title</h3>
                    <p class="card-text">$card1_text</p>
                    <a href="/$lang/courses/manual-testing-bootcamp/" class="btn btn-primary">Learn More</a>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">$card2_title</h3>
                    <p class="card-text">$card2_text</p>
                    <a href="/$lang/courses/automated-testing/" class="btn btn-primary">Learn More</a>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">$card3_title</h3>
                    <p class="card-text">$card3_text</p>
                    <a href="/$lang/courses/performance-testing/" class="btn btn-primary">Learn More</a>
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/js/main.js"></script>
</body>
</html>
EOF

        # Create language-specific 404 page
        cat > "_site/$lang/404.html" << EOF
<!DOCTYPE html>
<html lang="$lang">
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
        @media (min-width: 640px) { .buttons { flex-direction: row; } .error-number { font-size: 9rem; } .title { font-size: 3rem; } }
        @media (max-width: 640px) { .error-number { font-size: 4rem; } .title { font-size: 2rem; } .graphic { width: 12rem; height: 12rem; } }
        .fade-in { opacity: 0; transform: translateY(20px); animation: fadeIn 0.6s ease forwards; }
        @keyframes fadeIn { to { opacity: 1; transform: translateY(0); } }
        .fade-in:nth-child(1) { animation-delay: 0.1s; } .fade-in:nth-child(2) { animation-delay: 0.2s; } .fade-in:nth-child(3) { animation-delay: 0.3s; }
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
                <a href="/$lang/" class="btn btn-primary">Go Home</a>
                <a href="/$lang/courses/" class="btn btn-outline">Browse Courses</a>
            </div>
        </div>
    </div>
    <script>
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
    fi
done

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
        
        # Extract content after front matter (everything after the second ---)
        content=$(awk '/^---$/{c++} c==2{print; next} c>2' "$course")
        
        # Create course pages for each language
        for lang in $LANGUAGES; do
            if [ "$lang" == "en" ]; then
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
</head>
<body>
    <div class="container mx-auto px-4 py-8">
        <nav class="mb-8">
            <a href="/" class="text-purple-600 hover:text-purple-800">← Back to Home</a>
        </nav>
        <h1 class="text-4xl font-bold text-gray-900 mb-4">$title</h1>
        <p class="text-xl text-gray-600 mb-6">$subtitle</p>
        <p class="text-lg text-gray-700 mb-8">$description</p>
        
        <!-- Course Meta Info -->
        <div class="bg-gray-50 p-6 rounded-lg mb-8">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div class="text-center">
                    <div class="text-2xl font-bold text-purple-600">$duration</div>
                    <div class="text-sm text-gray-600">Duration</div>
                </div>
                <div class="text-center">
                    <div class="text-2xl font-bold text-purple-600">$lessons</div>
                    <div class="text-sm text-gray-600">Lessons</div>
                </div>
                <div class="text-center">
                    <div class="text-2xl font-bold text-purple-600">$level</div>
                    <div class="text-sm text-gray-600">Level</div>
                </div>
                <div class="text-center">
                    <div class="text-2xl font-bold text-purple-600">\$$price</div>
                    <div class="text-sm text-gray-600">Price</div>
                </div>
            </div>
        </div>
        
        <!-- Course Content -->
        <div class="prose prose-lg max-w-none">
            <div class="markdown-content">
                $(echo "$content" | sed 's/^## /<h2>/g; s/^### /<h3>/g; s/^#### /<h4>/g; s/^# /<h1>/g; s/^\- /<li>/g; s/^\* /<li>/g; s/^[0-9]\+\. /<li>/g; s/^$/<\/p><p>/g; s/^[^<]/<p>/g')
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
    fi
done

echo "✅ Build complete! Site is in _site/ directory"
echo "🌐 You can serve it with: python3 -m http.server 8000"
echo "🌍 Multi-language support enabled for: $LANGUAGES" 