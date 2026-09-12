# TDD-<ID>: <Feature name>

- Feature: FEAT-<ID> · SPEC: `context/SPEC/<id>-<slug>.md`
- Status: Pending | Passing | Failed (overall)

## Test cases

### TC-001: <scenario>

- Covers: AC-00X
- Given: <preconditions, incl. theme-editor state / store data>
- When: <action>
- Then: <observable expected result>
- Verify by: preview (`shopify theme dev`) | check (`shopify theme check`) | inspect (code path)
- Status: Pending

### TC-002: <edge/failure scenario>

- …(same shape)…

## Merchant-config cases (mandatory)

- TC-M1: merchant reorders/removes the blocks → Then: …
- TC-M2: merchant changes each setting → Then: …

## Coverage map

| AC | TCs |
|----|-----|
| AC-001 | TC-001, … |
