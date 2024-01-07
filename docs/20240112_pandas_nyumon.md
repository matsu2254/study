---
marp: true
theme: uncover
paginate: true
header: 
footer: by @matsu3365

---
<!--
<h1 id="">熊猫(pandas)と和解せよ</h1>
-->

<h1><span style="color: yellow; ">熊猫</span><span style="color: white">と和解せよ</span><h1>      

<span style="color: grey">ふわっと学ぶ　Pandas入門</span>

<!-- 
_backgroundColor: black
 -->

<!-- 

「熊猫(パンダ)と和解せよ　ふわっと学ぶ　Pandas入門」と題してお話させていただきます。
教科書てきに教えられて身につくようなものではないので、
「ふわっとさらっと、Pandas 怖くないよ！」
って伝えた上で、気軽に動かしながら試していただきたいと思います。

つまり、あとでゴリゴリ演習があるのです。

-->

---
# Pandas Dataframeとは？

>pandasは、プログラミング言語Pythonにおいて、データ解析を支援する機能を提供するライブラリである。特に、数表および時系列データを操作するためのデータ構造と演算を提供する[2]…

<!-- 

pandasは、Pythonにおいて、データ解析を支援する機能を提供するライブラリである。特に、数表および時系列データを操作するためのデータ構造と演算を提供〜云々…
ん〜と、つまるところこれです

 -->
---

あまり難しく考えず、

## ≒pythonインタプリタから使えるエクセル

とふんわり考えておくが吉

<!-- 

これが今回いちばん言いたいこと

エクセルと同じように、行と列のテーブルがイメージできるようになればもう完璧です

なんとなくPandasに対していだいている心の抵抗感と和解しましょう

 -->

---

# Getting started

## インストール  

~~~
pip install pandas
import pandas as pd
~~~

---

## データ形式のおさらい

Pandas Dataframeでは主に表形式のデータを扱う
時系列データとして扱う場合は、index(縦の濃い色の列)に日付データをセットする
日付データの形式はかなり柔軟に対応している

