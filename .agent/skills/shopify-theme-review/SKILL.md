# Skill: shopify-theme-review (full-customizability audit)

## Purpose

Prove the client can change EVERYTHING from their Shopify account: no
hardcoded texts, colors, fonts, spacing, images, or logic constraints in
code. This is the handoff-quality gate.

## When to use

After implementation, before merge; again in final validation. Input is a
worktree path or a diff.

## Inputs

- `target`: worktree path (default: repo root).
- `diff_only`: `true` + base branch to audit only changed lines (optional).

## Procedure — check each, report file:line PASS/FAIL

0. **E-commerce UI gate**: apply `.agent/rules/ecommerce-ui.md`
   §§2–5 (tokens, states, motion, content, niche-adaptive). Any hardcoded
   hex, off-scale spacing, raw font-size, 500px-min grid, missing
   focus/reduced-motion, hardcoded English, or schema locking one
   niche posture without a setting = FAIL (merge-blocking major).
1. **Hardcoded user-facing text**: grep rendered output strings NOT via
   `| t` in `.liquid` (allow a11y-hidden technical strings only if noted).
   Every fail → must become locale key + `en.default.json` entry.
2. **Hardcoded style values**: hex/rgb colors, `px` spacing, font names in
   markup or `{% stylesheet %}` that ignore schema settings. Single
   property → CSS variable bound to setting; multi-property → `select`
   setting switching classes (root AGENTS.md patterns).
3. **Schema presence**: every new/changed section/block has `{% schema %}`
   with a setting per merchant-facing value + sensible defaults (fresh
   install looks finished, not wireframe).
4. **Docs**: `{% doc %}` on snippets + statically-rendered blocks.
5. **Locales**: new keys exist in `en.default.json`, hierarchical
   snake_case ≤3 levels, sentence case.
6. **Logic constraints**: hardcoded collection handles, product IDs,
   URLs, limits, thresholds — must be settings or store data.
7. **Templates**: JSON templates stay merchant-reorderable; no layout
   frozen in code that belongs in the editor.

## Expected output

- Table: check → PASS/FAIL → file:line evidence → required fix.
- Verdict: CUSTOMIZABLE or NOT CUSTOMIZABLE (blocks merge).

## Verification

- Grep commands quoted with outputs; zero FAILs for a pass verdict.

## Failure handling

Any FAIL → list exact fixes, return to executor. Never waive a FAIL to
"fix later" — later is the client's problem and that is unacceptable.
