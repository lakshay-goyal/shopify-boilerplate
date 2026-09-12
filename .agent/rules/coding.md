# Coding rules (Liquid theme)

Root `AGENTS.md` is authoritative for theme architecture; this file is the
enforceable subset.

1. Sections/blocks/snippets only — merchants compose templates in the theme
   editor. Do not hardcode page layouts in `templates/*.json` beyond SPEC.
2. Every section/block: `{% schema %}` with settings for each
   merchant-facing value. Single CSS property → CSS variable;
   multi-property → `select` setting switching classes.
3. Every snippet + statically-rendered block: `{% doc %}` LiquidDoc header
   with params + `@example`.
4. CSS/JS per component via `{% stylesheet %}` / `{% javascript %}` (one tag
   each per file). No Liquid inside them. `assets/` keeps only
   `critical.css` + truly global static files.
5. No `{% include %}` (use `{% render %}` with explicit params). No
   parentheses, no ternaries — nested `{% if %}` instead.
6. Max 50 iterations per `{% for %}` — paginate beyond that.
7. Never shadow Liquid global objects with variable names.
8. Every user-facing string: `{{ 'a.b.c' | t }}` + key in
   `locales/en.default.json`, sentence case, hierarchical snake_case keys
   (max 3 levels). Escape variables unless HTML-intended.
