# Workflow: implement (Phase 3 — execute the confirmed plan)

Run when the human says "implement" AFTER confirming the Phase 2 pack.
Executes every SPEC contra the plan: TDD-first parallel worktrees,
verification, per-SPEC commits, ordered merges, then an unbiased
full-codebase review, insights, and progress.

## Preconditions

- RFC accepted, SPECs specified, TDDs written (all TCs `Pending`),
  execution plan in `.agent/state/progress.md`, base branch clean.
  If not → stop, name the missing artifact. Never invent scope.

## Procedure

1. Foundations first: implement `depends_on: []` SPECs (tokens, layout,
   shared snippets, locale scaffolding) on base, verify + review +
   merge before any page worktree starts. Page worktrees rebase onto them.
2. TDD first, per worktree: launch one `worktree-executor` per
   dependency-free SPEC (parallel only — never two agents in one
   directory). Each executor: reads SPEC + TDD, records baseline TC
   states, THEN implements (SPEC-scoped files + its locale keys only),
   runs verification per `.agent/verification/commands.md`, marks TDD
   TCs Passing/Failing with evidence, reports back. No merge by executors.
3. Review each worktree: `review-execution` → APPROVE / CHANGES-REQUESTED
   (re-executed verification, file:line findings) + `shopify-theme-review`
   must read CUSTOMIZABLE. Findings loop back to the owning worktree —
   never pile fixes across SPECs.
4. Merge in dependency order: per SPEC, `commit-message` skill output
   (one SPEC per commit), merge, then `test-review` on the merge result
   before the next merge. Mechanical conflicts → resolve + re-verify;
   behavior conflicts → stop, human decides. Clean up worktrees
   (`git worktree remove`), prune stale branches.
5. Final validation: full `test-review` on base (JSON validity, theme
   check, locale audit, TDD rollup, theme-review, clean status).
6. Unbiased full-codebase review: spawn FRESH sub-agents with NO prior
   involvement in the implementation (state this in their prompt with
   the niche + benchmark context, but no authorship). They re-verify
   e-commerce authenticity (`.agent/rules/ecommerce-ui.md` §1), pixel
   discipline, content rules, and niche fit — file:line evidence,
   UNVERIFIED labels where unproven. Their findings are merge-blocking
   majors until fixed or explicitly waived by the human.
7. Close out: final per-feature `context/INSIGHTS/*.html` (non-technical),
   `CHANGELOG/` entry, `FEATURES/` statuses → completed, decisions in
   `context/DECISIONS/`, `.agent/state/progress.md` updated (status,
   verification, remaining work, next action). Report: what shipped,
   verification outputs, review verdicts, insights, open questions.

## Anti-rules

- No shared-file edits across parallel SPECs; no "quick fix in another
  SPEC's worktree"; no merge on red review or red verification.
- Reviewers never write code; executors never merge.
- Never delete or weaken a test/check to make verification pass.
