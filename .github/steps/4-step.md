## ステップ 4: 変更内容を比較する

前のステップで「戻す」方法を学びました。次は実際にゲームへ変更を加え、リポジトリ履歴へコミットする前に、Git で**何が変更されたか**を確認する方法を学びます。

ファイルの差分を理解することは、自分の作業を見直し、ミスを見つけるためにとても重要です。

### 理論: diff を理解する

Git は記号と色を使ってファイルの変更を表示します。

- 緑色の `+` は追加された行を表します。
- 赤色の `-` は削除された行を表します。

例:

```diff
+ This is a line that was added
- This is a line that was removed
```

> [!TIP]
> Git の既定の比較色は、次のコマンドで変更できます。
>
> ```bash
> git config --global color.diff.old yellow
> git config --global color.diff.new blue
> ```

### 重要な Git コマンド

`git diff` コマンドは、開発中の状態同士の差分を表示します。

- `git diff`: 作業ディレクトリとステージングエリアの差分を表示します。
- `git diff --staged`: ステージングエリアと直前のコミットの差分を表示します。
- `git diff HEAD~1`: 現在のコミットと 1 つ前のコミットの差分を表示します。

### アクティビティ 1: CLI で差分を見る

ゲームに変更を加えてから、CLI で差分を表示してみましょう。

1. `src/index.html` を開きます。

1. `line 20` で、スコア表示に関する `info-section` 部分を次の例に置き換えます。

   ```txt
   <div class="info-section">
      <h3>Current Score</h3>
      <div class="score" id="score">0</div>
      <h3>High Score</h3>
      <div class="high-score" id="high-score">0</div>
   </div>
   ```

   この変更では、次の 3 種類の変更を確認できます。

   - `Score` ラベルを `Current Score` に変更する。
   - `High Score` の情報を追加する。
   - `status` の情報を削除する。

1. 作業ディレクトリと最後のコミットの差分を表示します。

   ```bash
   git diff src/index.html
   ```

   <img width="500px" src="https://github.com/user-attachments/assets/f41d6917-1651-4549-bb7b-5441a1832e38"/>

1. 変更をステージングエリアへ追加します。

   ```bash
   git add src/index.html
   ```

1. 同じ比較をもう一度実行します。作業ディレクトリがステージングエリアと一致したため、何も表示されないことに注目してください。

   ```bash
   git diff src/index.html
   ```

1. ステージングエリアと最後のコミットの差分を表示します。

   ```bash
   git diff --staged src/index.html
   ```

   <img width="500px" src="https://github.com/user-attachments/assets/f6aad38c-56fa-49ed-8209-9fe249c209ff"/>

1. 次のメッセージで変更をコミットします。

   ```md
   git commit -m "Add element for showing high score"
   ```

   <img width="500px" src="https://github.com/user-attachments/assets/8381b943-ca22-4b22-97b5-4520e174fc4c"/>

### アクティビティ 2: VS Code で差分を見る

さらにゲームへ変更を加え、VS Code で差分を表示してみましょう。

1. `src/patterns.js` を開きます。

1. `line 3` で、`Null Pointer` の部分を次の例に置き換えてパターンを変更します。

   ```txt
   {
     name: "Null Pointer",
     pattern: [
       [0, 1, 1, 1, 0],
       [0, 1, 0, 1, 0],
       [0, 1, 1, 1, 0],
       [0, 0, 1, 0, 0],
       [0, 0, 1, 0, 0],
     ],
   },
   ```

1. **File Explorer** で、`patterns.js` のファイル名の色が変わり、変更済みを示す `M` が付いていることを確認します。

   <img width="350px" src="https://github.com/user-attachments/assets/93a8f34c-9b16-4783-bc46-81532cdeffdf"/>

1. **Source Control** タブを開きます。**Changes** 一覧で `patterns.js` をダブルクリックし、Diff ビューを開きます。

   <img width="350px" src="https://github.com/user-attachments/assets/4dce9e42-caca-4c6e-a6fe-8d83d58cd06d"/><br/>

   <img width="500px" src="https://github.com/user-attachments/assets/4c410689-2a53-462f-9200-79d21bddbf2c"/>

   > **Tip**: 比較ビューの中でも内容を編集できます。変更結果を確認しながら調整できます。

1. ファイルを **staging** エリアへ追加します。まだコミットしないでください。

   現在のファイルがステージングエリアと一致したため、比較ビューに変更が表示されなくなることを確認します。

   <img width="500px" src="https://github.com/user-attachments/assets/b1274ece-2b03-42d2-88e8-9f3aaaa8f2c5"/>

1. **Staged Changes** 一覧で `patterns.js` をダブルクリックし、Diff ビューを開きます。

   ここでは変更できないことに注目してください。ステージングエリアは、コミットに備えて内容が固定された状態です。

   <img width="350px" src="https://github.com/user-attachments/assets/da306727-49f1-4f73-9f38-3a0e5d406cef"/><br/>

   <img width="500px" src="https://github.com/user-attachments/assets/de1448eb-d0dd-4ec5-89a2-74fb4aa1cf5f"/>

1. 次のメッセージで変更をコミットします。

   ```txt
   Make null pointer pattern easier to complete
   ```

1. 新しいコミットを追加すると、Mona が作業内容の確認を始めます。少し待って、コメント欄を確認してください。進捗情報と次のステップが投稿されます。

<details>
<summary>うまくいかない場合</summary><br/>

- 変更一覧が 1 画面に収まらない場合は、`q` を押すとスクロール表示を終了できます。

</details>
