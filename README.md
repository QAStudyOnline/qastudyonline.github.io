# QA Study Online - Jekyll Website

A modern Jekyll website for QA education platform built with a comprehensive design system.

## 🚀 Quick Start

### Prerequisites

Before running the site locally, make sure you have:

1. **Ruby** (version 2.6 or higher)
   ```bash
   ruby --version
   ```

2. **RubyGems** (comes with Ruby)
   ```bash
   gem --version
   ```

3. **Bundler** (install if not present)
   ```bash
   gem install bundler
   ```

### Installation & Local Development

#### Option 1: Using Makefile (Recommended)

1. **Clone or navigate to the project directory**
   ```bash
   cd /path/to/qastudy.online
   ```

2. **First time setup**
   ```bash
   make setup
   ```

3. **Start development server**
   ```bash
   make dev
   ```

4. **Access your site**
   - Open your browser and go to: `http://localhost:4000`
   - The site will automatically reload when you make changes

#### Option 2: Manual Commands

1. **Clone or navigate to the project directory**
   ```bash
   cd /path/to/qastudy.online
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Start the local development server**
   ```bash
   bundle exec jekyll serve
   ```

4. **Access your site**
   - Open your browser and go to: `http://localhost:4000`
   - The site will automatically reload when you make changes

### Alternative: Static HTML Demo

If you encounter Jekyll build issues, you can run the static HTML demo:

1. **Open the static demo using Makefile**
   ```bash
   make demo
   ```

2. **Or manually open the file**
   ```bash
   open index.html
   ```
   Or simply double-click the `index.html` file in your file explorer.

## 📝 Adding New Content

### Adding New Pages

#### Method 1: Using Makefile (Recommended)

1. **Create a new page with Makefile**:
   ```bash
   make new-page NAME=about
   ```

2. **Edit the generated file** to add your content:
   ```markdown
   # About Us

   Welcome to QA Study Online! We are dedicated to providing high-quality QA education...

   ## Our Mission

   Our mission is to help students become successful QA professionals...
   ```

#### Method 2: Manual Creation

1. **Create a new markdown file** in the root directory:
   ```bash
   touch about.md
   ```

2. **Add front matter** to the file:
   ```yaml
   ---
   layout: default
   title: "About Us"
   description: "Learn more about our QA education platform"
   ---
   ```

3. **Add your content** below the front matter:
   ```markdown
   # About Us

   Welcome to QA Study Online! We are dedicated to providing high-quality QA education...

   ## Our Mission

   Our mission is to help students become successful QA professionals...
   ```

#### Method 2: Using HTML Files

1. **Create a new HTML file** in the root directory:
   ```bash
   touch contact.html
   ```

2. **Add the HTML structure**:
   ```html
   ---
   layout: default
   title: "Contact Us"
   description: "Get in touch with our team"
   ---

   <div class="container mx-auto px-4 py-8">
     <h1 class="text-4xl font-bold text-gray-900 mb-8">Contact Us</h1>
     
     <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
       <div class="card">
         <div class="card-body">
           <h2 class="card-title">Get in Touch</h2>
           <p>We'd love to hear from you!</p>
         </div>
       </div>
     </div>
   </div>
   ```

### Adding New Blog Posts

#### Method 1: Using Makefile (Recommended)

1. **Create a new blog post with Makefile**:
   ```bash
   make new-post NAME=getting-started-with-qa
   ```

2. **Edit the generated file** to add your content:
   ```markdown
   # Getting Started with QA Testing

   Quality Assurance (QA) testing is a crucial part of software development...

   ## What is QA Testing?

   QA testing involves systematically evaluating software to ensure it meets...

   ## Types of Testing

   ### 1. Manual Testing
   Manual testing involves human testers executing test cases...

   ### 2. Automated Testing
   Automated testing uses scripts and tools to execute tests...

   ## Getting Started

   1. Learn the basics of software development
   2. Understand testing methodologies
   3. Practice with real projects
   4. Get certified
   ```

#### Method 2: Manual Creation

1. **Create a new post file** in the `_posts` directory:
   ```bash
   mkdir -p _posts
   touch _posts/2024-01-15-getting-started-with-qa.md
   ```

2. **Add front matter** with post metadata:
   ```yaml
   ---
   layout: post
   title: "Getting Started with QA Testing"
   date: 2024-01-15
   author: "QA Expert"
   categories: ["Testing", "Beginners"]
   tags: ["manual testing", "qa basics", "testing fundamentals"]
   excerpt: "Learn the fundamentals of QA testing and how to get started in this exciting field."
   image: "/assets/images/qa-basics.jpg"
   ---
   ```

