# Workflow: initialization (Phase 2 — plan everything, build nothing)

Run when the human says "initialize" (or "run initialization") AFTER
answering `context/BRAINSTORM/<id>-<slug>/Q&A.md`. Consumes the
brainstorm + answers and produces the full build plan: RFC, SPECs, TDD
test-case lists, Excalidraw diagrams, client-shareable insight, and the
execution plan. Writes zero product code, creates zero worktrees,
executes zero tests.

## Preconditions

- Brainstorm folder exists; `brainstorm.md` status `answered`;
  `Q&A.md` has zero `Pending` (every question Answered or Deferred).
  If not → stop, point at the pending questions. Never guess answers.

## Procedure

1. Read `brainstorm.md` + answered `Q&A.md` + linked
   `context/RESEARCH/` notes fully. Restate the niche, audience, and
   theme posture in your own words. Ambiguity → stop, ask.
2. `rfc-generator` with the brainstorm as source → draft RFC
   (`context/RFC/<id>-<slug>.md`, status `proposed`) → run
   `ecommerce-check` on the draft → present scope + open questions.
   Agent never self-accepts: wait for the human to accept the RFC.
3. On acceptance: `spec-generator` on the RFC → SPECs
   (`context/SPEC/`, one SPEC = one future worktree, `depends_on`
   encoded, shared foundations first) + `FEATURES/` entries
   (status `specified`).
4. `tdd-generator` per SPEC → TDD files (`context/TDD/`, all TCs
   `Pending`). This LISTS the test cases to be executed later —
   do NOT execute them, do NOT write test code here.
5. `diagram-generator`: user-flows + workflows + architecture scenes
   in `context/EXCALIDRAW/` for the key flows (shopper journey,
   merchandising, execution order). Verify JSON parses; back-link
   from RFC/SPECs.
6. Client insight draft: per-feature `context/INSIGHTS/<slug>.html`
   from `.agent/templates/insight.html` (non-technical, no jargon) —
   what will be built, what it costs the client in decisions, what
   confirmation is needed. This is shareable with the client.
7. Execution plan in `.agent/state/progress.md`: SPEC → worktree/branch
   mapping, dependency order, parallel batches (see
   `.agent/workflows/parallel-work.md`), verification + review gates.
8. Present the Phase 2 pack for owner confirmation: RFC scope, SPEC
   list + order, TDD case counts (titles only), diagram list, insight
   draft, anything still needing the owner's call. STOP. Explicitly
   tell the human: confirm, then run Phase 3 (`implement`).

## Anti-rules

- No worktrees, no branches, no product-code edits, no test execution.
- No new scope invented beyond brainstorm + Q&A answers — gaps become
  RFC Open Questions, never silent requirements.
- Phase 2 is not done until the human confirms the pack.
