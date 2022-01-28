#### cot.sh

```
cot ファイル名
```

でCotEditorで開くことが出来る。もしファイルがなければy or nで新規ファイル作成するかどうかを問う。templeteディレクトリの中にテンプレがあれば拡張子に合わせてそれを使う.

##### templete
命名規則:
	templete.<拡張子>で統一する.

#### rm.sh

```
rm ファイル名
```
mvのコマンドと使いかたは一緒。上記のコマンドで/.Trashゴミ箱に行くようになって少し安全。

#### tidy.sh

```
tidy.sh
```

実行したパスのディレクトリを整頓するためのシェル。
実行パスにExtendファイルを作成し、Extend以下に拡張子ごとにディレクトリを作る。
実行パスにあるファイルは名前が一致するExtend以下のディレクトリに対して移動させる。

**特殊な動作**
- 拡張子が無いファイルは移動しない。
- 拡張子に空白が含まれていた場合, 空白を取り除いた拡張子の名前のディレクトリへ移動する
→ `.jpg` と `.jp g` は `./Extend/jpg` ディレクトリへ移動する.

#### tidy_test.sh

tidy.shのテストコード。
様々なパターンに対応出来るよう作成した。

**テスト動作例**
```
 $  sh tidy_test.sh
---- Execute Test ----
		 PreCheck...	OK!
---- Generate Test Data ----
		 Create file: test.png
		 Create file: test.txt
		 Create file: test
		 Create file: test.log
		 Create file: test.jpeg
		 Create file: test.abc
		 Create file: test.jp g
		 Create file: test.jpg
		 Create file: te st.png
		 Create file: te st.txt
		 Create file: te st
		 Create file: te st.log
		 Create file: te st.jpeg
		 Create file: te st.abc
		 Create file: te st.jp g
		 Create file: te st.jpg
---- Execute Command ----
		 CREATE: Extendディレクトリを作成します
		 SKIP: Extend はDirectoryです
		 CREATE: test ディレクトリを作成します
		 MOVE: Extend/test ディレクトリへ te st を移動させます
		 CREATE: abc ディレクトリを作成します
		 MOVE: Extend/abc ディレクトリへ te st.abc を移動させます
		 CREATE: jpg ディレクトリを作成します
		 MOVE: Extend/jpg ディレクトリへ te st.jp g を移動させます
		 CREATE: jpeg ディレクトリを作成します
		 MOVE: Extend/jpeg ディレクトリへ te st.jpeg を移動させます
		 MOVE: Extend/jpg ディレクトリへ te st.jpg を移動させます
		 CREATE: log ディレクトリを作成します
		 MOVE: Extend/log ディレクトリへ te st.log を移動させます
		 CREATE: png ディレクトリを作成します
		 MOVE: Extend/png ディレクトリへ te st.png を移動させます
		 CREATE: txt ディレクトリを作成します
		 MOVE: Extend/txt ディレクトリへ te st.txt を移動させます
		 SKIP: test には拡張子がありません
		 MOVE: Extend/abc ディレクトリへ test.abc を移動させます
		 MOVE: Extend/jpg ディレクトリへ test.jp g を移動させます
		 MOVE: Extend/jpeg ディレクトリへ test.jpeg を移動させます
		 MOVE: Extend/jpg ディレクトリへ test.jpg を移動させます
		 MOVE: Extend/log ディレクトリへ test.log を移動させます
		 MOVE: Extend/png ディレクトリへ test.png を移動させます
		 MOVE: Extend/txt ディレクトリへ test.txt を移動させます
---- Check TestData ----
		 Success!
```