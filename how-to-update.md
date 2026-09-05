# 更新手順

このリポジトリは、各プロジェクトで共通して使うエージェント向け中核ルールを管理する。

## 前提

- 作業前に対象プロジェクトのローカル `AGENTS.md`、README、CI 定義、既存の更新手順を確認する。
- 共通ルールの変更は `AGENTS.md` に集約する。
- 変更履歴は `CHANGELOG.md` に記載する。

## 更新フロー

1. 変更したい共通ルールが、個別プロジェクト固有ではないことを確認する。
2. `AGENTS.md` を更新する。
3. `README.md`、この `how-to-update.md`、その他の運用文書を現状と照合し、不足や古い記述を補正する。スクリプトに影響する場合は `scripts/New-CommonAgentsLink.ps1` も更新する。
4. 各プロジェクトのローカル `AGENTS.md` に重複する共通ルールがあれば削除し、重要な共通項目はこのリポジトリの `AGENTS.md` に吸収する。
5. `CHANGELOG.md` の `## [Unreleased]` に変更点を追記する。
6. 完了前に文書の不足・矛盾・陳腐化を再確認し、Markdown の見出し、リンク、コードブロックと、記載手順・実ファイルとの整合性を検証する。
7. コミットする場合は、日本語 Conventional Commits 形式を使う。

## 検証

共通ルールと文書のみの変更では、主な検証は Markdown の内容確認と Git 差分確認とする。PowerShell スクリプトを変更する場合は、構文と対象環境での動作も確認する。

```powershell
git diff --check
git status --short
.\scripts\New-CommonAgentsLink.ps1 -WhatIf
```

Markdown lint や文書チェックを導入した場合は、この手順に追記する。

## ロールバック

誤った共通ルールを追加した場合は、該当箇所を戻し、`CHANGELOG.md` に修正内容を記録する。

既に各プロジェクトへ反映済みの場合は、対象プロジェクト側の `AGENTS.md` や参照文言も確認する。
