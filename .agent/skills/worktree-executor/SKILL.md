# Skill: worktree-executor (one SPEC, one worktree)

## Purpose

Given ONLY a spec path, create an isolated worktree + branch and implement
that SPEC — nothing more.

## When to use

SPEC accepted + TDD written. One invocation = one SPEC.

## Preconditions

- Clean base (`git status` clean or only harness files), base branch known.
- SPEC + TDD paths exist; `depends_on` SPECs already merged.

## Inputs

- `spec`: path to SPEC file (required).
- `base`: base branch (default: `master` unless told otherwise).

## Procedure

1. Read SPEC + TDD + relevant `AGENTS.md` sections. Restate scope in your
   own words + files you will touch. If scope unclear → stop, ask.
2. Create worktree OUTSIDE the repo (see `.agent/scripts/new-worktree.sh`):
   branch `feat/<id>-<slug>`, dir `../<repo>-<id>-<slug>`.
3. Initialize: confirm `shopify` CLI runs; note verification commands.
4. Implement ONLY the SPEC (named surfaces + its locale keys). Follow root
   `AGENTS.md` patterns; every merchant value → schema setting or `| t`.
5. Run `.agent/workflows/verification.md` fully. Fix via
   ERROR/WHY/FIX/VERIFICATION. Update TDD TC statuses.
6. Update `.agent/state/progress.md` (in the worktree AND report back).
7. Report: branch, worktree path, files changed, verification outputs,
   TDD results, open questions. Do NOT merge — review comes next.

## Expected output

- Implemented SPEC in its worktree, verification green, report summary.

## Verification

- `git status` shows only SPEC-scoped files; diff touches nothing else.
- All verification steps green with pasted command outputs.

## Failure handling

Dependency missing → stop, record blocker, do not stub another SPEC's work.
Red verification unfixable safely → stop, report ERROR/WHY/attempts, ask.
Parallel collision (same file as sibling SPEC) → stop, escalate to human.
