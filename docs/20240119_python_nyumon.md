---
# marpをオンに
marp: true
# ページ番号
paginate: true
# テーマ
theme: uncover

---

# Pythonの始め方

---

# TL;DR
## PCにインストール

---

~~~
@REM 公式からインストーラーをDL
curl -o python-3.11.exe https://www.python.org/ftp/python/3.11.7/python-3.11.7-amd64.exe

@REM コマンドラインでインストーラーを実行
@REM https://docs.python.org/ja/3/using/windows.html#installing-without-ui
echo ユーザーアカウント制御が開きますので「はい」（許可）をクリック
start /wait python-3.11.exe /passive InstallAllUsers=1 PrependPath=1 Include_test=0

@REM pathの一時設定
path C:\Program Files\Python311\Scripts\;C:\Program Files\Python311\;%PATH%

@REM jupyterのインストール
@REM https://jupyter.org/install
pip install notebook

@REM jupyterの起動。ブラウザが開く
python -m notebook
~~~
https://qiita.com/matsu3365/items/e1d50f2a8b6cd063f22e

---

## Colab

1. Googleアカウントでログイン
2. https://colab.research.google.com/?hl=ja
3. notebookはgoogleドライブに保存する

>勝手に切れる。切れるとデータ消えたりするので注意

---

# pythonとは何ぞや？

インタープリタ型言語です。

個人的に、プログラミング言語というより、シェルに近いものと思った方が違和感が少ないです。

お作法的な句が少なく、断片でも動いてしまう

---

# プログラミングはどうやったら覚えられる？

## → **手を動かすしかない！！**

新しい言語を覚える時はコレを実装してみる的なお気に入りのロジック持とう！

---

## e.g.

私が新しい言語を覚え始める時は下の二つを作ってみます。

- バブルソート
- マインスイーパー

また、違う言語の教本に書いてあるロジックをコンバートしてみるというのも結構違いが分かりやすく面白いです。

---

## e.g.

逆ポーランド表記法の電卓を作ってみる

例えば、「3 足す 4」 

普通

~~~
3 + 4
~~~

逆ポーランド記法

~~~
3 4 +
~~~

---

標準的なライブラリで実装でき、構文の解析がそこまでめんどくさくないので、度々実装の練習などに使われます。

https://ja.wikipedia.org/wiki/%E9%80%86%E3%83%9D%E3%83%BC%E3%83%A9%E3%83%B3%E3%83%89%E8%A8%98%E6%B3%95

---

# 終わりに

プログラミングと試験は別物です

どっちかといえばプログラミングのほうが大事です

どうせプログラミングするなら楽しいことをやりましょう
