---
name: api-contract-inventory
description: "Use when initializing, auditing, creating, or changing APIs, DTOs, frontend API clients, permissions, user flows, or full-stack contracts. Guides Codex to scan from frontend user stories to backend endpoints, document request/response/error contracts, reconcile frontend-sent and backend-accepted parameters, cover all workflows, and record gaps, broken chains, missing APIs, and system shortcomings."
---

# API Contract Inventory

## Scan From User Flows

Do not scan backend endpoints in isolation. Start from visible frontend user stories and map each workflow to backend contracts.

For each user story, record:

- User role and goal.
- Frontend route, page, component, or command.
- User action sequence.
- Frontend API client method and call sites.
- Endpoint path and HTTP method.
- Request path, query, body, headers, auth, and permissions.
- Backend route registration, handler, service, model, and DTO conversion.
- Response shape and fields used by frontend.
- Error cases and frontend handling.
- State changes and side effects.
- Related tests.
- Missing, disconnected, dead, or undocumented links.

## Contract Reconciliation

For every frontend API call:

1. Compare frontend-sent params with backend-accepted params.
2. Treat extra frontend params and missing required params as contract defects.
3. Verify response fields used by frontend exist in backend responses.
4. Verify backend error responses are structured and distinguishable by frontend.
5. Record required, optional, defaulted, ignored, and rejected fields.
6. Prefer shared schemas, generated clients, or contract tests where the project supports them.

## Documentation Output

Use the repository's existing API docs location. If none exists, propose `docs/ai-context/api/` and ask before writing.

Recommended structure:

- `api/user-flows/`: role-based user stories and action chains.
- `api/endpoints/`: endpoint inventory by domain.
- `api/contracts/`: request, response, error, permission, and consumer contracts.
- `api/gaps.md`: current shortcomings, broken chains, missing APIs, dead UI, unhandled errors, and contract drift.

Read `references/api-doc-templates.md` for compact templates.

## Update Rules

- Document current behavior, not progress history.
- Mark uncertainty as unknown; do not invent contracts.
- Keep one domain per file when the project is large.
- Update the nearest index and `docs-map.json` when adding new documents under `docs/ai-context/`.
