# BRAINSTORM/ — ideas before commitments

Phase 1 thinking lives here: company understanding, competitor and
customer research pointers, recommended theme direction, and the
question list the human must answer. Nothing here is a requirement —
requirements start at `context/RFC/`.

## Structure

```
context/BRAINSTORM/
├── README.md              # this file
└── <id>-<slug>/           # one folder per idea, e.g. 001-bluewidgets/
    ├── brainstorm.md      # company, competitors, customers, theme direction
    └── Q&A.md             # grouped questions: legal, policies, refunds,
                           #   shipping/COD, contact, socials, assets, unknowns
```

## Lifecycle

1. `/brainstorming` (skill `brainstorming`) creates the folder, both
   files starting as `draft` / `Pending`.
2. Human answers every question in `Q&A.md` (Answered or Deferred).
3. Phase 2 (`initialization` workflow) consumes the folder: RFC + SPECs
   + TDD list + Excalidraw diagrams + client insight. Sets status
   `consumed`. Never edit a consumed brainstorm — amend the RFC instead.

## Rules for agents

- Research notes referenced from brainstorms live under
  `context/RESEARCH/` (competitors, customer-research, shopify).
- Reference screenshots/moodboards are posture inspiration only —
  never copy, content, or requirements.
- One idea = one folder. New direction → new ID, never overwrite.
