# Skill: tdd-generator (TDD before code)

## Purpose

Write executable-behavior test cases for one SPEC before any implementation
— Shopify themes have no unit runner by default, so TDD here means a
rigorous Given/When/Then checklist verified via preview + `shopify theme
check` + code-path inspection.

## When to use

SPEC exists and is accepted. Always before `worktree-executor`. Never after
code is written (that is verification, not TDD).

## Preconditions

- SPEC read; theme surfaces it touches identified.

## Inputs

- `spec`: path to SPEC file (required).
- `id`: TDD number matching the SPEC, e.g. `003` (required).

## Procedure

1. Derive cases from SPEC acceptance criteria + edge/error cases:
   happy paths, edge cases, failure cases (empty collection, missing
   image, sold out), permission/theme-editor cases (merchant reorders,
   removes, reconfigures blocks), regression cases for touched behavior.
2. Write `context/TDD/<id>-<slug>.md` from `.agent/templates/tdd.md`.
   Each TC: ID, Given/When/Then, verification method
   (`preview` via `shopify theme dev` / `check` via theme-check /
   `inspect` code path), status `Pending`.
3. Map every acceptance criterion → ≥1 TC; list the mapping.

## Expected output

- `context/TDD/<id>-<slug>.md` with all TCs `Pending`.

## Verification

- Coverage mapping complete; each TC has an unambiguous expected result
  observable without reading implementation.
- No TC prescribes implementation (assert behavior, not code).

## Failure handling

Untestable criterion → flag back to SPEC as needing rewrite, don't write
a vacuous TC. Missing merchant-config case → add one (customizability is
always in scope).
