## ステップ 1: Git バージョン管理の概要

プロジェクトを進めているうちに、バックアップの整理が難しくなってきたとします。さらに、メンバーごとに更新の共有方法が違うと、共同作業はすぐに混乱します。

調べてみると、[Git](https://git-scm.com/) というツールが見つかりました。Git を使うと、変更の追跡や共同作業がしやすくなります。ファイル名に `final-v2` を付けたり、共有ドライブにコピーを置いたり、メール添付で版を回したりする方法より、ずっと整理しやすくなります。

> [!IMPORTANT]
> この演習では、Git がすでにインストールされた環境で Git を使う方法を学びます。
> 自分の PC に Git をインストールしたい場合は、環境ごとに手順が異なるため、公式の [Git サイト](https://git-scm.com) のインストールガイドを参照してください。

### 理論: バージョン管理とは

バージョン管理システムは、コード変更を長期的に扱うときのよくある問題を解決します。たとえば次のような問題です。

- バックアップと復元
- 安全な実験
- 並行開発
- ファイルのロック
- ファイルの重複
- 変更の衝突
- チームでの共同作業

次のような経験があるなら、Git のバージョン管理はきっと役に立ちます。

- `my-project-final-v2-really3.zip`
- 「いつから動かなくなったんだろう。何も変えてないはずなのに」実は変えていた。
- 「そのファイルはロック中だから、月曜に戻ってくるまでコピーで作業しよう」
- 「v2 が入っていたメールはどれだっけ。たぶん先週水曜のやつ」

### Git のバージョン管理とは

Git は[分散型バージョン管理システム](https://en.wikipedia.org/wiki/Distributed_version_control)です。各開発者がプロジェクト履歴の完全なコピーを持ちます。共有場所に 1 つだけ履歴がある集中型システムとは異なります。

この仕組みには次の利点があります。

- オフラインで作業できる: 多くの操作はローカルで処理されます。
- 壊れにくい: 分散したコピーがバックアップとして働きます。
- 柔軟なワークフロー: 開発者が自分に合った手順やツールを使えます。

### Git はどう使うのか

Git は開発者のために作られた[オープンソース](https://en.wikipedia.org/wiki/Open_source)のツールです。コミュニティによって、さまざまな開発ニーズに対応する機能が整えられてきました。

たとえば、Git は多くの開発ワークフローに組み込まれています。

- **コマンドラインインターフェイス (CLI)**: すべての機能の元になる基本のツールです。
- **コードエディタ**: 普段使うエディタや開発ツールと一緒に使えます。例:
  - Visual Studio Code
  - JetBrains IDEs
  - Xcode
  - Emacs/VIM
- **ホスティングサービス**: Git リポジトリを集中管理し、ブラウザ上でも編集できます。例:
  - GitHub
  - GitLab
  - Gitea
  - Azure DevOps
  - AWS CodeCommit
  - BitBucket
- **デスクトップアプリ**: わかりやすいグラフィカルインターフェイスです。例:
  - GitHub Desktop
  - Sourcetree
  - TortoiseGit
  - GitKraken
  - Git Butler
  - その他: https://git-scm.com/tools/guis

### アクティビティ: サンプルプロジェクトを開く

Git の練習を始めるために、まずは事前設定済みの開発環境を開き、サンプルプロジェクトを確認します。

1. 次のボタンを右クリックし、**Create Codespace** ページを新しいタブで開きます。設定は既定のままでかまいません。

   [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/{{full_repo_name}}?quickstart=1)

   > **メモ**: 通常の [GitHub Codespace](https://github.com/features/codespaces) には、リポジトリのコードと必要な設定が自動で含まれます。この演習では、最初から練習できるように少し変更された体験になっています。

1. **Repository** 欄が元のリポジトリではなく、自分の演習コピーになっていることを確認し、緑色の **Create Codespace** ボタンをクリックします。

   - 自分のコピー: `/{{full_repo_name}}`
   - 元のリポジトリ: `/skills/introduction-to-git`

1. ブラウザで Visual Studio Code が読み込まれるまで少し待ちます。

1. 左側のナビゲーションで **File Explorer** を選択してファイルを表示します。`src/index.html` を右クリックし、**Show Preview** を選択してサンプルゲームを表示します。

   > **警告**: まだ変更しないでください。
   > まだバージョン管理を追加していません。

   <img width="350px" src="https://github.com/user-attachments/assets/c5f60f24-27fb-4670-ab0a-c00aa723672c"/><br/>

   <img width="500px" src="https://github.com/user-attachments/assets/a20529f3-8e42-464b-8d84-b0880dd14383"/>

> [!TIP]
> 今後変更を加えながら動作を確認できるので、ゲームのプレビューは開いたままでも大丈夫です。

### アクティビティ 2: CLI で Git を使う

まずはコマンドラインインターフェイス (CLI) で Git を使ってみます。CLI は Git の全機能の土台であり、最も強力な使い方です。

1. 統合ターミナルが表示されていない場合は、`Ctrl+Shift+P` を押し、`View: Toggle Terminal` を検索して選択します。

   <img width="500px" src="https://github.com/user-attachments/assets/4bbf918a-f87c-4875-b7fd-61d8b16a70e1"/>

1. インストールされている Git のバージョンを表示し、Git が使えることを確認します。

   ```bash
   git --version
   ```

   <img width="500px" src="https://github.com/user-attachments/assets/0e09991b-829f-4028-b951-87bc5fa47bfc"/>

1. Git のヘルプを表示します。

   ```bash
   git --help
   ```

   <img width="500px" src="https://github.com/user-attachments/assets/c447adf3-9cc1-4106-9a49-f2bf705d396c"/>

### アクティビティ 3: Git のユーザー情報を設定する

ゲームをバージョン管理する前に、Git に自分のユーザー情報を設定します。これにより、変更の作者として自分が記録されます。

> [!WARNING]
> Git は作者名とメールアドレスを履歴に保存します。履歴はリポジトリにアクセスできる人から見えます。GitHub では、個人メールを隠すための [noreply メールアドレス](https://docs.github.com/en/account-and-profile/reference/email-addresses-reference#your-noreply-email-address)をアカウントの[メール設定](https://github.com/settings/emails)から有効にできます。

1. 表示名を設定します。

   `First` と `Last` は自分の名前に置き換えてください。

   ```bash
   git config --global user.name "First Last"
   ```

1. メールアドレスを設定します。プライバシーを守りたい場合は、アカウントの[メール設定](https://github.com/settings/emails)で noreply アドレスを有効にすることを検討してください。

   `me@example.com` は自分のメールアドレスに置き換えてください。

   ```bash
   git config --global user.email "me@example.com"
   ```

1. 設定を表示して、変更を確認します。

   ```bash
   git config --global --list
   ```

   <img width="500px" src="https://github.com/user-attachments/assets/62688039-3601-4a23-8f61-408210faff0a"/>

1. 作者情報を設定すると、Mona が作業内容の確認を始めます。少し待って、コメント欄を確認してください。進捗情報と次のステップが投稿されます。

> [!TIP]
> 複数のアカウントを使い分ける場合は、プロジェクトごとにユーザー名とメールアドレスを変えることもできます。既存のプロジェクトリポジトリでは、`--global` の代わりに `--local` を使います。

<details>
<summary>うまくいかない場合</summary><br/>

- `"First Last"` と `"me@example.com"` を、実際の情報に置き換えていることを確認してください。

</details>
