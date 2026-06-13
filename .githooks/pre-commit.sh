#!/bin/sh

branch="$(git rev-parse --abbrev-ref HEAD)"

# Allow main branch
if [ "$branch" = "main" ]; then
  exit 0
fi

# Block commit if branch name doesn't follow conventions
case "$branch" in
  feat/*|fix/*|docs/*|refactor/*|chore/*)
    exit 0
    ;;
  *)
    echo ""
    echo "  ❌ Cannot commit on branch \"$branch\"."
    echo "     Branch name doesn't follow conventions."
    echo "     Allowed: feat/* | fix/* | docs/* | refactor/* | chore/*"
    echo "     Example: chore/branch-naming-enforcement"
    echo ""
    exit 1
    ;;
esac
