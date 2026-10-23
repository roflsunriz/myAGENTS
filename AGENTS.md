# AGENTS.md

## 作業開始前の必須手順（最優先・例外なし）

1. このファイルを参照する全リポジトリでは、調査、計画、コマンド、スキル、編集、コミット、プッシュより先に、本ファイル（各リポジトリでは `COMMON-AGENTS.md`）を先頭から末尾の `## その他` まで全文読む。取得に必要な読み取り専用のパス・リンク確認だけは先に実行してよい。
2. `COMMON-AGENTS.md` は本ファイルへの Git 管理外シンボリックリンクである。`git` や既定の ignore を使う `rg --files` だけで不存在と判断しない。読み取り失敗、省略、途中取得、要約は読了に含めず、必要なら分割して EOF まで取得する。
3. 読了後は本ファイルを最優先の指針とし、直後の最初の進捗報告で全文読了を明示する。

本リポジトリは、`%USERPROFILE%\Documents` と `C:\filter-matome` 配下の各リポジトリに共通する中核ルールを管理する。ローカル `AGENTS.md` には純粋な指示と説明、構成・環境・起動方法・実現手段・例外の根拠・調査結果は `findings.md` に記載する。

## 応答と言語

- 常に日本語で応答する。技術用語、コマンド、API 名、エラーは必要に応じて原文を使う。
- 不明点は推測せず、README、`AGENTS.md`、`findings.md`、更新手順、設定、CI を先に確認する。
- ファイルは原則 UTF-8 を指定して読む。

## 読みやすい日本語（yomiyasuの原則）

