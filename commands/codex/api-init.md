---
description: "dev++: initialize or refresh API contracts from frontend user flows"
argument-hint: "[scope or domain]"
---

Use $api-contract-inventory and $dev-intake-approval to initialize or refresh API documentation for this scope:

`$ARGUMENTS`

Rules:
- Start from frontend user stories and user flows; do not scan backend endpoints in isolation.
- Map each flow to frontend clients, backend handlers, DTOs, permissions, errors, side effects, and tests.
- Reconcile frontend-sent fields with backend-accepted request fields and frontend-used response fields.
- Record missing APIs, broken chains, unhandled errors, dead UI, and contract drift.
- Prefer existing docs. If none exist, propose `docs/ai-context/api/`.
- Do not edit files until the user explicitly approves the exact docs location and write plan.
- Mark unknowns as unknown; ask instead of inventing contracts.
