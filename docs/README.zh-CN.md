# dev++

![dev++ 工作流概览](../assets/dev-plus-plus-intro.png)

dev++ 是一组面向 AI 辅助开发的通用 Codex skills。它的目标是让 AI 先问清楚、先调研、先找复用、先规划 API/功能契约和测试，再经过明确批准后执行。

## Skills

| Skill | 用途 |
| --- | --- |
| `dev-intake-approval` | 先澄清、探索、复用检查、契约/测试规划，并等待批准。 |
| `api-contract-inventory` | 从前端用户动线反查后端 API、契约、错误格式和断链。 |
| `frontend-reuse-workflow` | 扫描可复用组件和模板，优先模板化，并约束前端错误处理。 |
| `test-and-verify` | 发现并只运行已批准的测试、构建、lint 和验证命令。 |
| `git-change-control` | 在提交、推送、合并、打 tag、发布前做 Git 门禁检查。 |

## 常用命令

- `/dev-init`：初始化仓库上下文、API 清单、前端组件清单和复用地图。
- `/api-init`：初始化或刷新 API 与用户动线文档。
- `/frontend-init`：初始化或刷新前端组件和模板清单。
- `/dev-plan <需求>`：只调研、提问、查复用、定义契约/测试并出计划，不改代码。
- `/multi-agent-plan <需求>`：规划多 agent 分工和边界。
- `/verify-plan`：只规划验证命令，不运行。
- `/git-check`：只检查 Git 状态，不改变仓库。

## 安装

```bash
git clone https://github.com/Fubuki233/dev-plus-plus.git
cd dev-plus-plus
scripts/install.sh
```

安装脚本会把 skills 复制到 `${CODEX_HOME:-$HOME/.codex}/skills`。

## 文档约定

dev++ 建议把项目调研产物放在 `docs/ai-context/`。根索引保持简短，API 和前端清单按业务域拆分，每次只读取当前任务需要的文档，避免上下文膨胀。

如果项目没有现成约定，可以从 `templates/ai-context/` 复制初始结构。
