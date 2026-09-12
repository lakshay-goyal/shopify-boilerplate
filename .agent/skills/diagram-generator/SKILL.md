# Skill: diagram-generator (Excalidraw)

## Purpose

Record each product decision, user flow, and workflow as a visual diagram
in `context/EXCALIDRAW/` — decisions only, never code structure.

## When to use

After an RFC is accepted, after a SPEC decision, or when the human wants
"a diagram of X". No code changes in this skill, ever.

## Preconditions

- Source RFC/SPEC/decision read and understood.

## Inputs

- `source`: RFC/SPEC/DECISION path (required).
- `category`: `user-flows/` | `workflows/` | `architecture/` (required).
- `slug`: file name, e.g. `checkout-flow` (required).

## Procedure

1. Identify actors (shopper, merchant), steps, decisions, end states from
   the source. Keep it non-technical (no code, no file names).
2. Write a valid Excalidraw scene to
   `context/EXCALIDRAW/<category>/<slug>.excalidraw` (JSON with
   `"type": "excalidraw"`, elements: rectangles for steps, diamonds for
   decisions, arrows labeled with user actions; append source + date in
   `appState` or a bound text element).
3. Verify the JSON parses (`python3 -m json.tool`).
4. Link it from the source SPEC/RFC (`Related diagrams`) and from
   `context/EXCALIDRAW/README.md`.

## Expected output

- One `.excalidraw` source file, parseable, human-readable in Excalidraw.
- Back-links from SPEC/RFC.

## Verification

- JSON parses; elements use only shapes/arrows/text (no embedded code).
- A non-technical reader can follow the flow without the codebase.

## Failure handling

Source ambiguous → diagram only the decided parts, mark undecided branches
`OPEN`, list them in the summary. Never invent flow steps.
