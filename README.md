# dev++

![dev++ workflow overview](assets/dev-plus-plus-intro.png)

dev++ is a compact skill set for safer AI-assisted software development. It keeps agents from jumping straight into code, asks for missing decisions, inventories APIs and frontend reuse points, plans tests first, and gates verification and git actions.

Translations: [简体中文](docs/README.zh-CN.md) | [日本語](docs/README.ja.md)

## Skills

| Skill | Purpose |
| --- | --- |
| `dev-intake-approval` | Clarify, inspect, find reuse, define contracts/tests, and wait for approval. |
| `api-contract-inventory` | Map frontend user flows to backend APIs, contracts, errors, and gaps. |
| `frontend-reuse-workflow` | Inventory reusable UI, prefer templates, and enforce frontend error handling. |
| `test-and-verify` | Discover and run only approved tests, builds, lint, and checks. |
| `git-change-control` | Inspect and gate commits, pushes, merges, tags, and releases. |

## Manual Commands

- `/dev-init`: initialize repository context, API inventory, frontend inventory, and reuse map.
- `/api-init`: initialize or refresh API and user-flow documentation.
- `/frontend-init`: initialize or refresh frontend component and template inventory.
- `/dev-plan <request>`: inspect, ask, reuse-check, define contracts/tests, and plan without editing.
- `/multi-agent-plan <request>`: split work into safe ownership scopes.
- `/verify-plan`: propose verification commands without running them.
- `/git-check`: inspect git state without changing it.

## Install

```bash
git clone https://github.com/Fubuki233/dev-plus-plus.git
cd dev-plus-plus
scripts/install.sh
```

The installer copies skills into `${CODEX_HOME:-$HOME/.codex}/skills`.

## Validate

```bash
scripts/validate.sh
```

## Documentation Convention

dev++ recommends storing generated project intelligence under `docs/ai-context/`. Keep the root index small, split large API and frontend inventories by domain, and load details only when needed.

Use `templates/ai-context/` as a starter structure when a project has no existing convention.
