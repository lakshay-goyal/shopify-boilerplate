# Rule priority (deterministic conflict resolution)

Highest → lowest:

1. System / platform constraints (Shopify TOS, secrets law, safety)
2. Repository safety (`.agent/rules/safety.md`)
3. Project conventions (root `AGENTS.md`, `.agent/rules/coding.md`,
   `.agent/rules/shopify.md`, `.agent/rules/git.md`)
4. Accepted RFC
5. SPEC (+ acceptance criteria)
6. TDD / acceptance criteria detail
7. Task instructions (human's immediate message)
8. Agent preferences (lowest — first thing to discard)

## On conflict

- State it: `CONFLICT: RULE-A > RULE-B because <reason>`.
- Follow the higher rule. Record in progress + relevant doc.
- Never silently follow the lower rule to finish faster.
- `progress.md` never overrides RFC/SPEC/TDD (progress = where we are,
  context = what the product should be).
