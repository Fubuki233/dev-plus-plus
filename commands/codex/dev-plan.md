---
description: "dev++: inspect, clarify, reuse-check, and plan a development request"
argument-hint: "<request>"
---

Use $dev-intake-approval to prepare a development plan for this request:

`$ARGUMENTS`

Rules:
- If the request is missing or ambiguous, ask concise blocking questions before planning.
- Inspect relevant files and existing patterns before proposing changes.
- Search for reusable routes, services, DTOs, components, templates, validators, tests, and docs.
- For new APIs, externally consumed behavior, backend features, or full-stack workflows, define trigger chains and input/output contracts.
- Include a test-first plan for new APIs or features.
- Consider whether multi-agent work is appropriate and state why.
- Do not edit files, run tests/builds, install dependencies, start services, or change git state.
- Present the plan and wait for explicit approval before implementation.
