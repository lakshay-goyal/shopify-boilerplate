# Workflow: handoff

Client handoff for a finished milestone or project.

1. Confirm `test-review` green on base + all SPECs show `completed` in
   `FEATURES/feature-list.json`.
2. Per merged feature: INSIGHT html via `.agent/templates/insight.html`
   (non-technical, old-vs-new, decisions, limits).
3. Refresh `context/HANDOFF/` (overview, client customization guide,
   limitations, roadmap, deployment notes).
4. Refresh `context/CHANGELOG/CHANGELOG.md` (product language).
5. Tell the human: what shipped, where the insights are, what remains in
   `progress.md` → Remaining Work.
