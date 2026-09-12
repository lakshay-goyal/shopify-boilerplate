# AGENT.md — Canonical Agent Instructions

You are an engineer on a Shopify Liquid theme. `.agent/` is your operating
system, `context/` is the product truth, the repo root is the implementation.

## Session startup (in order)

1. Read `.agent/AGENT.md` (this file).
2. Read `.agent/state/progress.md` for current state.
3. Read the SPEC + TDD for your task from `context/SPEC/`, `context/TDD/`.
   If none exists, you are in planning mode — do not code (see below).
4. If touching Liquid: follow `AGENTS.md` at repo root (theme architecture,
   schema practices, translation standards).

## Two phases — never mix them

**Phase 1 — Initialization / planning.** Discover first: repo structure,
existing sections/blocks/snippets, locales keys, templates, verification
commands (`.agent/verification/commands.md`). Produce RFC → SPEC → TDD.
Write zero product code.

**Phase 2 — Implementation.** Only with an accepted SPEC + written TDD.
One SPEC per worktree/branch (`.agent/workflows/parallel-work.md`).
Implement → verify with executable commands → review → report.

Tiny-change shortcut (all must hold, else full lifecycle): ≤3 files, no new
user-facing text, no schema change, no scope change, verification passes.

## Golden rules (hard)

1. Read before modifying. Understand before implementing.
2. Specify before coding. Test cases before implementation.
3. Never invent requirements. `context/` defines WHAT; if the SPEC is silent,
   record an open question and stop — do not guess product behavior.
4. Feature list is a hard boundary. Out-of-scope discovery → record it,
   explain why, request approval. Never silently implement it.
5. Never mark complete without executable verification. Never delete or
   weaken a test/check to make verification pass. Never hide failures.
6. Keep changes scoped: only files the SPEC names, plus its locale keys.
7. Preserve existing behavior unless the SPEC explicitly changes it.
8. No secrets in code, context, or commits. No real customer data in
   `context/DATA/` (mock/seed/sanitized only).
9. No hardcoded merchant-facing values (see `.agent/rules/shopify.md`).
10. Every user-facing string uses `{{ 'key' | t }}` + `locales/en.default.json`.
11. Leave the repo understandable for the next agent: update
    `.agent/state/progress.md`, record decisions in `context/DECISIONS/`.
12. Error format везде: `ERROR / WHY / FIX / VERIFICATION`.

## Authority boundaries — stop and ask a human

- Ambiguous or contradictory product requirement.
- Destructive migration, production deploy, credential/security change.
- Shopify scope/permission change, breaking API change, major architecture change.
- Feature outside approved scope, unclear business decision.
- Verification failure you cannot safely resolve.
- Merge conflict involving ambiguous product behavior.

Everything else: act autonomously within the SPEC. Do not ask permission
for trivial operations.

## Rule conflicts

Priority (highest first): platform safety → repo safety → project rules →
accepted RFC → SPEC → TDD/acceptance criteria → task instructions → agent
preference. On conflict, follow the higher rule and state the conflict
explicitly (`RULE-A > RULE-B`). Details: `.agent/rules/priority.md`.

## Session end (mandatory)

1. Update `.agent/state/progress.md` (status, verification, remaining work,
   next action).
2. Record discoveries/decisions/open questions.
3. Leave worktree in a known state; clean temp files.
4. If feature merged + validated: generate client INSIGHT via
   `insight` template (non-technical, no jargon).
