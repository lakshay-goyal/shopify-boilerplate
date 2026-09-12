# Workflow: feature (per-feature path inside the three phases)

Phases: `brainstorm.md` (Phase 1) → `initialization.md` (Phase 2) →
`implement.md` (Phase 3). This file is the per-feature execution path
used inside Phase 3 once the plan is confirmed.

```
1. RFC        skill: rfc-generator        → context/RFC/NNN-slug.md (proposed)
2. Approve    HUMAN accepts/rejects the RFC (agent never self-accepts scope)
3. SPEC       skill: spec-generator       → context/SPEC/NNN-slug.md + FEATURES/
4. Ecom check skill: ecommerce-check      → RFC still commerce-shaped?
5. TDD        skill: tdd-generator        → context/TDD/NNN-slug.md (before code!)
6. Execute    skill: worktree-executor    → isolated worktree, implement SPEC
7. Verify     instructions/verification.md → all green, else ERROR/WHY/FIX loop
8. Review     skill: review-execution     → APPROVE / CHANGES-REQUESTED
9. Theme audit skill: shopify-theme-review → zero hardcodes
10. Merge      merge to base, clean worktree (git.md)
11. Final      skill: test-review          → on merge result
12. Insight    instructions/handoff.md     → context/INSIGHTS/NNN-slug.html
13. Progress   update state, changelog, FEATURES status, next action
```

Skipping stages is allowed only under the tiny-change rule in AGENT.md.
TDD (step 5) can never be skipped for merchant-visible behavior.
