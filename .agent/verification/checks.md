# Verification checks (what green means)

| # | Check | Pass bar |
|---|---|---|
| 1 | JSON validity | All `templates/`, `locales/`, `config/` JSON parses |
| 2 | `shopify theme check` | Zero errors; each warning fixed or justified inline |
| 3 | Schema | New/changed section/block has `{% schema %}` + per-value settings + defaults |
| 4 | Docs | New snippet / static block has `{% doc %}` with params + example |
| 5 | Locales | Every new `| t` key in `en.default.json`; sentence case; ≤3-level snake_case |
| 6 | TDD | Every TC Passing with method + evidence; coverage map complete |
| 7 | Customizability | `shopify-theme-review` verdict CUSTOMIZABLE |
| 8 | Scope | Diff contains only SPEC surfaces + its locale keys |

Shopify-specific notes (`shopify.md` rules apply): money filters, `image_url`
+ `image_tag` with widths, `{% form %}` types, pagination beyond 50 items,
template-appropriate Liquid objects, no invented store data.