3. **Write your post content**:
   ```markdown
   # Getting Started with QA Testing

   Quality Assurance (QA) testing is a crucial part of software development...

   ## What is QA Testing?

   QA testing involves systematically evaluating software to ensure it meets...

   ## Types of Testing

   ### 1. Manual Testing
   Manual testing involves human testers executing test cases...

   ### 2. Automated Testing
   Automated testing uses scripts and tools to execute tests...

   ## Getting Started

   1. Learn the basics of software development
   2. Understand testing methodologies
   3. Practice with real projects
   4. Get certified
   ```

### Adding New Courses

#### Method 1: Using Makefile (Recommended)

1. **Create a new course with Makefile**:
   ```bash
   make new-course NAME=automated-testing-course
   ```

2. **Edit the generated file** to add your content:
   ```markdown
   # Complete Automated Testing Course

   Master the art of automated testing with industry-leading tools and frameworks.

   ## Course Overview

   This comprehensive course covers everything you need to know about automated testing...

   ## What You'll Learn

   - **Selenium WebDriver**: Master browser automation
   - **Cypress**: Modern JavaScript testing framework
   - **Playwright**: Cross-browser testing automation
   - **Test Frameworks**: JUnit, TestNG, PyTest
   - **CI/CD Integration**: Jenkins, GitHub Actions
   - **Best Practices**: Page Object Model, Data-driven testing

   ## Course Highlights

   - 45+ video lessons
   - 8 hands-on projects
   - Real-world case studies
   - Community support
   - Certificate upon completion
   ```

#### Method 2: Manual Creation

1. **Create a new course file** in the `_courses` directory:
   ```bash
   touch _courses/automated-testing-course.md
   ```

2. **Add comprehensive front matter**:
   ```yaml
   ---
   layout: course
   title: "Complete Automated Testing Course"
   description: "Master automated testing with Selenium, Cypress, and Playwright"
   price: 199
   original_price: 299
   instructor: "John Doe"
   rating: 4.8
   students: 1250
   duration: "8 weeks"
   lessons: 45
   level: "Intermediate"
   category: "Automation"
   image: "/assets/images/automation-course.jpg"
   features:
     - "Hands-on projects"
     - "Real-world scenarios"
     - "Certificate of completion"
     - "Lifetime access"
     - "Community support"
   requirements:
     - "Basic programming knowledge"
     - "Understanding of manual testing"
     - "Computer with internet access"
   curriculum:
     - title: "Introduction to Automation"
       lessons: 5
       duration: "2 hours"
     - title: "Selenium WebDriver"
       lessons: 12
       duration: "6 hours"
     - title: "Cypress Framework"
       lessons: 10
       duration: "5 hours"
     - title: "Playwright Testing"
       lessons: 8
       duration: "4 hours"
     - title: "Advanced Concepts"
       lessons: 10
       duration: "6 hours"
   ---
   ```

3. **Add course content**:
   ```markdown
   # Complete Automated Testing Course

   Master the art of automated testing with industry-leading tools and frameworks.

   ## Course Overview

   This comprehensive course covers everything you need to know about automated testing...

   ## What You'll Learn

   - **Selenium WebDriver**: Master browser automation
   - **Cypress**: Modern JavaScript testing framework
   - **Playwright**: Cross-browser testing automation
   - **Test Frameworks**: JUnit, TestNG, PyTest
   - **CI/CD Integration**: Jenkins, GitHub Actions
   - **Best Practices**: Page Object Model, Data-driven testing

   ## Course Highlights

   - 45+ video lessons
   - 8 hands-on projects
   - Real-world case studies
   - Community support
   - Certificate upon completion
   ```

### Adding New Layouts

1. **Create a new layout file** in the `_layouts` directory:
   ```bash
   touch _layouts/page.html
   ```

2. **Define the layout structure**:
   ```html
   ---
   layout: default
   ---

   <div class="container mx-auto px-4 py-8">
     <div class="max-w-4xl mx-auto">
       <header class="mb-8">
         <h1 class="text-4xl font-bold text-gray-900 mb-4">{{ page.title }}</h1>
         {% if page.description %}
         <p class="text-xl text-gray-600">{{ page.description }}</p>
         {% endif %}
       </header>

       <main class="prose prose-lg max-w-none">
         {{ content }}
       </main>
     </div>
   </div>
   ```

### Adding New Components

1. **Create a new include file** in the `_includes` directory:
   ```bash
   touch _includes/testimonial.html
   ```

2. **Define the component**:
   ```html
   <div class="testimonial bg-white rounded-lg shadow-md p-6">
     <div class="flex items-center mb-4">
       <img src="{{ include.avatar }}" alt="{{ include.name }}" class="w-12 h-12 rounded-full mr-4">
       <div>
         <h3 class="font-semibold text-gray-900">{{ include.name }}</h3>
         <p class="text-gray-600">{{ include.title }}</p>
       </div>
     </div>
     <blockquote class="text-gray-700 italic">
       "{{ include.quote }}"
     </blockquote>
   </div>
   ```

