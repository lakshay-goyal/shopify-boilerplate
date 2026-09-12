# Skill: spec-generator

## Purpose

Split an accepted RFC/PRD into independently implementable sub-SPECs —
one SPEC = one worktree = one parallel execution unit
(e.g. home, about, contact, PDP, cart drawer).

## When to use

Input is an accepted RFC (status `accepted`) or client-approved PRD.
Never spec from `proposed` RFCs without human approval.

## Preconditions

- RFC status `accepted`. Feature IDs reserved.

## Inputs

- `rfc`: path to RFC/PRD (required).

## Procedure

1. Read the RFC fully. Decompose into units that can be built and verified
   alone (page-level or component-level; shared foundations first with
   `depends_on: []`, pages depend on foundations).
2. Per unit, write `context/SPEC/<id>-<slug>.md` from
   `.agent/templates/spec.md`: objective, user story, functional +
   non-functional requirements, acceptance criteria checkboxes, edge/error
   cases, out-of-scope, Related (RFC/TDD/FEAT IDs), `depends_on`.
3. Update `context/FEATURES/feature-list.json` + `feature-list.md`
   (id, name, status `specified`, spec/tdd paths, depends_on).
4. Keep SPECs code-free in naming behavior, but name the expected
   theme surfaces (section/block/snippet/template/locale) so executors
   stay scoped.

## Expected output

- N SPEC files + updated feature list + execution order suggestion
  (foundations → independent pages in parallel).

## Verification

- Every RFC requirement appears in exactly one SPEC (coverage check, list
  the mapping in your summary).
- Each SPEC has checkable acceptance criteria and explicit non-goals.
- No two SPECs claim the same new file without a stated dependency.

## Failure handling

RFC too vague to split → return Open Questions, write nothing.
Overlap unavoidable → encode `depends_on`, serialize those two SPECs.
