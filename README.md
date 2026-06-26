# myAGENTS

`myAGENTS` は、複数のローカルリポジトリで共通して使うコーディングエージェント向けの中核ルールを管理するリポジトリです。

対象の主な作業場所:

- `C:\Users\UserName\Documents`
- `C:\filter-matome`

## 方針

- 共通ルールはこのリポジトリの `AGENTS.md` に集約する。
- 各プロジェクト固有の説明、起動方法、設計詳細、例外事項は各プロジェクトのローカル `AGENTS.md` に任せる。
- 変更履歴は Keep a Changelog 形式の `CHANGELOG.md` で管理する。
- 更新手順は `how-to-update.md` またはプロジェクト事情に応じて `docs/UPDATE.md` にまとめる。

## 使い方

各プロジェクトの直下に `COMMON-AGENTS.md` というシンボリックリンクを作り、ローカル `AGENTS.md` から参照します。

管理者として PowerShell を開き、次を実行します。

```powershell
.\scripts\New-CommonAgentsLink.ps1
```

各プロジェクトの `.gitignore` には `COMMON-AGENTS.md` を追加し、シンボリックリンク自体は Git 管理外にします。

例:

```markdown
# AGENTS.md

共通ルールは `COMMON-AGENTS.md` を必ず確認し、上位方針として扱う。

このプロジェクト固有の情報を以下に記載する。
```

## 管理対象

このリポジトリには、横断的に重要な作業規律だけを置きます。個別プロジェクトの詳細な仕様、環境変数、ドメイン知識、リリース手順は、該当プロジェクト側で管理します。
