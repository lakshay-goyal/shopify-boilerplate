#!/bin/bash
# Create an isolated worktree + branch for one SPEC.
# Usage: new-worktree.sh <id> <slug> [base]
# Example: new-worktree.sh 003 home-hero
set -euo pipefail
ID="${1:?usage: new-worktree.sh <id> <slug> [base]}"
SLUG="${2:?usage: new-worktree.sh <id> <slug> [base]}"
BASE="${3:-master}"
REPO_NAME="$(basename "$(git rev-parse --show-toplevel)")"
WORKTREE="../${REPO_NAME}-${ID}-${SLUG}"
git fetch origin "$BASE" 2>/dev/null || true
git worktree add -b "feat/${ID}-${SLUG}" "$WORKTREE" "$BASE"
echo "Worktree ready: $WORKTREE (branch feat/${ID}-${SLUG} from $BASE)"
