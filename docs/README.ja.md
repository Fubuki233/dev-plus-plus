# dev++

![dev++ workflow overview](../assets/dev-plus-plus-intro.png)

dev++ は、プロダクト発見、agentic UI 検証、AI 支援開発を安全に進めるための汎用 Codex skills セットです。初期アイデアを PRD、User Stories、リスク仮説、検証実験、テストシナリオに整理してから開発計画へ進めます。その後、テスト方針から実行可能な UI story YAML を生成し、ユーザー承認を待ってから、承認済み stories を複数 agent の実ブラウザとスクリーンショットで検証し、テストスクリーンショット付きの README 形式レポートを返します。失敗した story には、元のユーザーストーリー、完全なトリガーチェーン、失敗スクリーンショット、手動再現手順を含めます。開発段階では、AI が不明点を確認し、既存実装を調査し、API/機能契約とテスト計画を整理し、明示的な承認後に作業することを重視します。

## Development Skills

| Skill | 目的 |
| --- | --- |
| `dev-intake-approval` | 要件確認、調査、再利用確認、契約/テスト計画、承認待ちを行う。 |
| `api-contract-inventory` | フロントエンドのユーザーフローから API、契約、エラー、欠落を整理する。 |
| `frontend-reuse-workflow` | 再利用可能な UI とテンプレートを棚卸しし、エラー処理を徹底する。 |
| `test-and-verify` | 承認されたテスト、ビルド、lint、検証だけを実行する。 |
| `git-change-control` | commit、push、merge、tag、release の前に Git 状態を確認する。 |

## Product Discovery Skills

| Skill | 目的 |
| --- | --- |
| `create-prd` | 問題、目的、セグメント、価値提案、解決策、リリース範囲を含む PRD を作成する。 |
| `user-stories` | 3 C's と INVEST に沿って、受け入れ条件付きの User Stories を作成する。 |
| `job-stories` | JTBD 形式でユーザー状況、動機、望む結果を表現する。 |
| `wwas` | Why-What-Acceptance 形式の backlog item を作成する。 |
| `test-scenarios` | User Stories から受け入れテスト向けのシナリオを作成する。 |
| `identify-assumptions-new` | 新規プロダクトアイデアのリスク仮説を整理する。 |
| `identify-assumptions-existing` | 既存プロダクト機能のリスク仮説を整理する。 |
| `prioritize-assumptions` | 影響度とリスクで仮説を優先順位付けし、検証案を出す。 |
| `brainstorm-experiments-new` | 新規プロダクト向けの低コスト検証実験を設計する。 |
| `brainstorm-experiments-existing` | 既存プロダクト機能向けの低コスト検証実験を設計する。 |
| `opportunity-solution-tree` | outcome、opportunity、solution、experiment を整理する。 |
| `interview-script` | プロダクト発見のための顧客インタビュー台本を作成する。 |
| `summarize-interview` | インタビュー記録を JTBD インサイトと action items に整理する。 |

## Agentic UI Testing Skills

| Skill | 目的 |
| --- | --- |
| `playwright-ui-automation` | Playwright CLI で隔離ブラウザセッションを操作し、スクリーンショット、console 確認、headless/headed モードを扱う。 |
| `ui-story-validation` | 承認前提の YAML UI stories を生成し、承認済み stories を段階的に検証し、テストスクリーンショットと失敗スクリーンショットを保存し、再現情報付きの解析可能な pass/fail 結果を出す。 |

## Native Commands

インストール後、dev++ は Codex と Claude Code の両方にコマンド入口を提供します。

| Workflow | Codex | Claude Code |
| --- | --- | --- |
| リポジトリ文脈を初期化 | `/prompts:dev-init` | `/dev-init` |
| API 一覧を初期化 | `/prompts:api-init` | `/api-init` |
| フロントエンド一覧を初期化 | `/prompts:frontend-init` | `/frontend-init` |
| プロダクト発見を計画 | `/prompts:discovery-plan <idea>` | `/discovery-plan <idea>` |
| UI story review を実行 | `/prompts:ui-review [direction\|filter] [headed] [vision]` | `/ui-review [direction\|filter] [headed] [vision]` |
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

`just` がインストール済みの場合は、同じ workflow を安定したコマンド別名で実行できます。

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

または:

```bash
just validate
```

## Documentation

dev++ は、調査結果を `docs/ai-context/` に保存することを推奨します。ルート index は小さく保ち、API とフロントエンドの情報はドメインごとに分割し、必要な文書だけを読み込みます。

既存の規約がないプロジェクトでは、`templates/ai-context/` を初期構造として利用できます。

Agentic UI review の実行可能な story YAML は、既定で `ai_review/user_stories/` に置きます。`templates/ai-review/user_stories/example.yaml` を初期テンプレートとして利用できます。ユーザーが YAML ファイルではなくテスト方針を指定した場合、`ui-review` は同じ `stories:` schema で stories を提案し、承認を待ちます。承認後は利用可能な複数 agent でブラウザ検証を行い、最後にテストスクリーンショット付きの README 形式レポートを出力します。失敗した story には、元のユーザーストーリー、完全なトリガーチェーン、失敗スクリーンショット、console/network 証拠、手動再現手順を含める必要があります。
