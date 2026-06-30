---
description: "dev++: initialize repository context, API/frontend inventories, and reuse map"
argument-hint: "[scope or path]"
---

Use $dev-intake-approval, $api-contract-inventory, $frontend-reuse-workflow, and $git-change-control to initialize repository context for this scope:

`$ARGUMENTS`

Rules:
- Read project instructions first: root and nested `AGENTS.md`, README, and relevant project docs.
- Inspect architecture, runtime/test constraints, git rules, docs conventions, and ownership boundaries.
- Check whether `docs/ai-context/` or an equivalent project intelligence folder exists.
- Scan API, frontend, reusable implementation, shared template, and verification surfaces at a high level.
- Identify gaps, broken workflow chains, missing docs, and unclear requirements.
- Do not edit files, run tests/builds, install dependencies, start services, or change git state.
- If durable docs should be created or refreshed, propose the exact file plan and wait for approval.
- Output a concise initialization report with findings, risks, questions, and recommended next commands.
