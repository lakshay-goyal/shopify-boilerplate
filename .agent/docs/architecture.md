# Harness architecture

```
context/   product brain  (WHAT / WHY — RFC, SPEC, TDD, decisions, insights)
.agent/    engineering OS (HOW agents work — rules, skills, state, workflows)
repo root  implementation (Shopify Liquid theme)
```

Five harness components: **Instructions** (`instructions/` + `AGENT.md`),
**State** (`state/progress.md`), **Tools** (`scripts/` + `verification/`),
**Feedback** (verification loops, `review-execution`, `test-review`), and
**Environment** (worktrees per SPEC, `workflows/parallel-work.md`).
Provider adapters (`AGENTS.md`, `CLAUDE.md` → symlink, `copilot-instructions.md`
→ symlink) stay thin and point here — this dir is canonical.
