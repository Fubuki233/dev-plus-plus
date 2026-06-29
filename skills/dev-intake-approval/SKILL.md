---
name: dev-intake-approval
description: "Use before software development work that may change code, configuration, documentation, tests, runtime state, git history, or deployment. Enforces a clarification-first workflow: inspect project context, ask instead of assuming, scan for reusable implementations, define trigger chains, input/output contracts, and test plans for new features or APIs, consider multi-agent work, present a plan, and wait for explicit approval before action."
---

# Dev Intake Approval

## Core Rule

Do not move from analysis to action until the user explicitly approves the concrete plan. Reading files, searching, and inspecting state are allowed. Editing files, running tests or builds, changing git state, installing dependencies, deleting files, migrating data, starting services, or deploying requires approval.

If anything is unclear, ask. Do not fill missing requirements by convention, framework defaults, or personal preference.

## Manual Commands

Treat these user messages as explicit workflow commands:

- `/dev-init`: initialize repository context. Read project instructions, inspect architecture, check for `docs/ai-context/`, scan API and frontend inventory surfaces, and report documentation gaps. Ask before writing docs if the location or format is unclear.
- `/dev-plan <request>`: inspect relevant code, ask blocking questions, find reusable implementations, define contracts and tests, and present a plan without editing.
- `/multi-agent-plan <request>`: evaluate whether the work should be split across agents and present ownership boundaries before implementation.
- `/verify-plan`: propose verification commands without running them.
- `/git-check`: inspect branch, worktree, remotes, and risk without changing git state.

## Intake Workflow

1. Read repository instructions first: root `AGENTS.md`, nested `AGENTS.md` under touched paths, README, and project-specific docs.
2. Read `docs/ai-context/INDEX.md` if it exists. Load only relevant linked files.
3. Inspect relevant files and existing patterns with fast search tools such as `rg`.
4. Identify uncertainty in scope, behavior, UX, API contracts, data impact, compatibility, verification, and git/deployment expectations.
5. Ask concise questions for any uncertainty that changes correctness or scope.
6. Search for reusable routes, services, DTOs, components, templates, validators, tests, and docs before proposing new code.
7. For new APIs, externally consumed behavior, backend features, or full-stack workflows, define the trigger chain and input/output contracts before implementation.
8. Present a plan and wait for explicit approval.

## Feature Contract Plan

For a new API or feature, include:

- User stories and roles.
- Trigger chain: UI action, route, command, event, job, or service entry point.
- Downstream calls and services.
- Data reads and writes.
- Request format: path, query, body, headers, auth, permissions, and validation.
- Response format and structured error format.
- Side effects: messages, events, notifications, cache invalidation, files, billing, audit logs, or background jobs.
- Test-first coverage: unit, contract/API, permission, integration/workflow, frontend/client, and regression tests.
- Reuse analysis and why any new implementation is necessary.

## Multi-Agent Development

Automatically evaluate multi-agent work when a task spans independent ownership areas such as backend plus frontend, API plus docs, multiple modules, UI plus state plus tests, or deployment plus code.

Use multi-agent work only when scopes can be disjoint and shared contracts can be explicit. Do not use it for small single-file fixes, read-only explanations, tightly coupled changes, or tasks with unresolved product ambiguity.

Coordinator responsibilities:

1. Inspect project instructions and relevant code before planning.
2. Assign disjoint file or module scopes.
3. State shared contracts: APIs, DTOs, events, routes, permissions, i18n keys, storage, tests, and docs.
4. Wait for approval before implementation.
5. Review worker output, integrate changes, resolve conflicts, and summarize.

Worker responsibilities:

1. Stay within assigned scope.
2. Write a short local plan before editing.
3. Do not revert unrelated user or agent changes.
4. Do not run tests or builds unless approved.
5. Report changed files, contracts, checks, and risks.

## Documentation

Use `docs/ai-context/` for durable AI-facing project knowledge unless the project already defines another location. Read `references/context-docs.md` for the recommended structure and context-size controls.
