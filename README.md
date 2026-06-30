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

## Native Commands

After install, dev++ exposes command entries for both Codex and Claude Code.

| Workflow | Codex | Claude Code |
| --- | --- | --- |
| Initialize repository context | `/prompts:dev-init` | `/dev-init` |
| Initialize API inventory | `/prompts:api-init` | `/api-init` |
| Initialize frontend inventory | `/prompts:frontend-init` | `/frontend-init` |
| Plan a development request | `/prompts:dev-plan <request>` | `/dev-plan <request>` |
| Plan multi-agent work | `/prompts:multi-agent-plan <request>` | `/multi-agent-plan <request>` |
| Plan verification | `/prompts:verify-plan` | `/verify-plan` |
| Inspect git state | `/prompts:git-check` | `/git-check` |

## Install

```bash
git clone https://github.com/Fubuki233/dev-plus-plus.git
cd dev-plus-plus
scripts/install.sh
```

The installer copies:

- Codex skills into `${CODEX_HOME:-$HOME/.codex}/skills`.
- Codex command prompts into `${CODEX_HOME:-$HOME/.codex}/prompts`.
- Claude Code slash skills into `${CLAUDE_HOME:-$HOME/.claude}/skills`.

Install only one side when needed:

```bash
scripts/install.sh --codex-only
scripts/install.sh --claude-only
```

## Validate

```bash
scripts/validate.sh
```

## Documentation Convention

dev++ recommends storing generated project intelligence under `docs/ai-context/`. Keep the root index small, split large API and frontend inventories by domain, and load details only when needed.

Use `templates/ai-context/` as a starter structure when a project has no existing convention.
