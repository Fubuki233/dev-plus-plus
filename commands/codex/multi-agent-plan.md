---
description: "dev++: split a development request into safe multi-agent ownership scopes"
argument-hint: "<request>"
---

Use $dev-intake-approval to evaluate and plan multi-agent work for this request:

`$ARGUMENTS`

Rules:
- If the request is missing or ambiguous, ask concise blocking questions.
- Inspect relevant code paths and ownership boundaries before proposing workers.
- Use multi-agent work only when scopes can be disjoint and shared contracts can be explicit.
- Do not use multi-agent work for small single-file fixes, read-only explanations, tightly coupled changes, or unresolved product ambiguity.
- State coordinator responsibilities, worker scopes, shared contracts, files/modules owned by each worker, verification boundaries, and integration risks.
- Do not start workers, edit files, run tests/builds, install dependencies, start services, or change git state until the user explicitly approves.
