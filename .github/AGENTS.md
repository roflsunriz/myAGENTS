# GitHub 運用の追加指針

共通ルールは `../AGENTS.md` を全文読み、上位方針として扱う。

- `.github/workflows/dependabot-pr.yml` は、このリポジトリの共通ワークフローを固定 SHA で呼び出す。共通ワークフロー内の Action を更新した後は、更新済みコミットへ呼び出し先も進める。手順は `../how-to-update.md` を参照する。
- 2026-10-15 の調査では、workflow を変更する Dependabot PR の自動マージが GitHub App の `workflows` 権限不足で拒否されていた。CI 失敗とは区別し、対象 head の CI と差分を確認して、workflow の変更権限を持つ認証でマージする。根拠の実行ログは `../verification.md` の「2026-10-15: Dependabot PR #6 の統合」を参照する。通常の workflow `permissions` の変更だけで解消したと判断しない。
