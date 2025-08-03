# Quick Start Guide

## 🚀 Running Locally

### Prerequisites Check
```bash
ruby --version    # Should be 2.6+
gem --version     # Should be installed
bundle --version  # Install with: gem install bundler
```

### Start Development Server
```bash
# Install dependencies (first time only)
bundle install

# Start local server
bundle exec jekyll serve

# Access at: http://localhost:4000
```

### Alternative: Static Demo
```bash
# If Jekyll has issues, use the static demo
open index.html
```

## 📝 Adding Content

### New Page
```bash
# Create new page
touch about.md

# Add front matter
---
layout: default
title: "About Us"
description: "Learn about our platform"
---
```

### New Blog Post
```bash
# Create posts directory
mkdir -p _posts

# Create new post
touch _posts/2024-01-15-my-post.md

# Add front matter
---
layout: post
title: "My Post Title"
date: 2024-01-15
author: "Your Name"
categories: ["Category"]
tags: ["tag1", "tag2"]
---
```

### New Course
```bash
# Create new course
touch _courses/my-course.md

# Add front matter
---
layout: course
title: "Course Title"
description: "Course description"
price: 99
instructor: "Instructor Name"
rating: 4.8
duration: "8 weeks"
level: "Beginner"
---
```

## 🛠️ Common Commands

```bash
# Start development server
bundle exec jekyll serve

# Build for production
bundle exec jekyll build

# Clean and rebuild
bundle exec jekyll clean && bundle exec jekyll serve

# Serve with drafts
bundle exec jekyll serve --drafts

# Serve with future posts
bundle exec jekyll serve --future
```

## 🔧 Troubleshooting

### Jekyll Won't Start
```bash
# Check Ruby version
ruby --version

# Reinstall dependencies
bundle install

# Clear cache
bundle exec jekyll clean
```

### Page Not Updating
- Clear browser cache
- Restart Jekyll server
- Check file permissions

### Sass Errors
- Use `index.html` static demo as fallback
- Check CSS syntax in `assets/css/main.css`

## 📁 File Structure

```
qastudy.online/
├── _config.yml          # Site configuration
├── _layouts/            # Page templates
├── _includes/           # Reusable components
├── _courses/            # Course files
├── _posts/              # Blog posts
├── assets/
│   ├── css/main.css     # Styles
│   └── js/main.js       # JavaScript
├── index.md             # Homepage
└── index.html           # Static demo
```

## 🎨 Quick Customization

### Change Colors
Edit `assets/css/main.css`:
```css
:root {
  --color-primary-500: #your-color;  /* Main purple */
}
```

### Add New Component
1. Create HTML in `_includes/`
2. Add CSS to `assets/css/main.css`
3. Add JS to `assets/js/main.js`

## 📱 Testing

```bash
# Test responsive design
# Open browser dev tools and resize window

# Test mobile
# Use browser dev tools mobile view
```

## 🚀 Deployment

### GitHub Pages
```bash
git add .
git commit -m "Update site"
git push origin main
# Enable GitHub Pages in repo settings
```

### Netlify/Vercel
- Connect repository
- Build command: `bundle exec jekyll build`
- Publish directory: `_site`

---

**Need help?** Check the full README.md for detailed documentation! 