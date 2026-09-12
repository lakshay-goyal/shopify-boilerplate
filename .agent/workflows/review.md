# Workflow: review

1. `review-execution` on each worktree/branch → verdict
   APPROVE / CHANGES-REQUESTED + findings with file:line.
2. Findings loop back to the executor worktree (never fix by piling new
   scope — one SPEC stays one SPEC).
3. `shopify-theme-review` must be clean before merge eligibility.
4. Merge in dependency order; `test-review` after every merge.
5. After all merges: full `test-review` on base → final validation gate
   for handoff/insight generation.
