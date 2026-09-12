# Project progress (agent-optimized — under a minute to absorb)

## Current objective

Harness bootstrap: `.agent/` + `context/` created, awaiting first client RFC.

## Current feature / task

None active — harness setup in progress.

## Status

in-progress

## Completed

- `.agent/` harness: README, AGENT.md, 4 instructions, 5 rules, 6 workflows,
  10 skills, 5 role cards, 7 templates, verification docs, 2 scripts, 3 docs
- `context/` skeleton: all 14 sections with READMEs + starter files
- AGENTS.md adapter header (CLAUDE.md / copilot-instructions.md inherit via symlink)

## In progress

- None — harness bootstrap complete, awaiting first client RFC.

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

## Open questions

- [ ] Default base branch for client projects (`master` here — confirm per project)?

## Known issues

- `locales/en.default.schema.json:75` trailing comma (strict-JSON invalid,
  theme-check-tolerated). Fix in first SPEC batch.

## Remaining work

1. First real client RFC → proves pipeline end to end.

## Next recommended action

Run `rfc-generator` on the first client brief (`context/RFC/001-<slug>.md`),
then `spec-generator` → `tdd-generator` → `ecommerce-check` before any code.

---
Last updated: 2026-09-12 · Updated by: harness bootstrap
