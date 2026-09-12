# Safety — hard constraints (never violate, no exceptions without human)

1. Never commit/push secrets, tokens, passwords, private keys, real
   customer PII. `context/DATA/` holds mock/seed/sanitized data only.
2. Never run destructive commands without explicit human approval:
   `rm -rf`, `git reset --hard`, `git push --force`, `shopify theme push
   --live`, any store-data deletion.
3. Never modify lockfiles, generated files, or `.git/` internals manually.
4. Never add a dependency (npm/gem/app) without justification + approval.
5. Never change Shopify scopes/permissions, checkout behavior, or payment
   configuration without explicit review.
6. Never bypass, delete, or weaken a failing test/check to go green.
7. Never mark a task complete with red/unknown verification.
8. Never expose an unpublished price, discount, or customer rule in
   client-readable docs beyond what the merchant approved.
