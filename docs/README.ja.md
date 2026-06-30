# dev++

![dev++ workflow overview](../assets/dev-plus-plus-intro.png)

dev++ は、AI 支援開発を安全に進めるための汎用 Codex skills セットです。実装に入る前に、AI が不明点を確認し、既存実装を調査し、API/機能契約とテスト計画を整理し、明示的な承認後に作業することを重視します。

## Skills

| Skill | 目的 |
| --- | --- |
| `dev-intake-approval` | 要件確認、調査、再利用確認、契約/テスト計画、承認待ちを行う。 |
| `api-contract-inventory` | フロントエンドのユーザーフローから API、契約、エラー、欠落を整理する。 |
| `frontend-reuse-workflow` | 再利用可能な UI とテンプレートを棚卸しし、エラー処理を徹底する。 |
| `test-and-verify` | 承認されたテスト、ビルド、lint、検証だけを実行する。 |
| `git-change-control` | commit、push、merge、tag、release の前に Git 状態を確認する。 |

## Native Commands

インストール後、dev++ は Codex と Claude Code の両方にコマンド入口を提供します。

| Workflow | Codex | Claude Code |
| --- | --- | --- |
| リポジトリ文脈を初期化 | `/prompts:dev-init` | `/dev-init` |
| API 一覧を初期化 | `/prompts:api-init` | `/api-init` |
| フロントエンド一覧を初期化 | `/prompts:frontend-init` | `/frontend-init` |
| 開発依頼を計画 | `/prompts:dev-plan <request>` | `/dev-plan <request>` |
| 複数 agent 作業を計画 | `/prompts:multi-agent-plan <request>` | `/multi-agent-plan <request>` |
| 検証コマンドを計画 | `/prompts:verify-plan` | `/verify-plan` |
| Git 状態を確認 | `/prompts:git-check` | `/git-check` |

## Install

```bash
git clone https://github.com/Fubuki233/dev-plus-plus.git
cd dev-plus-plus
scripts/install.sh
```

インストーラーは次をコピーします。

- Codex skills: `${CODEX_HOME:-$HOME/.codex}/skills`
- Codex command prompts: `${CODEX_HOME:-$HOME/.codex}/prompts`
- Claude Code slash skills: `${CLAUDE_HOME:-$HOME/.claude}/skills`

片方だけインストールする場合:

```bash
scripts/install.sh --codex-only
scripts/install.sh --claude-only
```

## Documentation

dev++ は、調査結果を `docs/ai-context/` に保存することを推奨します。ルート index は小さく保ち、API とフロントエンドの情報はドメインごとに分割し、必要な文書だけを読み込みます。

既存の規約がないプロジェクトでは、`templates/ai-context/` を初期構造として利用できます。
