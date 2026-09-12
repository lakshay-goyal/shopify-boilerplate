# Git rules

1. One SPEC → one branch → one worktree: `feat/<id>-<slug>`
   (e.g. `feat/003-home-hero`). Worktrees live OUTSIDE the repo:
   `../<repo>-<id>-<slug>`.
2. One SPEC per commit. Message via `commit-message` skill:
   `feat(SPEC-001): short merchant-visible description`.
3. Never commit across SPECs in one commit. Never mix unrelated files.
4. Base branch merges only after `review-execution` = APPROVE + `test-review`
   green on the merge result.
5. Merge conflicts in product behavior → stop, ask human (approval boundary).
   Mechanical conflicts → resolve, re-verify fully, note in review.
6. Clean up worktrees after merge (`git worktree remove`), prune stale
   branches. Never leave the repo with unrecorded dirty state.
