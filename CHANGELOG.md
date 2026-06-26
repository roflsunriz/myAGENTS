# Changelog

このプロジェクトの重要な変更はすべてこのファイルに記録します。

書式は [Keep a Changelog](https://keepachangelog.com/ja/1.1.0/) に基づきます。

## [Unreleased]

### Added

- 共通ルールを集約する `AGENTS.md` を追加。
- リポジトリの目的と使い方を説明する `README.md` を追加。
- 共通ルールの更新手順をまとめた `how-to-update.md` を追加。
- 各リポジトリに `COMMON-AGENTS.md` シンボリックリンクを作成する `scripts/New-CommonAgentsLink.ps1` を追加。
- `COMMON-AGENTS.md` を Git 管理外にする `.gitignore` を追加。
- ケバブケース命名と `any` 回避を共通の実装方針として追加。
- データストレージのミグレーション、バージョンチェック、破損データリカバリ方針を追加。
- Chrome CDP と Firefox RDP / Marionette を使うブラウザ検証方針を追加。
- ブラウザ検証手段をユーザー向け説明へ不要に露出しない方針を追加。
- 作業前確認、依存関係、生成物、秘密情報、エラー対応、ドキュメント更新、テスト設計の共通ルールを追加。
- ユーザー向け UI で日本語と総話者数上位10言語を優先する多言語対応方針を追加。
