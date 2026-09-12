# Workflow: verification

Executable order — `.agent/verification/commands.md` has the commands.
Stop at first red, fix with ERROR/WHY/FIX/VERIFICATION, restart there.

1. JSON validity (templates, locales, config).
2. `shopify theme check` on the active worktree.
3. Schema + `{% doc %}` presence for new/changed components.
4. Locale coverage for new `| t` keys + sentence case.
5. TDD walkthrough (preview via `shopify theme dev` or code-path check).
6. `shopify-theme-review` customizability audit.
7. Record all outputs in `.agent/state/progress.md` → Verification.
