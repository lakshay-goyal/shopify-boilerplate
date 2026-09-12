# Skill: commit-message

## Purpose

Suggest a better commit message for exactly one SPEC's changes.

## When to use

Before every `git commit` of SPEC work. One SPEC per commit, always.

## Inputs

- `spec`: SPEC id, e.g. `SPEC-003` (required).
- Diff (`git diff --staged`) — read it yourself (required context).

## Procedure

1. Read the staged diff. If it spans multiple SPECs → refuse, ask to split.
2. Compose: `<type>(<SPEC-ID>): <short merchant-visible summary>`
   - type: `feat` (new), `fix`, `refactor`, `chore`, `docs`, `locale`.
   - Subject ≤72 chars, sentence case, no period, no jargon.
   - Body: 2–5 bullets — what merchant/shoppers gain, key files, TDD ids.
   - Footer: `SPEC: context/SPEC/<file>` (+ `TDD:` line).
3. Output the message in a code block, plus `git commit -F` ready form.
   Never commit yourself unless the human explicitly asked.

## Example

```
feat(SPEC-003): Add customizable home hero section

- Merchant-editable heading, subtext, CTA, and background via theme editor
- New section home-hero with two presets; locales under sections.home_hero
- Verified: shopify theme check clean, TDD-003 TC-001..006 passing

SPEC: context/SPEC/003-home-hero.md
TDD: context/TDD/003-home-hero.md
```

## Failure handling

Diff empty → say so, propose nothing. Diff mixes SPECs → refuse + show
which files belong where.
