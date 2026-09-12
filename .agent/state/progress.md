# Project progress (agent-optimized — under a minute to absorb)

## Current objective

Harness + quality bar encoded: `.agent/` carries hard e-commerce/UI
constraints, `context/` carries niche-adaptive guidance (owner's two
screenshot teardowns are illustrative examples only, not build targets).
Awaiting first real client RFC. No product code changed, ever.

## Current feature / task

None active — awaiting first client RFC. (A premature FEAT-001 with
RFC/SPEC/TDD was drafted from the illustrative examples and has been
fully removed per owner order.)

## Status

in-progress

## Completed

- `.agent/` harness: README, AGENT.md, 4 instructions, 5 rules, 6 workflows,
  10 skills, 5 role cards, 7 templates, verification docs, 2 scripts, 3 docs
- `context/` skeleton: all 14 sections with READMEs + starter files
- AGENTS.md adapter header (CLAUDE.md / copilot-instructions.md inherit via symlink)
- 5-agent unbiased audit (2026-09-12): e-commerce 0/16, pixel, content,
  niche, traceability verdicts distilled into durable guidance (chat
  history; evidence: file:line cites). No task artifacts kept.
- `.agent/rules/ecommerce-ui.md` hard constraints (16-point gate, tokens,
  states, motion, content, niche-adaptive rule) + wired into priority.md
- Hardened skills: ecommerce-check (gate + niche fit), shopify-theme-review
  (UI gate step 0), review-execution (unbiased stance)
- `context/` guidance only: DECISIONS/001 niche-adaptive principle,
  RESEARCH/references/ecommerce-benchmarks (two screenshot teardowns
  marked illustrative, not targets). FEATURES empty; no RFC/SPEC/TDD pending.
- Premature FEAT-001 artifacts removed; accidental code edits reverted;
  master pristine
- Three-phase operating model: `brainstorming` skill + `brainstorm` /
  `initialization` / `implement` workflows, `brainstorm.md` + `qa.md`
  templates, `context/BRAINSTORM/` structure (idea folders with
  `brainstorm.md` + `Q&A.md`); niche examples marked illustrative only

## In progress

- None — harness + quality bar + phased workflows complete, awaiting
  first company brief via `/brainstorming` (Phase 1).

## Blocked

- None

## Verification

### Passed

- `shopify theme check --path .` → 40 files, no offenses
- `context/FEATURES/feature-list.json` parses
- `.agent/scripts/verify-theme.sh` correctly detects JSON defect (see below)

### Failed

- Strict JSON parse of `locales/en.default.schema.json` → trailing comma
  line 75 (`"normal": "Normal text"` block). Theme-check tolerates it;
  strict parsers don't. Left unfixed per harness rule (no product-code
  changes during harness build) — first SPEC executor fixes + verifies.

## Discoveries

- Repo is Shopify skeleton theme; CLI 4.8.0 available; no package.json test runner.
- `CLAUDE.md` and `copilot-instructions.md` are symlinks to `AGENTS.md`.
- `templates/*.json` + `config/settings_data.json` carry Shopify's
  `/* auto-generated */` header → verification strips comments before parsing
  (encoded in `verify-theme.sh` + `verification/commands.md`).

## Decisions

- Worktrees live outside repo as `../<repo>-<id>-<slug>`, branches `feat/<id>-<slug>`.
- TDD = Given/When/Then checklists verified via preview + theme-check (no unit runner).
- Codebase frozen until first RFC is accepted; only
  `.agent/` + `context/` carry guidance. Niche examples are illustrative;
  the RFC defines the real niche. One adaptive section + presets over
  niche-locked variants; sections expose posture settings where it matters.
- Benchmarks: two screenshot teardowns
  (`context/RESEARCH/references/ecommerce-benchmarks.md`) set the visual
  bar only — never requirements.

## Open questions

- [ ] Default base branch for client projects (`master` here — confirm per project)?

## Known issues

- `locales/en.default.schema.json:75` trailing comma (strict-JSON invalid,
  theme-check-tolerated). Fix in first SPEC batch.

## Remaining work

1. First company brief → Phase 1 `/brainstorming`
   (`context/BRAINSTORM/001-<slug>/` with `brainstorm.md` + `Q&A.md`).

## Next recommended action

Run `/brainstorming` with the company details (niche, products,
audience, brand assets, goals). Answer the Q&A file, then Phase 2
`initialization`, confirm the pack, then Phase 3 `implement`. Until
then: no product-code changes.

---
Last updated: 2026-09-12 · Updated by: three-workflow pass (no code touched, no task artifacts)
