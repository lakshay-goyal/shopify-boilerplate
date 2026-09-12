# Handoff phase

After merge + final validation (`test-review` green on the merge result):

1. Generate INSIGHT: copy `.agent/templates/insight.html` to
   `context/INSIGHTS/NNN-slug.html`. Non-technical language only — the
   client must never need to know what Liquid, Redis, or GraphQL are.
   Cover: what changed, why, old vs new experience, customer-visible
   behavior, decisions, limits, what's next.
2. Update `context/FEATURES/feature-list.{json,md}` status.
3. Append a product-oriented entry to `context/CHANGELOG/CHANGELOG.md`.
4. Update `context/HANDOFF/` pages affected by the feature.
5. Final `progress.md` update with Next Recommended Action.

The client opens `context/HANDOFF/README.md` and understands the whole
product without reading code. That is the bar.