[nanaism/yomiyasu](https://github.com/nanaism/yomiyasu/blob/986da6ffc89316a90e509d007c1efe1fc59057e6/SKILL.md) の原則を会話、進捗、README、仕様書、PR 説明に適用する。出典は 2026-10-06 確認の [MIT ライセンス](https://github.com/nanaism/yomiyasu/blob/986da6ffc89316a90e509d007c1efe1fc59057e6/LICENSE) であり、以下は要約である。

- 読みやすさより内容の正確さを優先し、主張、重要度、断定・推測の強さ、文の役割、条件、例外、否定、限定、数量、並列、順序を変えない。既に自然な表現は残す。
- 主体、対象、修飾先、指示語を明確にする。文脈に根拠のない原因、数値、手順、効果、感情を補わず、不確かな点は不確かなまま理由と確認事項を示す。「情報がない」と「未定」を区別する。
- 指定がなければ常体・敬体を保ち、語尾を散らすために説明を依頼へ変えたり、必須条件を弱めたりしない。
- 不自然な比喩、大げさな表現、不要な擬人化、重複する前置きや補足、内容より目立つ装飾を整理する。ただし、システムを主語とする客観的な動作、評価・理由・留保・方針転換を担う表現、慣用句、文字どおりの表現、定義済み専門用語は保つ。
- 段落内の関係を追える語順・句読点・長さにし、文字数だけで分割しない。箇条書き、表、見出しは用途に応じて使い、固定構成や一律の文長を強制しない。
- コード、コマンド、URL、API 名、数値・単位、引用原文、Markdown の表示に必要な記号・空白を校正で変えない。引用を要約する場合は明示して出典を添える。修正前後で情報の追加・脱落・関係の変化を確認し、リンターは見直し候補として扱う。

## 作業の基本規律

- ユーザーの依頼手段から最終目的と、利用者が観測できる成功状態を復元する。症状、原因、最終状態を分け、手段の実行や表面的な解消だけで終了しない。
- ユーザーの最新の訂正、対象、名称、ID、正とする仕様を優先し、関連する移行・互換処理の向きも確認する。
- 「意見だけ」「何もしないで」「相談」では読み取り専用の調査と提案に限る。編集、生成物作成、インストール、設定変更、コミット、プッシュ、外部投稿を行わない。調査も禁止された場合は提示情報だけで回答する。
- 「続けて」「残りを全部」「最後まで」「リリース」「PR も修正」など完遂を求められたら、実装、検証、必要文書、Git 状態確認まで進め、途中報告で止めない。
- 「触るな」は変更せず、「戻すな」は復元しない。これらを削除許可に読み替えない。変更禁止対象なしでは達成不能なら理由を示して判断を求める。
- 「不要」「削除」の対象が確定したら、周辺コード、README、更新手順、CHANGELOG、テスト、設定の参照も調べて残骸を除く。ただし他者の未コミット変更を戻さない。
- ダウンロード、外部通信、ログイン、認証、投稿、削除、公開など副作用の大きい検証は許可範囲に限り、未実施分は構文確認、dry-run、モック、手順確認で補う。
- ユーザーが「なぜ」「まだダメ」「更新されない」「動かない」と述べたら、同じ方針を繰り返さず、前提、再現手順、実測、差分、未検証箇所を整理してから対応する。
- 最終報告は、変更、検証結果、未実施の検証と理由、残るリスクだけを簡潔に示し、秘密、長いログ、内部出力を貼らない。

## 作業前確認

- 最初に `git status --short` を確認し、既存の未コミット変更を把握する。対象外差分は触らず、必要な場合だけ理由を示して確認する。
- 「ドキュメント」「ドキュメント更新」に従い、文書と現状の整合を確認し、不足・陳腐化の解消を作業に含める。
- Git／PR／リリース作業では前後に `git status --short --branch`、現在ブランチ、remote、タグ、PR 状態を確認する。closed PR、意図しないブランチ・タグ、不明な push 先を勝手に reopen・付け替えしない。
- `git init`、タグ・リリース削除、履歴書き換え、大量の tracked 除外、`git rm --cached` は、リポジトリ直下と件数を確認し、依頼範囲外を巻き込まない。

## 完遂性・意図整合性・非逃避行動（最上位）

### 観測可能な完了条件

作業前に、利用者が実際の導線から操作できる、公式配布元から正しい情報を取得できる、対象だけが更新される、環境が正しく選ばれる、失敗時に復旧できる、配布物がそろう、必要なテスト・CI・パッケージ生成が成功する、などの観測可能な条件を定める。「ファイルやクラスを追加した」「URL を消した」「CI を開始した」は完了条件にしない。条件を満たすまで「完了」「対応済み」「実装した」と表現しない。

### 目的を縮小しない

目的を満たさない限り、次を禁止する。

- 問題箇所や必要機能を削除・無効化・非表示・対象外化して完成扱いする。
- プレースホルダー、仮値、未対応分岐を消すだけで、正しい情報源・処理・導線へ置き換えない。
- エラーを握りつぶす、期待値を緩める、テストを削除・無効化して成功に見せる。
- 対象範囲を勝手に狭め、「将来対応」「別 Issue」「Draft」を理由に今できる作業を残す。
- 追加したクラス、設定、画面、スクリプトを呼び出し元や製品経路へ接続しない。
- ビルド成功だけで、配布、起動、操作、更新、復旧、実行時ファイルまで成立したとみなす。
- 内部部品や手動回避策を、要求された利用者向け機能、自動化、GUI の代替にする。
- 未確認の URL、API、version、hash、file 名、推測を確定値として埋め込む。

削除、無効化、保留、対象外化、別 Issue 化は、元の目的を代替手段で達成できる場合、または対象が不要・危険・誤要件・明示的除外の場合だけ認める。簡単な案と正しい案が競合すれば正しい案を選ぶ。

### 製品経路へ接続する

該当する範囲で、entry point、呼び出し元、設定の読み書きと後方互換、GUI 導線、配布物、対応 OS／CPU、エラー表示、backup・復旧、version 検出と更新記録、build・test・CI・package、実行時の実ファイルを確認する。

### 調査を一般化する

- ユーザーの個別指摘から「途中で止めない」「仮値を残さない」「初心者へ CLI を強要しない」「特定 OS に固定しない」などの一般原則を抽出し、同種の箇所へ適用する。
- 問題と同じ定数、path、設定 key、API、起動経路、複製 script、package／GUI 用 copy、CI、旧実装、OS・CPU・version 固定、仮 URL・hash、TODO、FIXME、example、placeholder を横断検索する。
- screenshot、教師 data、動画、単一入力・画面だけに合う ID、座標、文言、時刻、順序の特別扱いを作らない。一般化は独立した複数 sample、順序、timing、画面、環境で検証し、不足なら実測を増やす。
- 不確実性は repository、Issue、code、公式資料、既存規約の調査で縮める。安全で可逆な仮定は明示して進め、成果が大きく変わる判断だけ質問する。

### 既存設計と利用者への配慮

- 同種機能、path 解決、設定、version、更新、GUI、error、log、backup、配布方法に合わせ、意味と挙動を一元化する。code 量だけを目的に無理に共通化しない。
- 利用者を開発者・管理者・CLI 利用者・専門家と仮定しない。専門用語や選択肢には推奨値、短い説明、安全な既定値、詳細設定との分離、誤選択警告、復元方法を用意する。
- Draft PR、Issue、branch は成果物の容器であり、未完成を放置する理由にしない。

### 最終回答前の自己監査

目的を隠しただけではないか、困難な箇所を対象外にしていないか、TODO・仮値・未接続・未検証の主経路がないか、利用者が操作できるか、特定環境へ固定していないか、既存利用者を壊さないか、公式情報を確認したか、失敗を削除・skip で隠していないか、同種箇所へ一般化したか、今できる作業を先送りしていないか、重要知見を `findings.md` に記録したかを確認する。相談・変更禁止中は記録候補の報告に限る。該当があれば作業を続け、解消不能な阻害要因は「検証」に従い未達として報告する。

判断順は、ユーザーの最終目的、実動作、安全性・可逆性、既存整合性、検証可能性、保守性、実装容易性、早い終了とする。

## 設計と実装方針

- モノリスを避け、UI、状態、API、変換、検証、永続化を適切に分離する。1 ファイルは 1000 行以下にする。既存の超過ファイルを分割する前に動的要素テストと機能テストを追加して合格を確認し、分割後も同じテストへ合格させる。
- 既存の構成、命名、設計を優先し、不要な大規模リファクタリングを避ける。新規名は既存規約と衝突しない限りケバブケースを基本にする。
- JavaScript project は原則 TypeScript、ESLint、Prettier、Bun bundler を使う。他言語も型付き言語または形式検証を使う。
- TypeScript で `any` を使わず、境界では `unknown` を型 guard、schema、明示型で絞る。他言語でも曖昧な型・未検証入力を放置しない。
- storage には自動 migration、schema／data version 検査、破損 data の強制 recovery を実装する。新 data model では旧 data を曖昧に互換扱いせず、原則、明示的な強制 migration 対象にする。
- 不要 code、dead code、使われない互換処理は削除し、必要十分で保守しやすい状態を保つ。
- Web は Chrome／Chromium 独自命令を避け、MDN に記載された複数 browser 対応の標準技術を優先する。
- 値を受け取る時はバリデーションとサニタイズをする。

## 最小実装と過剰設計の抑制

調査・理解・品質保証を省略せず、呼び出し経路、data、既存設計、失敗時の影響を理解してから最小化する。次の順で、目的を完全に満たす最初の手段を選ぶ。

1. 成果物や機能自体が必要か確認する。
2. 意味が一致する既存実装を再利用する。
3. 言語、OS、browser、DB、framework の標準機能を使う。
4. 導入済み依存関係を使う。
5. 新しい抽象化なしの短い局所処理で表す。
6. どれでも満たせない場合だけ、最小の新規実装または外部依存を選ぶ。

- 新規依存の採用前に、直近の release／commit、放置 Issue／PR、download・star・実績、license、TypeScript／型定義を確認する。1 年以上 release がない、活動が乏しい、重大 Issue が放置されるなど保守性に納得できなければ採用しない。
- 未要求の抽象化、拡張点、汎用 framework、boilerplate、未使用の将来機能を先回りして作らない。技巧より標準的で明瞭な変更を選ぶ。
- 症状ごとの回避策より共通原因を正しい層で一度直す。追加前に重複・分岐・互換処理・依存を置換または削除できるか確認する。
- 適用上限のある単純方式は、上限、採用理由、見直し条件を最も近い comment・設計・test へ記録する。
- 入力検証・権限、安全な error・backup・復旧、security／privacy、accessibility、多言語／RTL、現実の環境差、明示要件、観測可能な完了条件、退行検出を最小化で弱めない。
- 単純な一行変更に新しい test 基盤や大量の fixture は作らないが、非自明な logic には壊れたとき失敗する最小の自動 test または既存 test の case を残す。UI、状態遷移、権限、data migration は本ファイルの厳密な検証方針を優先する。
- 最終検証前に追加した抽象化、依存、設定、file、分岐の根拠を監査し、挙動と検証を保てる重複・不要層だけを削減する。

## 外部情報と実在性

- 外部仕様、model、package、release asset、CI・PR・Issue 状態、最新 version は、local、公式資料、GitHub、実 command で確認する。確認不能な情報を実在・最新と記載しない。
- URL、API、配布物、version、checksum、対応環境は、公式 API、配布 page、repository、metadata から、response 形式、file 名、version 取得、hash／署名、OS・CPU・package 選択条件を確認する。動的情報は固定 URL より公式 metadata で解決し、取得不能・形式変更・配布終了を処理する。

## 多言語対応

- ユーザー向け文字列を持つ userscript、browser extension、Electron／Tauri2、Web、非 CLI desktop UI は i18n 辞書・locale で管理し、表示文字列を実装へ直接埋め込まない。主要導線、通知、設定、error、help、README を対象にする。
- selector、DOM 探索、E2E locator は翻訳文、hash class、自動生成 ID、random 値に依存せず、安定した `data-*`、識別子、構造化状態を使う。
- 日本語を必須とし、日本語以外は総話者数上位の English、Mandarin Chinese、Hindi、Spanish、French、Modern Standard Arabic、Portuguese、Bengali、Russian、Urdu を優先する。順位・話者数は追加・更新時に最新調査と集計基準を確認する。
- Arabic・Urdu 等の RTL は `dir="rtl"`、layout、text、icon、input、screenshot を確認する。欠落 key を検出し、日本語または英語へ安全に fallback する。機械翻訳でも placeholder、単位、日付、数値、複数形、文脈を確認する。内部 log・comment・検証 memo は無理に翻訳しない。

## 表示品質とレスポンシブ対応

- 1920x1080 だけでなく、4:3、3:2、16:9、縦長、mobile、tablet、4K、高 DPI、狭幅・低高さで破綻しないようにする。固定寸法、絶対配置、viewport 単位、大きい余白・文字には、最小／最大、折返し、scroll、縮小、再配置を定める。
- `min/max-*`、`clamp()`、grid、flex、container／media query を適切に使い、長い翻訳でも読める状態を保つ。modal、toolbar、sidebar、card、table、form、canvas、media、game 画面を操作不能にしない。
- `!important` は cascade、詳細度、selector、読込順で解決できない箇所だけに最小限使い、既存の乱用も整理する。
- 代表的な複数 viewport で screenshot または DOM を実測し、文字切れ、横 scroll、重なり、操作不能を確認する。

## UI・ブラウザ・実環境の検証

- UI、extension、Electron、userscript、HTML／CSS は推測で完了せず、可能な限り実 browser／headless で操作し、screenshot、DOM、console、network のいずれかで確認する。
- ユーザー提示の screenshot、既存画面、可視化、design 案を受入基準とし、配置、寸法、余白、色、状態変化を並べて比較する。独自解釈の別 design へ置換しない。
- clean／debug／headless profile で再現しなくても、実利用 profile の報告を否定しない。browser、profile、extension、設定、cache、Service Worker、保存 data、viewport を比較し、実利用環境で再検証する。
- 生成物と deploy 結果が違えば、local server だけでなく build artifact、公開設定、workflow、実配信 file を比較する。
- Chrome 検証は Google Chrome と raw CDP を使い、`%USERPROFILE%\Documents\chrome-debug.ps1` または `firefox-debug.ps1` を利用してよい。Firefox は RDP／Marionette も使える。
- ユーザー操作を優先し、原則 headless にする。分離できる Firefox 検証は無断でよいが、実利用 profile が必要なら会話を止めて注意を促す。実 profile の検証後は `%USERPROFILE%\Documents\Fix-FirefoxHomePrefs.ps1` を実行する。表示 demo 等で必要な場合だけ headless を解除して確認を求める。
- CDP／RDP／Marionette は内部詳細であり、ユーザー向け README、UI、release note、生成 script の出力へ不要に記載しない。
- launcher、package、tray、OS 起動など環境差のある不具合は、直接起動、launcher、起動時、再起動後、DLL／resource 配置を分けて確認する。

## 依存関係の変更

- 追加・更新・削除では理由、代替、採用判断、影響、lockfile を確認し、build、test、脆弱性検査を行う。
- 作業や脆弱性検査に必要な package／tool は追加指示なしで導入してよい。不要になれば削除し、環境を小さく保つ。

## 生成物とビルド成果物

- 生成物、build artifact、依存 cache は原則手編集しない。更新時は生成元と command を確認し、Git 管理対象なら手順を変更履歴または更新手順へ残す。

## セキュリティと秘密情報

- API key、token、Cookie、認証情報、個人情報を commit しない。`.env`、設定、log、screenshot も確認する。発見時は値を出力せず種類と場所だけ報告する。

## エラー対応

- エラーを握りつぶさない。ユーザー向け処理は失敗理由と次の行動を示す。retry、fallback、recovery は無限 loop と data 破壊を避ける。
- 警告・非推奨が将来の非互換や設定不備を示す場合、抑制だけで成功にせず、一次資料の移行先へ code／API／設定を対応させる。抑制は無害と確認し理由を説明できる場合だけにする。

## 検証

TypeScript／Bun では原則、次を実行する。

```powershell
bun run lint
bun run format
bun run type-check
bun run build
bun run test
```

定義済みの CI・脆弱性検査も可能な範囲で実行する。他言語では型・静的解析・lint、format、unit／integration test、build／package、syntax、security／dependency audit を構成に応じて行う。

- E2E／CI 失敗は先頭 log だけで判断せず、test 名、環境、期待値、実 path、browser／binary の有無を確認する。今回と無関係に見えても原因を調査・修正し、成功まで確認する。
- 自力で解消できない外部障害、権限不足、実機不在等は、阻害要因、代替検証、未検証 risk、再開条件を記録する。無関係な設定変更や無限再試行はせず、可能な残作業を終える。未検証・失敗を成功扱いしない。

## テスト設計

- test 追加の依頼は、file を増やすことではなく挙動を固定し、不具合・退行・未接続を見つけて直すことを目的とする。ユーザーが test だけに限定しない限り、正しい期待値を保ったまま製品 code も合格するまで修正する。
- bug 修正は可能な限り再発防止 test を追加する。test は不具合、退行、仕様漏れ、未接続を発見するために使い、正しい失敗を緩い期待値、smoke test、無効化、削除で消さない。仕様変更で期待値が誤りと確認できた場合だけ更新する。
- E2E／unit test は起動と正常系だけでなく、全ての操作可能な tab、button、menu、input、modal、window と子画面を対象にし、click、入力、選択、開閉、focus、disabled、error、保存、cancel、復帰を確認する。
- pinch と double tap、scroll と drag、遷移と非同期更新など競合操作を組み合わせ、入力から確定・cancel・復帰、座標変換、resize、fullscreen、入力 device の状態遷移を検証する。
- 外部観測可能な期待、境界、異常、状態遷移を定義し、誤実装が失敗し、同じ仕様を満たす別実装は許容する粒度にする。UI 分岐、権限、設定、言語、画面、別 window の主要組合せを洗い出す。
- 実環境自動化が難しければ、実対象から採取した data で mock／stub／fake／headless を構築する。それも不能なら理由、手動手順、確認対象、risk を記録する。snapshot／画像差分は意図しない変更を確認する。

## 更新手順

- 原則 `how-to-update.md`、既存 project が使う場合は `docs/UPDATE.md` を正本とする。なければ作業で判明した手順を `how-to-update.md` に作る。
- 常に日本語で、前提、command、検証、rollback／復旧を含める。

## ドキュメント

文書整備は継続義務とする。初期 setup と毎回の作業で不足を確認し、依頼や公開準備を待たず補う。既存の同等文書は再利用し、運用に不要な空 template は作らない。相談・読み取り専用・変更禁止では候補の報告に限る。

- 検証手順と対策を `verification.md` にまとめる。
- `CODE_OF_CONDUCT.md`、`CONTRIBUTING.md`、`SECURITY.md`、`SUPPORT.md` を整備する。
- README は利用者の開始導線を先に、開発者向け情報を後半に置く。

## Github Actions

初期整備、公開準備、または依頼時に実運用に該当するものを整備し、通常修正では必要な既存設定を更新・再利用する。

- release workflow は `CHANGELOG.md` の対象 version を本文へ自動掲載する。
- PR template、Issue template（bug-report、config、documentation）、Discussion template（general、ideas、q-a）、Dependabot、labeler を整備する。
- Dependabot の version update は毎月28日（Asia/Tokyo）にまとめて確認し、Dependabot PR は月末の自動処理でのみ merge する。CI 失敗時は GitHub Copilot を使わない範囲で自動解決し、同じ月末処理または次回の月末処理で merge する。

## 変更履歴

- 変更は日本語の `CHANGELOG.md` に Keep a Changelog 形式で記載する。日付は `YYYY-MM-DD`、未 release は `## [Unreleased]`、種別は必要に応じて Added／Changed／Deprecated／Removed／Fixed／Security を使う。
- 「何をしたか」だけでなく目的とユーザー影響を書く。履歴から作る場合も実際の code、test、文書差分を確認し、commit 要約を並べない。不明な意図は推測で断定せず、事実と不明点を分ける。

## ドキュメント更新

- 作業開始時と完了前に README、ローカル `AGENTS.md`、更新・検証手順、変更履歴、運用文書を実装、設定、script、CI、利用経路と照合する。
- 操作、setup、更新、設定、外部仕様を変えたら同じ作業で関連文書を更新する。既存の誤記、link 切れ、廃止手順も根拠を確認して直す。
- 変化する version・環境・外部仕様は正本や確認方法を参照し、重複転記を避ける。固定値には条件と確認時点を添え、未確認を「最新」と書かない。
- command、path、link、順序、前提を検証し、日付変更だけで内容確認に代えない。実行不能は「検証」に従う。
- 文書を完了条件に含め、最終報告で変更、確認結果、未解消理由を簡潔に示す。内部実装の都合だけを利用者向け文書へ書かない。

## ローカル AGENTS.md との関係

- 本ファイルは全 project 共通の上位方針である。各 project は `COMMON-AGENTS.md` を本ファイルへの Git 管理外シンボリックリンクとして置き、`.gitignore` へ追加し、ローカル `AGENTS.md` から必ず参照する。
- ローカル `AGENTS.md` は純粋な指示と説明だけにし、構成、環境、command、調査結果、過去の事実は `findings.md` へ置く。既存文書に同種の本文があれば全文を移す。
- 矛盾時は原則本ファイルを優先する。project 固有の配置、tool、command、環境、文書構成は、`findings.md` に対象 rule、例外理由、範囲、同等品質の代替・検証を記録した場合だけ、その範囲で例外にできる。
- ユーザーの明示指示、変更禁止、秘密・data 保護、失敗を隠さないこと、観測可能な完了条件、日本語応答、変更履歴・検証の義務は例外で弱めない。例外は内容と実環境で判断し、例外というだけで追加承認を求めない。

### 作業で判明した重要事項の随時記録

- 再利用できる非自明な知見は根拠を確認した時点で local `findings.md` に追記・更新する。なければ作成し、local `AGENTS.md` から本ファイルと `findings.md` の全文確認を指示する。
- 起動・配布経路、暗黙の依存・順序、環境・profile 制約、再現条件、失敗原因、有効な検証・復旧、設計理由、同時更新箇所を優先する。
- 「判明事項」「成立条件・範囲」「次の行動」を短く書き、根拠 file、command、公式資料、確認時点を添える。ユーザー説明と実測を分け、推測を確定しない。
- 関連項目へ統合し、重複・矛盾・古い記述を直す。容易に読める code／設定の列挙、作業日誌、長い log、秘密・個人情報は書かない。詳細が他文書にあれば要点と参照を残す。
- 知見は該当 repository に置き、共通 rule 変更と分ける。相談・読み取り専用・変更禁止では書かず候補を報告する。記録を実装・検証の代替にしない。

## コミットとプッシュ

- 明示指示がなくても、原則 1 bug fix／1 feature change ごとに commit する。message は前回 commit 以降の内容を表す日本語 Conventional Commits の `type(scope): 要約` とし、必要なら理由、検証、破壊的変更を本文へ書く。
- 会話で一度でも push 指示があれば、以後の commit も随時 push してよい。push 先は main／master／main 相当とし、無断で branch や draft PR を作らない。
- push 依頼時は事前に依存の脆弱性と更新を確認し、警告を修正する。minor／major も必要な code を直して更新し、major が既存依存を壊す場合だけ壊れない最大 version に留める。

## サブエージェント

- 起動・指示・調整・統合・検証を含めても、独立した多数の作業の大規模並列化で全体時間を大幅短縮できる場合だけ委譲する。小規模、直列、ユーザー判断、秘密・認証、破壊的変更は親が扱う。
- 条件を満たす場合だけ必要数を同時起動する。低・中難度は品質を満たす候補から利用枠消費の小さい model、高難度は文脈理解・推論・失敗影響を重視し、特定 model 名へ固定しない。
- 起動前に実行環境で利用可能な model ID、tool・入力、Reasoning Effort、継承・上書き制約を確認する。ユーザー指定を優先する。
- model／設定変更時は公式の仕様・料金を本文まで確認する。API は提供元、model ID、入力・出力・cache・推論、context、mode、region、tool 料金と、再試行・親の統合検証を含む総費用・時間で比較する。定額・credit は API 単価を実費とみなさない。他社・仲介 model は利用許可、機能、data 取扱条件を満たす場合だけ使う。
- Reasoning Effort は対応範囲で指定・継承・既定値を起点に、品質を保てる範囲で調整する。同名設定を model・画面・API 間で同一序列と推測しない。
- 品質不足は指示、推論強度、model、親への引取りを見直す。安価な候補への固執や完了条件の弱体化をしない。料金・条件を確認できない候補を「安価」「最適」と断定しない。model・提供条件が変われば再確認し、同じ作業内で不変なら結果を再利用してよい。
- 親は方針、範囲、対象 file、禁止事項、完了条件、検証を明示し、成果を監査・統合する。同じ file・責務を複数へ同時編集させず、未 commit 変更を戻させない。必要に応じ作業者と監査者を分け、監査者は問題、根拠位置、方針を返す。作業者は指摘を反映し、できない場合は理由を示す。
- 使用時は Git 管理外の `subagents/<role>-<short-task>/` に担当、調査、候補、検証、未解決を記録し、必要なら `.gitignore` に `subagents/` を追加する。秘密・個人情報、巨大生成物、cache、build artifact は置かない。model 選定は ID、推論強度、提供元、課金条件、公式 URL・確認日、理由を記録する。正式成果へ反映後、不要 memo を残さない。

確認先は [モデルと推論設定](https://learn.chatgpt.com/docs/models)、[サブエージェント設定](https://learn.chatgpt.com/docs/agent-configuration/subagents)、[Codex・ChatGPT の料金と利用枠](https://learn.chatgpt.com/docs/pricing)、[API 料金](https://developers.openai.com/api/docs/pricing)、[モデル選定](https://developers.openai.com/api/docs/guides/model-selection) とし、移転時も公式サイト内を確認する。

## Code Mode のツール並列実行

- 同じ stage の独立した `functions.exec` 対応 tool は 1 回の呼び出し内で並列実行する。一部失敗でも結果を使うなら `Promise.allSettled`、一つの失敗で中断すべき場合だけ `Promise.all` を使う。
- 依存処理、待機・再開、承認、競合・相互依存変更、結果で次が変わる調査は逐次実行する。まとめられる調査を外側の複数呼び出しへ分けない。

## ツールコール

- 原則 30 秒の timeout を設定し、長時間処理だけ延長する。tool が作業全体を不必要に block しないようにする。

## ReVanced

- release workflow で ReVanced API 形式の `patches.json` を出力する。全 release を調べ、欠けていれば昇格した GitHub CLI で追加する。README に `github.com` page ではなく実体 URL を copy 可能な形で載せる。
- RVP に Android 用 `.class` DEX を含め、`EmptyMultiDexContainerException` を防ぐ。
- Android ReVanced Manager へ `patches.json` を登録して読込 error がないこと、RVP 適用が install 直前まで進むことを実機で確認する。install はユーザー承認を得る。
- version に依存せず適用・使用できることを確認し、実機・repository に中間生成物を残さない。
- `*-apks` に APKMirror、APKPure、UpToDown 等から複数世代の APK／XAPK／APKM／APKS 等を直接取得して保管する。PC は APKEditor 等、Android は Anti Split M で単一 APK にし、RVP 適用を確認できる。

## ReVanced - 汎用命令 - 広告系

- 広告 SDK の通信を全遮断し、可能なら SDK 自体を除く。SDK 外のセルフプロモーションも削除・抑制する。
- 広告枠は幅・高さを 0 にして枠自体を除き、空間が詰められたことを目視確認する。

## ReVanced - 汎用命令 - ディープ統合

- 設定を別 app にせず、対象 app 内に「* ReVanced」（`*` は app 名）を設ける。
- card、button、tab、設定項目は既存 style・導線へ自然に統合し、目視確認する。

## ライセンス

- 原則 MIT とし、`LICENSE` を作る。他 library の code を含む場合だけ適切な license にする。

## Dependabot PullRequestの指針

- major も必要な code を直して、既存依存を壊さない最大 version まで更新する。version update の作成と自動 merge は毎月28日（Asia/Tokyo）の月末処理へまとめる。CI 成功済みの PR だけを merge し、失敗は原因を修正して同じ月末処理または次回の月末処理で merge する。不要 remote branch は削除して main へ統合する。
- 解決不能な open PR は放置せず、`@dependabot ignore this major version`／`minor version` 等で close し、更新可能になったら再度開く。

## CIの設計

- CI は高速化・並列化を考慮し、既存 CI も改善可能なら直す。shard の一つが失敗したら全 shard を即中止して失敗させる。

## その他

- GitHub CLI、npm CLI 等の認証 command は原則昇格して使う。非昇格時の「token 失効」をそのまま信じない。昇格後も失効していれば、認証 page を CDP／RDP で開くなど、ユーザーがすぐ再認証できる状態を整える。
- `Get-Command ffmpeg` 等で解決しなくても安易に PATH 不在と判断せず、昇格 PowerShell でも確認する。
- GithubのCIがBilling/Paymentで止められている場合、その月いっぱいまでリモートCIの例外規定を適用する。つまりリモートCIはローカルCIで代用する。
