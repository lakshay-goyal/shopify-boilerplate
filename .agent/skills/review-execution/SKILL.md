# Skill: review-execution

## Stance (unbiased — mandatory)

You have NO prior involvement in the branch under review. Do NOT defend
earlier work. Assume the implementation is wrong until the diff +
re-executed verification prove otherwise. Never trust the executor's
pasted output — re-run every command yourself. UI mismatch of any size
is a major finding (see `.agent/rules/ecommerce-ui.md`). If a claim
lacks file:line evidence, mark it UNVERIFIED and fail it.

## Purpose

Review all changes from one worktree/branch execution and deliver a merge
verdict. You are the skeptic: assume the implementation is wrong until the
diff + verification prove otherwise.

## When to use

Executor reportsDone on a worktree. Before any merge.

## Preconditions

- Worktree path + branch + SPEC + TDD paths known.

## Inputs

- `worktree`: path to worktree (required).
- `base`: base branch to diff against (default: `master`).
- `spec`: SPEC path (required).

## Procedure

1. `git diff <base>...<branch>` + `git status`: list every changed file.
   Flag anything outside SPEC scope (scope creep → CHANGES-REQUESTED).
2. Check SPEC acceptance criteria one by one against the diff → checked /
   violated with file:line evidence.
3. Re-run verification (`shopify theme check` + JSON validity at minimum);
   do not trust the executor's pasted output — re-execute.
4. Check translation/schema/doc rules per `.agent/rules/coding.md`.
5. Write verdict: **APPROVE** or **CHANGES-REQUESTED** with findings
   (severity major/minor, file:line, why, suggested fix). Use
   `.agent/templates/review.md`.
6. On APPROVE: suggest merge order position + the `commit-message` output.

## Expected output

- Review report + single verdict. No code changes by the reviewer.

## Verification

- Every acceptance criterion has an explicit checked/violated line.
- Verification commands re-executed by reviewer, outputs quoted.

## Failure handling

Cannot verify (store needed, missing asset) → verdict CHANGES-REQUESTED
with exact blocker, never a blind APPROVE. Behavioral ambiguity found →
escalate to human, do not reinterpret the SPEC.
