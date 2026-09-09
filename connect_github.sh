#!/usr/bin/env bash
set -e

echo "=== QuickBite Technologies // GitHub Connection Utility ==="

if ! gh auth status &>/dev/null; then
  echo "GitHub CLI is not yet authenticated."
  echo "Launching interactive web login..."
  gh auth login --web -h github.com -p https --skip-ssh-key
fi

echo "Authenticated as:"
gh auth status

REPO_NAME="${1:-quickbite-executive-portals}"

echo "Checking remote 'origin'..."
if git remote | grep -q "^origin$"; then
  echo "Remote 'origin' already exists: $(git remote get-url origin)"
else
  echo "Creating remote repository on GitHub: $REPO_NAME"
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push || {
    echo "If repo already exists, linking remote manually..."
    USER=$(gh api user -q .login)
    git remote add origin "https://github.com/$USER/$REPO_NAME.git"
    git push -u origin main
  }
fi

echo "Pushing main branch to origin..."
git push -u origin main

echo "=== Deployment Workflow Initiated ==="
echo "Visit GitHub repository Actions tab to watch the automated Flutter Web build and Pages deployment."
