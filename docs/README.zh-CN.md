# dev++

![dev++ 工作流概览](../assets/dev-plus-plus-intro.png)

dev++ 是一组面向产品发现、agentic UI 验证和 AI 辅助开发的通用 Codex skills。它可以先把早期想法整理成 PRD、User Stories、风险假设、验证实验和测试场景，再进入开发规划。之后可以根据测试方向生成可执行的 UI story YAML，等待用户批准，再用多 agent 在真实浏览器中验证批准后的 stories、保存截图，并输出 README 格式测试报告。进入开发阶段后，它会让 AI 先问清楚、先调研、先找复用、先规划 API/功能契约和测试，再经过明确批准后执行。

## 开发 Skills

| Skill | 用途 |
| --- | --- |
| `dev-intake-approval` | 先澄清、探索、复用检查、契约/测试规划，并等待批准。 |
| `api-contract-inventory` | 从前端用户动线反查后端 API、契约、错误格式和断链。 |
| `frontend-reuse-workflow` | 扫描可复用组件和模板，优先模板化，并约束前端错误处理。 |
| `test-and-verify` | 发现并只运行已批准的测试、构建、lint 和验证命令。 |
| `git-change-control` | 在提交、推送、合并、打 tag、发布前做 Git 门禁检查。 |

## 产品发现 Skills

| Skill | 用途 |
| --- | --- |
| `create-prd` | 生成包含问题、目标、用户群、价值主张、方案和发布范围的 PRD。 |
| `user-stories` | 按 3C 和 INVEST 把功能拆成带验收标准的 User Stories。 |
| `job-stories` | 用 JTBD 方式表达用户场景、动机和目标结果。 |
| `wwas` | 生成 Why-What-Acceptance 格式的 backlog item。 |
| `test-scenarios` | 从 User Stories 生成面向验收的测试场景。 |
| `identify-assumptions-new` | 识别新产品想法中的高风险假设。 |
| `identify-assumptions-existing` | 识别既有产品功能中的高风险假设。 |
| `prioritize-assumptions` | 按影响和风险排序假设，并给出验证建议。 |
| `brainstorm-experiments-new` | 为新产品设计低成本验证实验。 |
| `brainstorm-experiments-existing` | 为既有产品功能设计低成本验证实验。 |
| `opportunity-solution-tree` | 梳理目标、机会、方案和实验。 |
| `interview-script` | 生成用于产品发现的用户访谈脚本。 |
| `summarize-interview` | 把访谈记录整理为 JTBD 洞察和行动项。 |

## Agentic UI Testing Skills

| Skill | 用途 |
| --- | --- |
| `playwright-ui-automation` | 通过 Playwright CLI 驱动隔离浏览器会话，支持截图、console 检查和 headless/headed 模式。 |
| `ui-story-validation` | 先生成需批准的 YAML UI stories，再逐步验证批准后的 stories，保存截图，捕获失败，并输出可解析的 pass/fail 结果。 |

## 原生命令

安装后，dev++ 同时提供 Codex 和 Claude Code 的命令入口。

| 工作流 | Codex | Claude Code |
| --- | --- | --- |
| 初始化仓库上下文 | `/prompts:dev-init` | `/dev-init` |
| 初始化 API 清单 | `/prompts:api-init` | `/api-init` |
| 初始化前端清单 | `/prompts:frontend-init` | `/frontend-init` |
| 进行产品发现 | `/prompts:discovery-plan <想法>` | `/discovery-plan <想法>` |
| 运行 UI story review | `/prompts:ui-review [direction\|filter] [headed] [vision]` | `/ui-review [direction\|filter] [headed] [vision]` |
| 规划开发需求 | `/prompts:dev-plan <需求>` | `/dev-plan <需求>` |
| 规划多 agent 分工 | `/prompts:multi-agent-plan <需求>` | `/multi-agent-plan <需求>` |
| 规划验证命令 | `/prompts:verify-plan` | `/verify-plan` |
| 检查 Git 状态 | `/prompts:git-check` | `/git-check` |

## 安装

```bash
git clone https://github.com/Fubuki233/dev-plus-plus.git
cd dev-plus-plus
scripts/install.sh
```

安装脚本会复制：

- Codex skills 到 `${CODEX_HOME:-$HOME/.codex}/skills`。
- Codex 命令 prompts 到 `${CODEX_HOME:-$HOME/.codex}/prompts`。
- Claude Code slash skills 到 `${CLAUDE_HOME:-$HOME/.claude}/skills`。

只安装某一端：

```bash
scripts/install.sh --codex-only
scripts/install.sh --claude-only
```

如果已经安装 `just`，也可以使用稳定的命令别名：

```bash
just --list
just install
just install-codex
just install-claude
just validate
just ui-review-help
just init-ui-review-stories
```

## 验证

```bash
scripts/validate.sh
```

或：

```bash
just validate
```

## 文档约定

dev++ 建议把项目调研产物放在 `docs/ai-context/`。根索引保持简短，API 和前端清单按业务域拆分，每次只读取当前任务需要的文档，避免上下文膨胀。

如果项目没有现成约定，可以从 `templates/ai-context/` 复制初始结构。

Agentic UI review 的可执行 story YAML 默认放在 `ai_review/user_stories/`。可以用 `templates/ai-review/user_stories/example.yaml` 作为起始模板。当用户提供测试方向而不是 YAML 文件时，`ui-review` 会先按同一个 `stories:` schema 生成 stories 并等待批准；批准后使用可用的多 agent 浏览器验证，最后输出 README 格式测试报告。