3. **Use the component** in your pages:
   ```html
   {% include testimonial.html 
      name="Sarah Johnson" 
      title="QA Engineer at TechCorp" 
      avatar="/assets/images/sarah.jpg" 
      quote="This course completely changed my career path. Highly recommended!" %}
   ```

## 🎨 Customizing the Design

### Changing Colors

Edit `assets/css/main.css` and modify the CSS custom properties:

```css
:root {
  --color-primary-50: #faf5ff;
  --color-primary-500: #8b5cf6;  /* Change this for main purple */
  --color-primary-900: #4c1d95;
  /* ... other colors */
}
```

### Adding New Components

1. **Create component styles** in `assets/css/main.css`:
   ```css
   /* Testimonial Component */
   .testimonial {
     background: var(--color-white);
     border-radius: var(--border-radius-lg);
     box-shadow: var(--shadow-md);
     padding: var(--spacing-6);
   }
   ```

2. **Add JavaScript functionality** in `assets/js/main.js`:
   ```javascript
   // Testimonial carousel
   function initTestimonialCarousel() {
     const testimonials = document.querySelectorAll('.testimonial');
     // Add carousel logic here
   }
   ```

## 📁 Project Structure

```
qastudy.online/
├── _config.yml              # Jekyll configuration
├── _layouts/                # Page templates
│   ├── default.html         # Base layout
│   ├── home.html           # Homepage layout
│   ├── course.html         # Course page layout
│   └── post.html           # Blog post layout
├── _includes/               # Reusable components
│   ├── navbar.html         # Navigation bar
│   ├── hero.html           # Hero section
│   └── footer.html         # Footer
├── _courses/                # Course collection
│   └── manual-testing-bootcamp.md
├── _posts/                  # Blog posts (create this directory)
├── assets/
│   ├── css/
│   │   └── main.css        # Complete design system CSS
│   ├── js/
│   │   └── main.js         # Interactive functionality
│   └── images/             # Images (create this directory)
├── index.html              # Static HTML demo
├── index.md                # Jekyll homepage
├── Gemfile                 # Dependencies
├── Makefile                # Development automation
├── README.md              # This file
└── QUICK_START.md         # Quick reference guide
```

## 🛠️ Development Workflow

### Making Changes

1. **Edit files** in your preferred editor
2. **Save changes** - Jekyll will automatically rebuild
3. **Refresh browser** to see changes
4. **Check console** for any build errors

### Common Commands

#### Using Makefile (Recommended)

```bash
# Start development server
make dev

# Build for production
make build

# Build with drafts
make dev-drafts

# Build with future posts
make dev-future

# Clean and rebuild
make restart

# Check project status
make status

# Show project info
make info
```

#### Manual Commands

```bash
# Start development server
bundle exec jekyll serve

# Build for production
bundle exec jekyll build

# Build with drafts
bundle exec jekyll serve --drafts

# Build with future posts
bundle exec jekyll serve --future

# Clean and rebuild
bundle exec jekyll clean && bundle exec jekyll serve
```

### Troubleshooting

**Jekyll won't start:**
```bash
# Check Ruby version
ruby --version

# Reinstall dependencies
bundle install

# Clear Jekyll cache
bundle exec jekyll clean
```

**Sass compilation errors:**
- Use the static `index.html` file as a fallback
- Check that all CSS is properly formatted in `assets/css/main.css`

**Page not updating:**
- Clear browser cache
- Restart Jekyll server
- Check file permissions

## 🚀 Deployment

### GitHub Pages

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Enable GitHub Pages** in repository settings
3. **Select source branch** (usually `main`)
4. **Wait for deployment** (usually 5-10 minutes)

### Netlify

1. **Connect repository** to Netlify
2. **Set build command**: `bundle exec jekyll build`
3. **Set publish directory**: `_site`
4. **Deploy automatically** on push

### Vercel

1. **Import repository** to Vercel
2. **Set framework preset** to "Other"
3. **Set build command**: `bundle exec jekyll build`
4. **Set output directory**: `_site`

## 📚 Dependencies

- **Jekyll** (~> 4.2.0) - Static site generator
- **jekyll-feed** - RSS feed generation
- **jekyll-sitemap** - XML sitemap generation
- **jekyll-seo-tag** - SEO optimization
- **tzinfo** - Timezone handling
- **http_parser.rb** - HTTP parsing

## 🧪 Testing

### Manual Testing

1. **Test responsive design** on different screen sizes
2. **Verify all links** work correctly
3. **Check form functionality** (if any)
4. **Test navigation** on mobile devices
5. **Validate HTML** using browser dev tools

### Browser Testing

Test in multiple browsers:
- Chrome
- Firefox
- Safari
- Edge

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**
3. **Make your changes**
4. **Test thoroughly**
5. **Submit a pull request**

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For issues and questions:
- Check the troubleshooting section above
- Review Jekyll documentation
- Create an issue in the repository

---

**Happy coding! 🎉** 