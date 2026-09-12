# Skill: brainstorming (Phase 1 — idea first, zero code)

## Purpose

Turn raw company knowledge into a researched design direction plus an
explicit question list — BEFORE any RFC, SPEC, or code exists. This is
the thinking phase: understand the business, study competitors, profile
customers, and recommend a theme posture (premium/restrained,
playful/expressive, motion density, patterns, references).

## When to use

Human runs `/brainstorming` (or the `brainstorm` workflow) with company
details. Never during initialization or implementation; never write
RFC/SPEC/TDD/code in this skill.

## Preconditions

- Company input from the human (name, niche, products, audience,
  brand assets, markets, goals) — pasted or as a brief file.
- Next brainstorm ID known (`context/BRAINSTORM/` or start `001`).

## Inputs

- `source`: company brief text or path (required).
- `id`: brainstorm number, e.g. `001` (required).

## Procedure

1. Read the source fully. Extract: business, niche, catalog shape
   (inventory / POD / dropshipping — unknown is fine, ask), audience,
   brand inputs, markets, goals, explicit non-goals.
2. Research (web + repo, evidence-backed, no invented facts):
   - Competitors: 3–5 real stores in the niche. Record positioning,
     sections they all have, proof/urgency patterns, what to borrow
     vs avoid → `context/RESEARCH/competitors/<slug>.md`.
   - Customers: who buys, what they fear, what convinces them
     (reviews, COD, returns, sizing, bulk support…) →
     `context/RESEARCH/customer-research/<slug>.md`.
   - Platform: relevant Shopify capabilities/limits →
     `context/RESEARCH/shopify/<slug>.md` (only if non-obvious).
   - Cite sources per claim; mark guesses UNVERIFIED, never requirements.
3. Design direction (calibrated to the niche, per
   `context/DECISIONS/001-niche-adaptive-design.md` and the illustrative
   `context/RESEARCH/references/ecommerce-benchmarks.md` — references
   inspire posture, never content or copy):
   recommend restrained vs expressive posture, motion density,
   section rhythm, proof style, urgency style, photography style, with
   1–3 reference pointers and WHY each fits this audience.
4. Write `context/BRAINSTORM/<id>-<slug>/brainstorm.md` from
   `.agent/templates/brainstorm.md` — company, competitors, customers,
   recommended theme/patterns/motion/references. Status starts `draft`.
5. Write `context/BRAINSTORM/<id>-<slug>/Q&A.md` from
   `.agent/templates/qa.md` — every open question grouped: legal,
   policies, refunds/returns, shipping/COD, contact info, socials,
   brand assets, technical unknowns. Each with status `Pending`.
   No question is answered by guessing — that is the human's job.
6. Present: direction summary + question count + what happens next
   (human answers Q&A, then Phase 2 `initialization`).

## Expected output

- `context/BRAINSTORM/<id>-<slug>/brainstorm.md` (status `draft`).
- `context/BRAINSTORM/<id>-<slug>/Q&A.md` (all questions `Pending`).
- Research notes linked under `context/RESEARCH/`.
- Short summary: niche read, direction, top unknowns.

## Verification

- Template sections all filled; no empty headings.
- Zero RFC/SPEC/TDD/code content; zero invented company facts.
- Every competitor/customer claim has a source or UNVERIFIED mark.

## Failure handling

Too little input → ask up to 5 targeted questions (niche, products,
audience, brand assets, goals) instead of inventing a business.
Contradictions → Q&A open questions, stop. Human answers later in the
Q&A file (or chat) — Phase 2 requires all questions Answered or
explicitly Deferred.
