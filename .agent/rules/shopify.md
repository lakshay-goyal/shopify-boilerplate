# Shopify platform rules

1. No hardcoded merchant-customizable value: texts, colors, fonts, spacing,
   image picks, toggles, collection/product picks, URLs shown to shoppers.
   All come from schema settings, locale strings, or store data.
2. Settings must have sensible defaults so a fresh install looks like a
   finished store, not a wireframe.
3. Respect template context: only documented Liquid objects per template
   type (e.g. `product` on product pages). Guard with `{% if %}` when an
   object may be absent.
4. Money via money filters; images via `image_url` + `image_tag` with
   widths; forms via `{% form %}` types; paginate large collections.
5. Validate with `shopify theme check` (theme-check:recommended). Zero new
   errors. Triage warnings explicitly.
6. Never assume apps/APIs/webhooks exist — check the repo + SPEC first.
   Never invent store data, product IDs, or metafield namespaces.
