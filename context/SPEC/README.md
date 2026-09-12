# SPEC/ — exact build contracts (what, and done-when?)

One file per independently implementable unit: `SPEC/<id>-<slug>.md`
(one SPEC = one worktree = one parallel unit). Created by `spec-generator`
from `.agent/templates/spec.md`. Each SPEC names its theme surfaces
(scope boundary), acceptance criteria, edge cases, non-goals, and
`depends_on` for ordering parallel work.
