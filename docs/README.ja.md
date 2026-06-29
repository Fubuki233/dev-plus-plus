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

## Commands

- `/dev-init`: リポジトリ文脈、API 一覧、フロントエンド部品一覧、再利用マップを初期化する。
- `/api-init`: API とユーザーフロー文書を初期化または更新する。
- `/frontend-init`: フロントエンド部品とテンプレート一覧を初期化または更新する。
- `/dev-plan <request>`: 調査、質問、再利用確認、契約/テスト計画だけを行い、編集しない。
- `/multi-agent-plan <request>`: 複数 agent の分担と境界を計画する。
- `/verify-plan`: 検証コマンドだけを提案し、実行しない。
- `/git-check`: Git 状態だけを確認し、変更しない。

## Install

```bash
git clone https://github.com/Fubuki233/dev-plus-plus.git
cd dev-plus-plus
scripts/install.sh
```

インストーラーは skills を `${CODEX_HOME:-$HOME/.codex}/skills` にコピーします。

## Documentation

dev++ は、調査結果を `docs/ai-context/` に保存することを推奨します。ルート index は小さく保ち、API とフロントエンドの情報はドメインごとに分割し、必要な文書だけを読み込みます。

既存の規約がないプロジェクトでは、`templates/ai-context/` を初期構造として利用できます。
