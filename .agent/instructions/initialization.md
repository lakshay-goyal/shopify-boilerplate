# Initialization phase

Goal: know WHAT exists, WHY, HOW it is organized, WHAT rules govern it,
WHAT can change, HOW changes are verified. Zero product code.

## Procedure

1. Discover structure: `sections/ blocks/ snippets/ templates/ locales/
   config/ layout/ assets/` — list files per dir.
2. Identify conventions: read root `AGENTS.md`, existing `{% schema %}`,
   `{% doc %}` headers, `{% stylesheet %}`/`{% javascript %}` usage.
3. Identify verification: read `.agent/verification/commands.md`; confirm
   `shopify` CLI presence (`shopify version`).
4. Identify state: read `.agent/state/progress.md`, `context/FEATURES/`,
   `context/CHANGELOG/`.
5. Identify danger: secrets, live-store config, lockfiles, generated files.
6. Write findings to `.agent/state/progress.md` → Discoveries/Decisions.

## Output

A progress update answering: what exists, what rules govern it, what can be
changed, how changes are verified. Then either start planning
(RFC → SPEC → TDD) or pick up the recorded Next Action.
