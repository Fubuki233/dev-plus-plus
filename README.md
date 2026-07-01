# dev++

![dev++ workflow overview](assets/dev-plus-plus-intro.png)

dev++ is a compact skill set for product discovery, agentic UI validation, and safer AI-assisted software development. It helps agents turn early ideas into PRDs, user stories, assumptions, validation plans, and test scenarios before moving into code. It can then validate UI stories in a real browser with screenshots. During development, it keeps agents from jumping straight into implementation, asks for missing decisions, inventories APIs and frontend reuse points, plans tests first, and gates verification and git actions.

Translations: [简体中文](docs/README.zh-CN.md) | [日本語](docs/README.ja.md)

## Development Skills

| Skill | Purpose |
| --- | --- |
| `dev-intake-approval` | Clarify, inspect, find reuse, define contracts/tests, and wait for approval. |
| `api-contract-inventory` | Map frontend user flows to backend APIs, contracts, errors, and gaps. |
| `frontend-reuse-workflow` | Inventory reusable UI, prefer templates, and enforce frontend error handling. |
| `test-and-verify` | Discover and run only approved tests, builds, lint, and checks. |
| `git-change-control` | Inspect and gate commits, pushes, merges, tags, and releases. |

## Product Discovery Skills

| Skill | Purpose |
| --- | --- |
| `create-prd` | Create a structured PRD with problem, objective, segment, value proposition, solution, and release framing. |
| `user-stories` | Break features into user stories with acceptance criteria using 3 C's and INVEST. |
| `job-stories` | Express user situations and motivations with JTBD-style job stories. |
| `wwas` | Create Why-What-Acceptance backlog items with strategic context. |
| `test-scenarios` | Turn user stories into acceptance-oriented test scenarios. |
| `identify-assumptions-new` | Map risky assumptions for a new product idea. |
| `identify-assumptions-existing` | Map risky assumptions for a feature in an existing product. |
| `prioritize-assumptions` | Prioritize assumptions by impact and risk, then suggest experiments. |
| `brainstorm-experiments-new` | Design lean startup experiments for a new product. |
| `brainstorm-experiments-existing` | Design low-effort validation experiments for an existing product feature. |
| `opportunity-solution-tree` | Map outcomes, opportunities, solutions, and experiments. |
| `interview-script` | Create customer interview scripts for discovery research. |
| `summarize-interview` | Summarize interview transcripts into JTBD-oriented insights and actions. |

## Agentic UI Testing Skills

| Skill | Purpose |
| --- | --- |
| `playwright-ui-automation` | Drive isolated browser sessions through Playwright CLI with screenshots, console inspection, and headed/headless modes. |
| `ui-story-validation` | Validate one UI story step by step, save screenshots, capture failures, and report parseable pass/fail results. |

## Native Commands

After install, dev++ exposes command entries for both Codex and Claude Code.

| Workflow | Codex | Claude Code |
| --- | --- | --- |
| Initialize repository context | `/prompts:dev-init` | `/dev-init` |
| Initialize API inventory | `/prompts:api-init` | `/api-init` |
| Initialize frontend inventory | `/prompts:frontend-init` | `/frontend-init` |
| Run product discovery | `/prompts:discovery-plan <idea>` | `/discovery-plan <idea>` |
| Run UI story review | `/prompts:ui-review [headed] [filter] [vision]` | `/ui-review [headed] [filter] [vision]` |
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

If `just` is installed, the same workflows are available as stable command aliases:

```bash
just --list
just install
just install-codex
just install-claude
just validate
just ui-review-help
just init-ui-review-stories
```

## Validate

```bash
scripts/validate.sh
```

or:

```bash
just validate
```

## Documentation Convention

dev++ recommends storing generated project intelligence under `docs/ai-context/`. Keep the root index small, split large API and frontend inventories by domain, and load details only when needed.

Use `templates/ai-context/` as a starter structure when a project has no existing convention.

For agentic UI review, store executable story YAML files under `ai_review/user_stories/`. Use `templates/ai-review/user_stories/example.yaml` as the starter format.
