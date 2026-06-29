---
name: frontend-reuse-workflow
description: "Use when first working on a frontend project or when planning, designing, or implementing visible UI, pages, components, frontend API calls, states, or templates. Guides Codex to inventory reusable components and templates, prefer reuse over bespoke UI, propose shared templates for recurring patterns, and ensure frontend request parameters and error handling match backend contracts."
---

# Frontend Reuse Workflow

## First-Time Frontend Inventory

When first working on a frontend codebase, scan and document reusable UI assets before planning new UI:

- Routes, pages, shells, layouts, and navigation.
- Components, templates, cards, lists, tables, filters, forms, field controls, dialogs, drawers, popovers, toasts, and charts.
- Loading, empty, error, disabled, permission, and conflict states.
- Style tokens, theme variables, responsive helpers, icon systems, and i18n patterns.
- Frontend API clients and request/response mapping.

Use the project's existing docs location. If none exists, propose `docs/ai-context/frontend/` and ask before writing.

## Reuse Gate

Before implementing visible UI:

1. Read the frontend inventory if available.
2. Search existing components, templates, style tokens, API clients, and page patterns.
3. Prefer reuse or composition over bespoke UI.
4. If a UI element is not unique to one screen and is likely to recur, recommend turning it into a reusable component or template.
5. Before creating a shared component or template, explain its responsibility, reuse scope, affected pages, and why existing pieces are insufficient.
6. Wait for approval when project workflow requires it.

## Error Handling Gate

Every frontend API action must handle applicable states:

- Loading.
- Success.
- Empty.
- Validation error.
- Authentication or permission error.
- Not found.
- Conflict or stale state.
- Server error.
- Network failure.

No user-facing action may fail silently. Show user-visible, actionable messages and never expose raw stack traces. Request payloads must match backend contracts exactly: no undocumented extra params and no missing required params. If the backend error format is not catchable by the frontend, request or plan the backend change.

## UI Plan Fields

Include these fields in frontend plans:

- Existing components/templates checked.
- Reusable component/template selected.
- New shared component needed: yes/no.
- If yes, responsibility and reuse scope.
- API request payload and response fields used.
- Frontend error states and user messages.
- Accessibility, responsive, loading, empty, and permission states.

Read `references/frontend-doc-templates.md` for inventory templates.
