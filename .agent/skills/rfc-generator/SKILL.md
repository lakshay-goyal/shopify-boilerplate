# Skill: rfc-generator

## Purpose

Turn a client brief / rough PRD (`PRD.md`, notes, call summary) into the
main RFC: the single product-intent document every SPEC derives from.

## When to use

New client project, new major capability, or human says "write the RFC".
Never during implementation; never edit product code in this skill.

## Preconditions

- Client source material identified (brief path or pasted notes).
- Next Context ID known (`context/FEATURES/feature-list.json` or start `001`).

## Inputs

- `source`: path to brief/PRD.md or inline client description (required).
- `id`: RFC number, e.g. `001` (required).

## Procedure

1. Read the source fully. Extract: business, audience, catalog shape
   (inventory / POD / dropshipping), pages, commerce flows, brand inputs,
   explicit non-goals.
2. Check `context/RESEARCH/` for relevant prior findings; cite them.
3. Write `context/RFC/<id>-<slug>.md` from `.agent/templates/rfc.md`.
   Status starts `proposed`. Every claim traceable to the source; mark
   guesses as Open Questions, never as requirements.
4. Run `ecommerce-check` on the draft before presenting it.
5. Present scope + open questions to the human. Agent never self-accepts.

## Expected output

- `context/RFC/<id>-<slug>.md` (complete, status `proposed`).
- Short summary: problem, proposed scope, non-goals, open questions.

## Verification

- Template sections all filled; no empty headings.
- No implementation detail (file names, code) inside the RFC.
- `feature-list.json` entry added with status `proposed`.

## Failure handling

Vague brief → ask up to 5 targeted questions (audience, catalog, checkout
needs, brand assets, deadline) instead of inventing scope.
Contradictions → list them as Open Questions, stop.