![pic](https://pandas.pydata.org/docs/_images/01_table_dataframe.svg)

>https://pandas.pydata.org/docs/getting_started/index.html

<!-- 

行と列、両者を指定すれば単一の値が得られるし、列を指定すれば縦のベクトルが得られるし、列を指定すれば〜と色々ありますが、
どこのセルを選択していて、それに対してどういう操作しているのかイメージしながら使えるようになるととてもよきです

どう見てもエクセルですエクセル！

 -->

---

行の添え字を`index`と呼ぶ
pandasでは列とindexをセットで`Series`と呼ぶ

![pic](https://pandas.pydata.org/docs/_images/01_table_series.svg)

<!-- 

列だけ切り取っても、添字がついてきてくれます。

 -->

---

## データの読み込みとエクスポート

`pd.read_*`や`df.to_*`というような構文

![pic](https://pandas.pydata.org/docs/_images/02_io_readwrite.svg)

>https://pandas.pydata.org/docs/getting_started/index.html

<!-- 

特段説明する必要もありませんが、read_某やto_某という形で読み込んだり書き込んだりします

 -->
---

csvからの読み込みと年月日・時刻の結合、インデックスを結合した日付データに
~~~
df　= pd.read_csv(
        "./path/to/file.csv",
        parse_dates=[['<DTYYYYMMDD>','<TIME>']]
    ).set_index('<DTYYYYMMDD>_<TIME>')
~~~

pickleファイルからの読み込み

~~~
df = pd.read_pickle('./path/to/file.pickle')
~~~

書き出し

~~~
df.to_csv('./path/to/file.csv')
~~~

---

練習用にごく簡単なデータフレームを辞書からつくる

~~~
df = pd.DataFrame(
    {
        'A': [1, 2, 3, 6], 
        'B': [10, 20, 30, 40],
        'C': [100, 200, 300, 400],
        'D': ['a', 'b', 'c', 'd']
    },
    index=['1', '2', '3','4']
  )

df
~~~
---

## 見比べてみる

ほら、同じじゃん

|Pandas|エクセル(もどき)|
|-|-|
![Alt text](../img/image-3.png) |![Alt text](../img/image-5.png)

<!-- 

これを見て取れる通り、表現の違いはあれど、中身は一緒です。
だから表を頭に作りましょう。

 -->

---

'A'列だけを切り出す

~~~
df['A']
~~~

---

'A'列を足す
~~~
df['A'].sum()
~~~

![Alt text](../img/image-4.png)

エクセルで書くなら

~~~
=SUM(A1:A4)
~~~

<!-- 

基本的かつありがちな関数としてSUMを考えてみます。
A列の値すべてを選択肢、足し合わせているのだから、書き方の差異こそあれどそのままです。

 -->

---

1行目のA,B,Cを足す

~~~
df.loc[:'1','A':'C'].transpose().sum()
~~~

![Alt text](../img/Screenshot%20from%202024-01-06%2022-14-02.png)

エクセルで書くなら
~~~
=SUM(A1:C1)
~~~

---

基本的な統計情報の取得

~~~
df.describe()
~~~
![Alt text](../img/image-7.png)

---
## Pandasの基本的な操作

|||
|-|-|
loc      |    # 行列の複数の値を取得・変更
at       |    # 行列の単一値を取得・変更
drop     |    # 列をけす
rolling  |    # 窓関数的な
sum      |    # 合計の産出
describe |    # 基本的な統計値の算出
nlargest |    # N個の最大値を取得

agg,fillna, dropna, resample...etc...

<!-- 

pandasでよく使う操作として、以上のようなものがあります。
まだまだあります…
正直すべて覚えるのはつらいです。
なので適当にリファレンス的なものを参照しましょう。

 -->

---

なかなか覚えきれるものではない…

## とてもよいサイトがありました

https://note.nkmk.me/pandas/

https://qiita.com/kaita_kakihara/items/bf66e9e4927a3e3589e4

<!-- 

どちらも懇切丁寧で、上のサイトは割としょっちゅうお世話になっています。
オフラインの方が少ない現代人なのですから、WEBでもChatGPTでも使えるものはなんでも使います。
notebookの解説もChatGPTに書いてもらいました。

 -->

---
# ここまでのおさらい

https://github.com/matsu2254/study/blob/dev/material/20240112_pandas_nyumon/notebook/pandas_nyumon.ipynb

---

# そろそろ本気出す
（｀・ω・´）((ｷﾘｯ

<!-- 

習うより慣れろ、脳筋演習タイムです

手を動かさなければ絶対覚えられません
読めても書けない漢字ってあるでしょう？
とりあえず手をうごかすのです

 -->
---

## 応用（１）

基本的な表データの読み込みなど

https://github.com/matsu2254/study/blob/main/material/20240112_pandas_nyumon/notebook/zissen1.ipynb


---

### notebook 課題
- 色々こねくり回して何が言えるのか？調べてみる
- それぞれどのような値を撮っているか統計とる

---

## 応用（２）

時系列データの読み込みと表示

ここでは、ポンド円相場のデータを利用し、データの前処理や、可視化について見ていきます。

https://github.com/matsu2254/study/blob/main/material/20240112_pandas_nyumon/notebook/zissen2.ipynb

---

### notebook 課題

- 期間を変えて描写してみる（予測の結合をやめる必要がある？）
- 移動平均線やRSIを自分で算出してみる
- 時間足を変える

---

## Pandasと和解できましたか？

方法論としてはこのぐらいにして、
**お困りごとの沼**へ沈みましょう
<br></br>
: (((;"°;ω°;)):ｶﾞｸｶﾞｸｶﾞｸ

<!-- 

和解できましたでしょうか？
思うところは種々あれど、とりあえず

これでどうやって「お困りごとにどう活かせるの？」ということを考えなくてはなりません。

散々Pandasについて語った上で言うのもアレですが…
これらの概念を理解するコトは大切ですが、Pandasは具象の一つに過ぎず、固執する必要はありません。
Pandasは表現の一つに過ぎません。
Rにもベクトルはありますし、なんならAWKでもCSVの処理ぐらいできるわけで、

お困りごとを”かんたんに解決できる手段”を第一に考えるべきです。

 -->

---
## ご清聴ありがとうございました

---
# 参考文献

https://pandas.pydata.org/docs/getting_started/index.html
https://ja.wikipedia.org/wiki/Pandas
https://note.nkmk.me/pandas/

