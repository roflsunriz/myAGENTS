# 調査知見

- workflowファイルを変更するDependabot PRは、GitHub Appの `workflows` 権限不足でマージを拒否されることがある。CI失敗とは区別し、headのCIと差分を確認後、workflow権限を持つ認証でマージする（[実例](verification.md#2026-10-15-dependabot-pr-6-の統合)）。
- `.github/workflows/dependabot-pr.yml` は共通workflowを固定SHAで呼ぶ。共通workflow内のAction更新後は呼出し先SHAも進め、更新済み実装を実際に参照していることを確認する。
- ルート `AGENTS.md` は他リポジトリも参照する共通指示の正本。固有知見を混ぜず、SVG・Three.js/Blenderの指示は各サブディレクトリに置く。
