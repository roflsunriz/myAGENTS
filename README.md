# myAGENTS

`myAGENTS` は、複数のローカルリポジトリで共通して使うコーディングエージェント向けの中核ルールと、用途別の追加指針を管理するリポジトリです。

対象の主な作業場所:

- `C:\Users\UserName\Documents`
- `C:\filter-matome`

## 方針

- 共通ルールはこのリポジトリの `AGENTS.md` に集約する。
- サブエージェントのモデル選定は [AGENTS.md の「サブエージェント」](AGENTS.md#サブエージェント) に従う。大幅な時間短縮が見込める場合に委譲し、モデルの価格順位や役割を固定せず、実行環境と公式資料で利用可否・課金条件・推論設定を確認する。
- SVG 制作時の追加指針は [svg/AGENTS.md](svg/AGENTS.md) で管理し、必要なプロジェクトから参照する。
- Three.js / Blender で参照画像を再現する追加指針は [threejs-blender/AGENTS.md](threejs-blender/AGENTS.md) で管理する。
- 各プロジェクト固有の説明、起動方法、設計詳細、例外事項は各プロジェクトのローカル `AGENTS.md` に任せる。
- 変更履歴は Keep a Changelog 形式の `CHANGELOG.md` で管理する。
- 更新手順は `how-to-update.md` またはプロジェクト事情に応じて `docs/UPDATE.md` にまとめる。
- ドキュメントは初期セットアップ時と不足発見時に整備し、毎回の作業開始時・完了前に現状と照合して最新に保つ。具体的な義務と読み取り専用時の扱いは `AGENTS.md` の「ドキュメント」「ドキュメント更新」に従う。

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

## SVG 制作で使う

[svg/AGENTS.md](svg/AGENTS.md) は、リファレンスに忠実な模写・トレースと、キャラクターデザイン・画風を保ったポーズや表情の変更を扱います。

- 模写・トレースでは、制作途中から参照と SVG のレンダリングを重ね、輪郭・配置・線・色の差を修正します。
- ポーズや表情を変える場合は、部位比率と画風の特徴を測定・記録し、遠近や表情による見かけの変化を考慮して適用します。
- 完成時には SVG 本体に加え、プレビュー、比較画像、測定・検証記録を確認できる状態にします。

利用するプロジェクトのローカル `AGENTS.md` に、次の参照指示を追加します。この配置例と異なる場合は、実際の保存先へパスを変更してください。

```markdown
SVG の制作・修正では、作業前に `C:\Users\UserName\Documents\myAGENTS\svg\AGENTS.md` を全文読み、追加指針として適用する。
共通の作業規律は `COMMON-AGENTS.md` に従う。
```

参照ファイルを手元へコピーする場合は、用途が分かる名前で保存し、上の指示もコピー先のパスへ変更します。既存のローカル `AGENTS.md` は上書きせず、参照指示を追記してください。コピーは自動同期されないため、指針の更新時に差分を取り込みます。

## Three.js / Blender 制作で使う

[threejs-blender/AGENTS.md](threejs-blender/AGENTS.md) は、参照画像のテクスチャやディテールを勝手に省略せず、そっくり同じに見える成果物を作るための共通指針です。

参照の特徴を一覧化して実際の形状・材質・テクスチャへ反映し、同じ視点のレンダリングと細部の拡大比較で修正を繰り返します。3方向・4方向・5方向へ段階的に確認を増やし、最終版は最低5方向から形状・接合部・テクスチャ等の破綻を検証します。保存・書き出し後も、使用先で全方向を再確認し、質感や細部が失われていないことを確認します。

利用するプロジェクトのローカル `AGENTS.md` に、次の参照指示を追記します。保存先が異なる場合は実際のパスへ変更してください。

```markdown
Three.js または Blender で参照画像から制作するときは、作業前に `C:\Users\UserName\Documents\myAGENTS\threejs-blender\AGENTS.md` を全文読み、追加指針として適用する。
共通の作業規律は `COMMON-AGENTS.md` に従う。
```

コピーして使う場合も、コピー先を参照するよう指示を変更し、指針の更新時に差分を取り込みます。既存のローカル `AGENTS.md` は上書きしません。

## 管理対象

このリポジトリには、横断的に重要な作業規律と、複数のプロジェクトで再利用する用途別の指針を置きます。個別画像の比率・特徴一覧、制作素材や比較画像、プロジェクトの詳細な仕様、環境変数、リリース手順は、該当プロジェクト側で管理します。

## Dependabot PR の自動処理

`.github/workflows/dependabot-automation.yml` は、各リポジトリの PR 用 CI と組み合わせる再利用可能なワークフローです。Dependabot が署名した patch／minor 更新だけを対象にし、対象コミットの CI が成功した場合に squash merge します。CI が失敗した場合は失敗したジョブを 1 回だけ再実行します。対応するリポジトリでは、再失敗後に lockfile 等の指定ファイルだけを読み取り権限のジョブで再生成し、パッチを検証してからコミットします。修復できない場合は PR を残します。major 更新と CI のないリポジトリは自動マージしません。

このリポジトリ自身は `.github/dependabot.yml` で GitHub Actions の更新を監視し、`.github/workflows/ci.yml` で actionlint を検証値付きの公式配布物から実行します。`.github/workflows/dependabot-pr.yml` が共通ワークフローを固定 SHA で呼び出します。

呼び出し側ではこのワークフローをコミット SHA に固定し、`pull_request_target` と PR 用 CI の `workflow_run` から呼び出します。分類が CI より遅れた場合も、分類後に呼び出し側の `workflow_dispatch` で同じ head SHA を再確認します。書き込み権限を持つ処理では PR のコードを実行せず、PR 作成者、リポジトリ、head SHA、Dependabot メタデータと CI 結果を検証します。修復後は `workflow_dispatch` の戻り値にある run ID を直接追跡して CI 成功を確認します。具体的な呼び出し設定、CI 名、マージ後のデプロイ起動は各リポジトリで管理します。

指針の変更は [更新手順](how-to-update.md) に従い、[検証手順](verification.md) で文書と利用経路の整合を確認します。

## 参加・問い合わせ・ライセンス

- [変更への参加](CONTRIBUTING.md)
- [行動規範](CODE_OF_CONDUCT.md)
- [セキュリティ方針](SECURITY.md)
- [問い合わせ](SUPPORT.md)
- [MIT ライセンス](LICENSE)
