# .agent — Shopify Theme Engineering Harness

Provider-neutral operating system for AI coding agents (Claude Code, Codex,
Kimi, Gemini, Cursor, future agents) working on this Shopify Liquid theme.

## The separation

| System | Role | Source of truth for |
|---|---|---|
| `context/` | Product brain | WHY / WHAT to build, decisions, client knowledge |
| `.agent/` (this dir) | Engineering OS | HOW agents work: rules, skills, workflows, state |
| Repo root (`sections/`, `blocks/`, …) | Implementation | HOW the system is implemented |

## Start here (progressive disclosure — read only what your task needs)

1. **`.agent/AGENT.md`** — canonical instructions, golden rules, approval
   boundaries. Read this first, every session.
2. **`.agent/state/progress.md`** — current project state. Read second.
3. **`context/README.md`** — product truth: RFCs, specs, features.
4. Task-specific, on demand:
   - Doing a feature? → `.agent/workflows/feature.md`
   - Parallel work? → `.agent/workflows/parallel-work.md`
   - Verifying? → `.agent/verification/commands.md`
   - A skill? → `.agent/skills/<name>/SKILL.md` (load one at a time)
   - A rule conflict? → `.agent/rules/priority.md`

## Lifecycle (three phases — never mix them)

```
Phase 1 brainstorm      → company in, brainstorm.md + Q&A.md out (no RFC/SPEC/code)
Phase 2 initialization  → Q&A answers in, RFC + SPECs + TDD lists + Excalidraw + insight out (no code)
Phase 3 implement       → confirmed plan in, parallel worktrees → verify → review → merge → unbiased audit → insight
```

Skill chain: `brainstorming` → `rfc-generator` → `spec-generator` →
`tdd-generator` → `diagram-generator` → `ecommerce-check` →
`worktree-executor` → `review-execution` → `shopify-theme-review` →
`commit-message` → `test-review`. Workflows: `brainstorm.md`,
`initialization.md`, `implement.md` (+ `parallel-work.md`,
`review.md`, `verification.md`, `feature.md` as the per-feature path).

Never trust unverified agent output. Executable verification decides
whether implementation works, not the agent's claim.

## Skills

| Skill | When |
|---|---|
| `brainstorming` | Phase 1: company brief → `context/BRAINSTORM/` (`brainstorm.md` + `Q&A.md`) |
| `rfc-generator` | Phase 2: brainstorm + Q&A answers → `context/RFC/` |
| `diagram-generator` | Decisions/flows → `context/EXCALIDRAW/` |
| `spec-generator` | Accepted RFC/PRD → `context/SPEC/` + `FEATURES/` |
| `tdd-generator` | Spec → `context/TDD/` test cases (before code) |
| `worktree-executor` | Spec path → isolated worktree + implementation |
| `review-execution` | Worktree/branch → review report + merge verdict |
| `commit-message` | Diff → conventional commit message (one spec per commit) |
| `shopify-theme-review` | Worktree → no-hardcode / full-customizability audit |
| `test-review` | Repo → full validation (`shopify theme check`, JSON, locales) |
| `ecommerce-check` | RFC → does this look like real ecommerce or AI slop? |

## Rules

- `.agent/rules/priority.md` — conflict resolution order (read on conflict)
- `.agent/rules/safety.md` — hard constraints (never violate)
- `.agent/rules/coding.md` — Liquid/theme conventions
- `.agent/rules/shopify.md` — Shopify platform constraints
- `.agent/rules/git.md` — branches, worktrees, commits

## State

- `.agent/state/progress.md` — current state (update after every milestone).
  Progress tells you **where you are**, never **what the product should be**
  (that is `context/` — a past mistake in progress must never become spec).
