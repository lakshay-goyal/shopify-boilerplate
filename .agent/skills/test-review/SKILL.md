# Skill: test-review (full-repo validation)

## Purpose

Run the entire validation battery on the codebase and report the true
state: all test cases, linting, formatting, Shopify CLI checks. The final
gate before handoff.

## When to use

After each merge, and once on base after all SPECs merge. Also on demand
("is the theme healthy?").

## Inputs

- `target`: repo/worktree path (default: current directory).

## Procedure — run in order, record exact outputs

1. JSON validity: all `templates/*.json`, `locales/*.json`,
   `config/*.json` parse.
   `python3 -c "import json,glob; [json.load(open(f)) for f in glob.glob('templates/*.json')+glob.glob('locales/*.json')+glob.glob('config/*.json')]; print('JSON OK')"`
2. `shopify theme check` (theme-check:recommended). Zero errors allowed;
   triage each warning explicitly (fix or justify in-line).
3. Locale audit: every `'x.y' | t` key used in `.liquid` exists in
   `locales/en.default.json`; report orphans both directions.
4. TDD rollup: walk every `context/TDD/*.md`, confirm each TC marked
   Passing with method + evidence; any Pending/Failed → red.
5. `shopify-theme-review` verdict must be CUSTOMIZABLE.
6. `git status` clean of unintended files (no temp, no secrets).

## Expected output

- PASS/FAIL per step with command + output; overall verdict
  SHIP-READY or NOT SHIP-READY with the exact blocking list.

## Verification

- Outputs quoted, not summarized. A green verdict with a hidden failure
  is the worst possible outcome — never hide, never soften.

## Failure handling

Any red → file ERROR/WHY/FIX/VERIFICATION, route back to the owning SPEC
worktree. Flaky/environmental failure → prove it (rerun + evidence),
record in progress, do not waive silently.
