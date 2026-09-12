# Agent guide (context budget)

Progressive disclosure: load the smallest doc that answers your question.

- First session ever → `AGENT.md` + `state/progress.md` + `context/README.md`.
- Planning → `workflows/initialization.md`, then the one skill you need.
- Implementing → SPEC + TDD + `workflows/parallel-work.md` (multi-SPEC) or
  `workflows/feature.md` (single).
- Verifying → `verification/commands.md` only.
- Conflict → `rules/priority.md`. Git → `rules/git.md`. Shopify → `rules/shopify.md`.

One concept lives in exactly one place. If two docs disagree, the higher
priority per `rules/priority.md` wins — report the drift in progress.
