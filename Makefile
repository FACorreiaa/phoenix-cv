.PHONY: help push deploy push-deploy setup

# Default target
help:
	@echo "Available commands:"
	@echo "  make push         - Add, commit, and push changes to git"
	@echo "  make deploy       - Deploy to Fly.io"
	@echo "  make push-deploy  - Push to git and deploy to Fly.io"
	@echo "  make setup        - Initial setup (install deps, create DB, etc.)"
	@echo "  make dev          - Start development server"

# Push changes to git
push:
	@echo "📝 Staging all changes..."
	git add .
	@echo "💬 Creating commit..."
	@read -p "Enter commit message: " msg; \
	git commit -m "$$msg"
	@echo "🚀 Pushing to remote repository..."
	git push
	@echo "✅ Successfully pushed to git!"

# Deploy to Fly.io
deploy:
	@echo "🚀 Deploying to Fly.io..."
	flyctl deploy
	@echo "✅ Successfully deployed to Fly.io!"

# Push to git and deploy to Fly.io
push-deploy: push deploy
	@echo "✅ All done! Changes pushed and deployed."

# Initial setup
setup:
	@echo "📦 Installing dependencies..."
	mix deps.get
	@echo "🎨 Setting up assets..."
	mix assets.setup
	@echo "🏗️  Building assets..."
	mix assets.build
	@echo "✅ Setup complete!"

# Start development server
dev:
	@echo "🔥 Starting Phoenix development server..."
	mix phx.server

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	mix clean
	rm -rf _build
	rm -rf deps
	@echo "✅ Clean complete!"

# Run tests
test:
	@echo "🧪 Running tests..."
	mix test

# Format code
format:
	@echo "✨ Formatting code..."
	mix format

# Check for security issues
audit:
	@echo "🔒 Checking for security issues..."
	mix deps.audit

# Full CI pipeline
ci: format test
	@echo "✅ CI checks passed!"
