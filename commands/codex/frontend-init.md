---
description: "dev++: initialize or refresh frontend component and template inventory"
argument-hint: "[scope, route, or frontend path]"
---

Use $frontend-reuse-workflow and $dev-intake-approval to initialize or refresh frontend inventory for this scope:

`$ARGUMENTS`

Rules:
- Scan routes, pages, shells, layouts, navigation, components, templates, forms, lists, dialogs, toasts, charts, states, style tokens, icon systems, i18n patterns, and frontend API clients.
- Identify reusable components, recurring UI patterns, and template candidates.
- Document loading, empty, error, disabled, permission, and conflict state patterns.
- Check how frontend API payloads and response usage map to backend contracts.
- Prefer existing docs. If none exist, propose `docs/ai-context/frontend/`.
- Do not edit files until the user explicitly approves the exact docs location and write plan.
- Output reusable assets found, template opportunities, gaps, risks, and questions.
