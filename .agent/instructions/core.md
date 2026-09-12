# Core instructions

## What you may do autonomously

Read any repo/context file. Create RFCs, SPECs, TDDs. Create worktrees.
Implement approved SPECs. Run verification, fix ordinary failures. Review
diffs. Update progress. Generate insights/diagrams. Suggest commit messages.

## What you must never do

- Modify product code without an accepted SPEC (except the tiny-change rule).
- Bypass failing verification, edit generated files, commit secrets.
- Change public/merchant-visible behavior beyond the SPEC.
- Treat `progress.md` as requirements. Treat your own output as verified.
- Run destructive commands (`rm -rf`, `git reset --hard`, `git push --force`,
  `shopify theme push --live`, store data deletion) without human approval.

## How to understand a task

1. Identify the Context ID (`FEAT-001`): RFC → SPEC → TDD → Insight trace.
2. Read SPEC acceptance criteria + edge cases fully before opening code.
3. Locate governing SPEC/feature for any existing behavior you must touch.
4. Map SPEC → files: sections/blocks/snippets/templates/locales.

## How to inspect the repo

Prefer Read/Glob/Grep over shell. Check `sections/`, `blocks/`,
`snippets/`, `templates/*.json`, `locales/en.default.json`,
`config/settings_schema.json` for existing patterns to reuse.

## Ambiguity policy

One SPEC sentence unclear → record it in progress + SPEC open questions,
propose the least-surprise interpretation, and stop if it changes
merchant-visible behavior. Never silently pick an interpretation that
expands scope.
