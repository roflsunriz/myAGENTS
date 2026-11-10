# 調査知見

- Dependabot の version update は毎月28日00:00、月末一括 merge は同日18:00（いずれも `Asia/Tokyo`）を共通運用とする。GitHub Actions の標準 cron では月末日を一式で表せないため、全月に存在する28日を月末処理日として固定する。
- workflowファイルを変更するDependabot PRは、GitHub Appの `workflows` 権限不足でマージを拒否されることがある。CI失敗とは区別し、headのCIと差分を確認後、workflow権限を持つ認証でマージする（[実例](verification.md#2026-10-15-dependabot-pr-6-の統合)）。
- `.github/workflows/dependabot-pr.yml` は共通workflowを固定SHAで呼ぶ。共通workflow内のAction更新後は呼出し先SHAも進め、更新済み実装を実際に参照していることを確認する。
- ルート `AGENTS.md` は他リポジトリも参照する共通指示の正本。固有知見を混ぜず、SVG・Three.js/Blenderの指示は各サブディレクトリに置く。

## 実サイト検証と UI デザイン方針の根拠

- 判明事項: 2026-11-10 のユーザー指示は、実サイトの追加試行に対する都度承認を不要にしつつ、無限試行を禁じるもの。数値の指定はないため、共通指針の既定値を追加2回（初回込み3回）とした。依頼・既存許可の範囲で適用し、tool や session の変更で上限を回避しない。更新時は `verification.md` の判断例で停止条件を再確認する。
- 判明事項: 2026-11-10 に [SAP Fundamental Styles の公式 README](https://github.com/SAP/fundamental-styles#readme) の Theming と SLA を確認した。framework 非依存の CSS 部品、CSS Custom Properties によるテーマ、部品ごとに閉じたスタイル、semantic HTML・ARIA・色のコントラストを重視している。
- 成立条件・範囲: 今回はこの考え方を共通 UI 指針へ採用した。ライブラリや特定 version の採用判断ではなく、実際の UI の準拠・操作性を検証した結果でもない。利用先ではユーザーの参照・既存設計と照合し、実装に必要な公式の部品・テーマ仕様を改めて確認する。
