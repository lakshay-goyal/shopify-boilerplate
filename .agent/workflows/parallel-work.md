# Workflow: parallel work (one SPEC per worktree)

Goal: homepage, about, contact, … each implemented in isolation, in parallel.

## Mapping

- Each SPEC gets its own Context ID, branch, and worktree:
  `SPEC-003-home-hero` → branch `feat/003-home-hero` → `../<repo>-003-home-hero`.
- Batches run in parallel only if dependency-free. Shared foundations
  (layout, tokens, snippets, locale scaffolding) land FIRST on base, then
  page worktrees rebase onto them.

## Procedure

1. From `progress.md` execution plan, list SPECs with `depends_on` from
   `FEATURES/feature-list.json`.
2. Launch one executor per independent SPEC (separate agent/session per
   worktree — never two agents in one directory).
3. Each executor follows `worktree-executor` + `implementation.md` and
   reports back: files changed, verification output, open questions.
4. Coordinator merges in dependency order, running `test-review` on each
   merge result before the next merge.
5. Conflict involving product behavior → stop, human decides.

## Anti-rules

- No shared-file edits across parallel SPECs (split the SPECs first).
- No "quick fix in another SPEC's worktree". Ever.
- No merge on red review or red verification.
