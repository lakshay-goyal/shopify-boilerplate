# Implementation phase

Follows: accepted SPEC + written TDD + isolated worktree. One SPEC per
worktree. See `.agent/workflows/feature.md` and `parallel-work.md`.

## Procedure

1. Load skill `worktree-executor` for worktree/branch setup.
2. Implement ONLY the SPEC: named sections/blocks/snippets/templates +
   locale keys. Reuse existing patterns from root `AGENTS.md`.
3. Customizability is non-negotiable (enforced later by
   `shopify-theme-review`): every merchant-facing value is a schema setting
   or locale string. CSS single-property → CSS variable; multi-property →
   class switched by `select` setting.
4. Translate TDD cases into manual verification steps as you build.
5. Verify per `.agent/verification/commands.md`. Fix failures with
   ERROR/WHY/FIX/VERIFICATION entries. Repeat until green.
6. Hand to `review-execution`, then `test-review`. Do not merge on red.

## Done means

SPEC acceptance criteria all checked, verification green, theme-review
clean (no hardcodes), progress updated, decisions recorded.
