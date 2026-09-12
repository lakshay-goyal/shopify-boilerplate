# Verification phase

Principle: the agent's claim is worthless; executable output decides.

## Order (stop at first red, fix, restart from that step)

1. Format: Prettier/Liquid prettiness — no stray whitespace, 2-space indent.
2. JSON validity: every `templates/*.json`, `locales/*.json`,
   `config/*.json` parses (`python3 -m json.tool`).
3. `shopify theme check` on the worktree — zero errors (warnings triaged).
4. Schema check: every new section/block has `{% schema %}`; every snippet
   and statically-rendered block has `{% doc %}`.
5. Locale coverage: every added `| t` key exists in `en.default.json`;
   sentence case for all user-facing text.
6. TDD walkthrough: execute each TC step in `shopify theme dev` preview or
   by code-path inspection; mark Passing/Failed in the TDD file.
7. Customizability audit via `shopify-theme-review` skill.

Record results in `.agent/state/progress.md` → Verification (Passed/Failed)
with exact commands + outputs. Never summarize a failure away.
