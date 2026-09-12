# context/ — product brain (not a second codebase)

Why the product exists, what it should do, what was decided, and what the
client needs to understand — before and during development. The Shopify
theme at the repo root is the implementation; this directory is the truth
about intent.

## Map

- `RFC/` — proposed changes. Answers: *should we build this?*
- `SPEC/` — exact build instructions. Answers: *what exactly, and how will
  we know it's done?*
- `TDD/` — test cases written BEFORE code (Given/When/Then + verify method).
- `FEATURES/` — product inventory: `feature-list.json` (machine) +
  `feature-list.md` (human). Hard scope boundary for agents.
- `INSIGHTS/` — non-technical per-feature history for the client (`.html`).
- `EXCALIDRAW/` — visual flows: `user-flows/`, `workflows/`, `architecture/`.
- `DECISIONS/` — durable choices (ADR-style, client-readable).
- `DATA/` — mock/seed/sanitized store data only. NEVER secrets or real PII.
- `ABOUT/` — store content source of truth (home, about, contact, policies, FAQ).
- `RESEARCH/` — competitors, Shopify capabilities, customer research.
- `GLOSSARY/` — shared vocabulary (variant, metafield, collection, …).
- `CHANGELOG/` — product-oriented change history.
- `HANDOFF/` — the client's book: overview, customization guide, limits, roadmap.

## Traceability

Every feature owns a Context ID (`FEAT-001`). Its RFC, SPECs, TDDs,
decisions, diagrams, and insight all reference it, so one feature's full
lifecycle is traceable. Pipeline: `RFC → SPEC → TDD → code → INSIGHTS`.

## Rules for agents

- Read `FEATURES/feature-list.json` before planning; never invent scope.
- Never treat `.agent/state/progress.md` as requirements — it records
  *where work stands*, these files record *what the product should be*.
