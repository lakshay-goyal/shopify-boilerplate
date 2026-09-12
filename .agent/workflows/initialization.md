# Workflow: initialization

For a new agent entering the repo, or a new client project kickoff.

1. Read `.agent/AGENT.md`, `.agent/state/progress.md`, `context/README.md`.
2. Follow `.agent/instructions/initialization.md` (discover, don't code).
3. If `context/RFC/` is empty: interview the human (client brief, brand,
   catalog shape, POD/dropshipping vs inventory, markets) then invoke
   `rfc-generator`.
4. If RFC exists but no SPECs: invoke `spec-generator`, then `tdd-generator`
   per SPEC, then `ecommerce-check` on the RFC before any implementation.
5. Record the execution plan in `progress.md`: SPEC → worktree mapping,
   dependency order, parallel batches.
