# myAGENTS固有の知見

このリポジトリ自身の作業前に全文を読む。他リポジトリへ適用する共通指示は [AGENTS.md](AGENTS.md)、用途別指示は各サブディレクトリの `AGENTS.md` を正本とする。

## 適用範囲と共通指針との関係

- 対象: 共通指針の「ドキュメント」「検証」「ローカル AGENTS.md との関係」。
- 理由・範囲: このリポジトリのルート `AGENTS.md` は、他リポジトリからも参照する共通指示の正本である。共通指示は同ファイルに残し、このリポジトリ自身の運用知見だけを本書へ分離する。SVG・Three.js/Blenderの各 `AGENTS.md` も用途別の純粋な指示であるため維持する。
- 代替手段・検証: 共通指示と固有知見の適用先を分け、文書の内容・リンク・コードブロックを照合する。コードやworkflow変更時の実行検証は [verification.md](verification.md) に従う。

## workflow変更PRの権限制約

このリポジトリでは、workflow ファイルを変更する Dependabot PR の自動マージが、GitHub App の `workflows` 権限不足で拒否されたことを確認しています。その場合は、対象 head の CI 成功と差分を確認し、workflow の変更権限を持つ認証でマージします。通常の `permissions` を広げるだけで解決したと扱わず、具体的な確認方法は [検証手順](verification.md#2026-10-15-dependabot-pr-6-の統合) を参照してください。

workflow ファイルを変更する PR のマージが `without workflows permission` で拒否された場合は、対象 head の CI と差分を確認し、workflow の変更権限を持つ認証済み GitHub CLI などでマージする。2026-10-15 にこのリポジトリで確認した制約とログの参照先は [検証手順](verification.md#2026-10-15-dependabot-pr-6-の統合) に記録している。マージ後にこのリポジトリ自身の呼び出し先 SHA も更新し、更新済み Action が実際に参照されることを確認する。

## .github/AGENTS.mdから移した構成・調査知見

- `.github/workflows/dependabot-pr.yml` は、このリポジトリの共通ワークフローを固定 SHA で呼び出す。共通ワークフロー内の Action を更新した後は、更新済みコミットへ呼び出し先も進める。手順は `how-to-update.md` を参照する。
- 2026-10-15 の調査では、workflow を変更する Dependabot PR の自動マージが GitHub App の `workflows` 権限不足で拒否されていた。CI 失敗とは区別し、対象 head の CI と差分を確認して、workflow の変更権限を持つ認証でマージする。根拠の実行ログは `verification.md` の「2026-10-15: Dependabot PR #6 の統合」を参照する。通常の workflow `permissions` の変更だけで解消したと判断しない。

## 文書の役割

ローカル `AGENTS.md` は純粋な指示と説明、本書は固有知見、[更新手順](how-to-update.md) は更新・復旧、[検証手順](verification.md) は検証と証跡を管理する。新しく判明した固有知見は本書へ記録し、共通ファイルへ混入させない。
