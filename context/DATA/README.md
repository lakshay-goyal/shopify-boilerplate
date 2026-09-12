# DATA/ — store data layer (mock/seed/sanitized ONLY)

- `products/<id>/metadata.json` + `mockups/` + `references/`
- `collections/`, `users/`, `shopify/` (metafields, tags, configuration)

HARD RULE: no passwords, API keys, tokens, payment data, or real customer
PII anywhere in this tree. Production data is never committed.
