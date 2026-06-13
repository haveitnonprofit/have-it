#!/bin/sh

branch="$(git rev-parse --abbrev-ref HEAD)"

# Allow main branch
if [ "$branch" = "main" ]; then
  exit 0
fi

# Validate branch name matches conventions
case "$branch" in
  feat/*|fix/*|docs/*|refactor/*|chore/*)
    exit 0
    ;;
  *)
    echo ""
    echo "  ⚠️  Branch name \"$branch\" doesn't follow conventions."
    echo "     Allowed: feat/* | fix/* | docs/* | refactor/* | chore/*"
    echo ""
    ;;
esac
