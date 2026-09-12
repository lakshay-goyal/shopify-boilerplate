# Workflow: brainstorm (Phase 1 — idea only)

Run when the human says `/brainstorming` (or "brainstorm") with company
details. Produces direction + questions. Writes zero RFC/SPEC/TDD/code.

1. Take the company brief (pasted or file path). If too thin, ask up to
   5 targeted questions (niche, products, audience, brand assets, goals).
2. Load skill `brainstorming` with `source` + next `id`:
   company analysis → competitor/customer/platform research →
   theme-posture recommendation (restrained vs expressive, motion,
   patterns, references) → write
   `context/BRAINSTORM/<id>-<slug>/brainstorm.md` +
   `context/BRAINSTORM/<id>-<slug>/Q&A.md`.
3. Present the direction + question count. STOP. Explicitly tell the
   human: answer the Q&A file, then run Phase 2 (`initialization`).

## Anti-rules

- No RFC, SPEC, TDD, worktree, or product code in Phase 1. Ever.
- No invented company/competitor facts — source or UNVERIFIED.
- References inspire posture only, never copy or content.
