# QA Study Online - Jekyll Makefile
# Usage: make <target>

# Variables
JEKYLL := bundle exec jekyll
SERVE_PORT := 4000
SITE_URL := http://localhost:$(SERVE_PORT)

# Colors for output
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
NC := \033[0m # No Color

# Default target
.DEFAULT_GOAL := help

# Help target
.PHONY: help
help: ## Show this help message
	@echo "$(BLUE)QA Study Online - Jekyll Development Commands$(NC)"
	@echo ""
	@echo "$(YELLOW)Available commands:$(NC)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(GREEN)%-20s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(YELLOW)Examples:$(NC)"
	@echo "  make setup     # First time setup"
	@echo "  make dev       # Start development server"
	@echo "  make build     # Build for production"
	@echo "  make clean     # Clean build files"

# Setup and installation
.PHONY: setup
setup: ## First time setup - install dependencies
	@echo "$(BLUE)Setting up QA Study Online...$(NC)"
	@echo "$(YELLOW)Checking Ruby version...$(NC)"
	@ruby --version || (echo "$(RED)Ruby not found. Please install Ruby 2.6+$(NC)" && exit 1)
	@echo "$(YELLOW)Installing Bundler...$(NC)"
	@gem install bundler || echo "$(YELLOW)Bundler already installed$(NC)"
	@echo "$(YELLOW)Installing dependencies...$(NC)"
	@bundle install
	@echo "$(GREEN)Setup complete! Run 'make dev' to start development server$(NC)"

.PHONY: install
install: setup ## Alias for setup

# Development
.PHONY: dev
dev: ## Start development server
	@echo "$(BLUE)Starting Jekyll development server...$(NC)"
	@echo "$(YELLOW)Site will be available at: $(SITE_URL)$(NC)"
	@echo "$(YELLOW)Press Ctrl+C to stop$(NC)"
	@$(JEKYLL) serve --livereload --port $(SERVE_PORT)

.PHONY: serve
serve: dev ## Alias for dev

.PHONY: dev-drafts
dev-drafts: ## Start development server with drafts
	@echo "$(BLUE)Starting Jekyll development server with drafts...$(NC)"
	@$(JEKYLL) serve --livereload --drafts --port $(SERVE_PORT)

.PHONY: dev-future
dev-future: ## Start development server with future posts
	@echo "$(BLUE)Starting Jekyll development server with future posts...$(NC)"
	@$(JEKYLL) serve --livereload --future --port $(SERVE_PORT)

# Building
.PHONY: build
build: ## Build site for production
	@echo "$(BLUE)Building site for production...$(NC)"
	@$(JEKYLL) build
	@echo "$(GREEN)Build complete! Site is in _site/ directory$(NC)"

.PHONY: build-drafts
build-drafts: ## Build site with drafts
	@echo "$(BLUE)Building site with drafts...$(NC)"
	@$(JEKYLL) build --drafts

.PHONY: build-future
build-future: ## Build site with future posts
	@echo "$(BLUE)Building site with future posts...$(NC)"
	@$(JEKYLL) build --future

# Cleaning
.PHONY: clean
clean: ## Clean build files and cache
	@echo "$(BLUE)Cleaning build files and cache...$(NC)"
	@$(JEKYLL) clean
	@rm -rf .jekyll-cache .sass-cache
	@echo "$(GREEN)Clean complete!$(NC)"

.PHONY: clean-all
clean-all: ## Clean everything including node_modules and vendor
	@echo "$(BLUE)Cleaning everything...$(NC)"
	@$(JEKYLL) clean
	@rm -rf .jekyll-cache .sass-cache node_modules vendor
	@echo "$(GREEN)Complete clean finished!$(NC)"

# Static demo
.PHONY: demo
demo: ## Open static HTML demo
	@echo "$(BLUE)Opening static HTML demo...$(NC)"
	@open index.html || xdg-open index.html || echo "$(YELLOW)Please open index.html manually$(NC)"

# Content management
.PHONY: new-page
new-page: ## Create a new page (usage: make new-page NAME=about)
	@if [ -z "$(NAME)" ]; then \
		echo "$(RED)Error: Please specify a page name$(NC)"; \
		echo "$(YELLOW)Usage: make new-page NAME=page-name$(NC)"; \
		exit 1; \
	fi
	@echo "$(BLUE)Creating new page: $(NAME).md$(NC)"
	@touch $(NAME).md
	@echo "---" > $(NAME).md
	@echo "layout: default" >> $(NAME).md
	@echo "title: \"$(shell echo $(NAME) | sed 's/-/ /g' | sed 's/\b\w/\U&/g')\"" >> $(NAME).md
	@echo "description: \"Description for $(NAME) page\"" >> $(NAME).md
	@echo "---" >> $(NAME).md
	@echo "" >> $(NAME).md
	@echo "# $(shell echo $(NAME) | sed 's/-/ /g' | sed 's/\b\w/\U&/g')" >> $(NAME).md
	@echo "" >> $(NAME).md
	@echo "Content goes here..." >> $(NAME).md
	@echo "$(GREEN)Page $(NAME).md created!$(NC)"

.PHONY: new-post
new-post: ## Create a new blog post (usage: make new-post NAME=my-post)
	@if [ -z "$(NAME)" ]; then \
		echo "$(RED)Error: Please specify a post name$(NC)"; \
		echo "$(YELLOW)Usage: make new-post NAME=post-name$(NC)"; \
		exit 1; \
	fi
	@mkdir -p _posts
	@echo "$(BLUE)Creating new blog post: $(NAME).md$(NC)"
	@DATE=$$(date +%Y-%m-%d); \
	FILE="_posts/$$DATE-$(NAME).md"; \
	touch $$FILE; \
	echo "---" > $$FILE; \
	echo "layout: post" >> $$FILE; \
	echo "title: \"$(shell echo $(NAME) | sed 's/-/ /g' | sed 's/\b\w/\U&/g')\"" >> $$FILE; \
	echo "date: $$DATE" >> $$FILE; \
	echo "author: \"Your Name\"" >> $$FILE; \
	echo "categories: [\"Category\"]" >> $$FILE; \
	echo "tags: [\"tag1\", \"tag2\"]" >> $$FILE; \
	echo "excerpt: \"Post excerpt goes here...\"" >> $$FILE; \
	echo "---" >> $$FILE; \
	echo "" >> $$FILE; \
	echo "# $(shell echo $(NAME) | sed 's/-/ /g' | sed 's/\b\w/\U&/g')" >> $$FILE; \
	echo "" >> $$FILE; \
	echo "Post content goes here..." >> $$FILE; \
	echo "$(GREEN)Post $$FILE created!$(NC)"

.PHONY: new-course
new-course: ## Create a new course (usage: make new-course NAME=my-course)
	@if [ -z "$(NAME)" ]; then \
		echo "$(RED)Error: Please specify a course name$(NC)"; \
		echo "$(YELLOW)Usage: make new-course NAME=course-name$(NC)"; \
		exit 1; \
	fi
	@echo "$(BLUE)Creating new course: $(NAME).md$(NC)"
	@FILE="_courses/$(NAME).md"; \
	touch $$FILE; \
	echo "---" > $$FILE; \
	echo "layout: course" >> $$FILE; \
	echo "title: \"$(shell echo $(NAME) | sed 's/-/ /g' | sed 's/\b\w/\U&/g')\"" >> $$FILE; \
	echo "description: \"Course description goes here\"" >> $$FILE; \
	echo "price: 99" >> $$FILE; \
	echo "original_price: 199" >> $$FILE; \
	echo "instructor: \"Instructor Name\"" >> $$FILE; \
	echo "rating: 4.8" >> $$FILE; \
	echo "students: 0" >> $$FILE; \
	echo "duration: \"8 weeks\"" >> $$FILE; \
	echo "lessons: 20" >> $$FILE; \
	echo "level: \"Beginner\"" >> $$FILE; \
	echo "category: \"Testing\"" >> $$FILE; \
	echo "image: \"/assets/images/$(NAME).jpg\"" >> $$FILE; \
	echo "features:" >> $$FILE; \
	echo "  - \"Feature 1\"" >> $$FILE; \
	echo "  - \"Feature 2\"" >> $$FILE; \
	echo "requirements:" >> $$FILE; \
	echo "  - \"Requirement 1\"" >> $$FILE; \
	echo "  - \"Requirement 2\"" >> $$FILE; \
	echo "curriculum:" >> $$FILE; \
	echo "  - title: \"Module 1\"" >> $$FILE; \
	echo "    lessons: 5" >> $$FILE; \
	echo "    duration: \"2 hours\"" >> $$FILE; \
	echo "---" >> $$FILE; \
	echo "" >> $$FILE; \
	echo "# $(shell echo $(NAME) | sed 's/-/ /g' | sed 's/\b\w/\U&/g')" >> $$FILE; \
	echo "" >> $$FILE; \
	echo "Course content goes here..." >> $$FILE; \
	echo "$(GREEN)Course $$FILE created!$(NC)"

# Testing and validation
.PHONY: check
check: ## Check site configuration and dependencies
	@echo "$(BLUE)Checking site configuration...$(NC)"
	@ruby --version || (echo "$(RED)Ruby not found$(NC)" && exit 1)
	@bundle --version || (echo "$(RED)Bundler not found$(NC)" && exit 1)
	@echo "$(GREEN)All dependencies OK$(NC)"

.PHONY: validate
validate: build ## Build and validate site
	@echo "$(BLUE)Validating site build...$(NC)"
	@if [ -d "_site" ]; then \
		echo "$(GREEN)Site built successfully$(NC)"; \
		echo "$(YELLOW)Site size: $$(du -sh _site | cut -f1)$(NC)"; \
	else \
		echo "$(RED)Build failed$(NC)"; \
		exit 1; \
	fi

# Deployment helpers
.PHONY: deploy-prep
deploy-prep: clean build ## Prepare for deployment
	@echo "$(BLUE)Preparing for deployment...$(NC)"
	@echo "$(GREEN)Site ready for deployment!$(NC)"

.PHONY: git-deploy
git-deploy: ## Deploy to Git repository
	@echo "$(BLUE)Deploying to Git...$(NC)"
	@git add .
	@git commit -m "Deploy site updates" || echo "$(YELLOW)No changes to commit$(NC)"
	@git push origin main || echo "$(YELLOW)No remote repository configured$(NC)"
	@echo "$(GREEN)Git deployment complete!$(NC)"

# Utility commands
.PHONY: info
info: ## Show project information
	@echo "$(BLUE)QA Study Online - Project Information$(NC)"
	@echo "$(YELLOW)Ruby version:$(NC) $$(ruby --version)"
	@echo "$(YELLOW)Bundler version:$(NC) $$(bundle --version)"
	@echo "$(YELLOW)Jekyll version:$(NC) $$(bundle exec jekyll --version)"
	@echo "$(YELLOW)Site URL:$(NC) $(SITE_URL)"
	@echo "$(YELLOW)Build directory:$(NC) _site/"

.PHONY: status
status: ## Show current development status
	@echo "$(BLUE)Development Status$(NC)"
	@if pgrep -f "jekyll serve" > /dev/null; then \
		echo "$(GREEN)✓ Jekyll server is running$(NC)"; \
	else \
		echo "$(RED)✗ Jekyll server is not running$(NC)"; \
	fi
	@if [ -d "_site" ]; then \
		echo "$(GREEN)✓ Site has been built$(NC)"; \
	else \
		echo "$(YELLOW)⚠ Site has not been built$(NC)"; \
	fi

# Development shortcuts
.PHONY: restart
restart: clean dev ## Clean and restart development server

.PHONY: rebuild
rebuild: clean build ## Clean and rebuild site

.PHONY: quick-dev
quick-dev: ## Quick development start (no livereload)
	@echo "$(BLUE)Starting quick development server...$(NC)"
	@$(JEKYLL) serve --port $(SERVE_PORT)

# Documentation
.PHONY: docs
docs: ## Open documentation
	@echo "$(BLUE)Opening documentation...$(NC)"
	@open README.md || xdg-open README.md || echo "$(YELLOW)Please open README.md manually$(NC)"

.PHONY: quick-start
quick-start: ## Open quick start guide
	@echo "$(BLUE)Opening quick start guide...$(NC)"
	@open QUICK_START.md || xdg-open QUICK_START.md || echo "$(YELLOW)Please open QUICK_START.md manually$(NC)"

# Cleanup
.PHONY: reset
reset: clean-all setup ## Reset everything and reinstall

# Default development workflow
.PHONY: start
start: check dev ## Check dependencies and start development server

# Production workflow
.PHONY: production
production: clean build validate ## Full production build and validation

# Show help by default
.PHONY: all
all: help ## Show all available commands 