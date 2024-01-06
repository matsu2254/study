---
marp: true
theme: uncover
paginate: true
header: 
footer: by @matsu3365

---

# ふわっと学ぶ　Pandas入門

<!-- 

「ふわっと学ぶ　Pandas入門」と題してお話させていただきます。
なぜふわっとかと言えば、教科書てきに教えられて身につくようなものではないので、
「ふわっとさらっと、Pandas 怖くないよ！」
って伝えられればと思います。

まぁあとでゴリゴリ演習があるのですが…
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

 -->

---

## データの読み込みとエクスポート

`pd.read_*`や`df.to_*`というような構文

![pic](https://pandas.pydata.org/docs/_images/02_io_readwrite.svg)

>https://pandas.pydata.org/docs/getting_started/index.html

<!-- 

特段説明する必要もありませんが、read_某やto_某という形で読み込んだり書き込んだりします。

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

行の添え字を`index`と呼ぶ
pandasでは列とindexをセットで`Series`と呼ぶ

![pic](https://pandas.pydata.org/docs/_images/01_table_series.svg)

<!-- 

列だけ切り取っても、添字がついてきてくれます。

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
df[['A','B','C']].loc['1'].sum() 
#df.drop('D',axis=True).loc['1'].sum() # 勿論これでもOK
~~~

![Alt text](../img/image-6.png)

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

---
# ここまでのおさらい

https://github.com/matsu2254/study/blob/dev/material/20240112_pandas_nyumon/notebook/pandas_nyumon.ipynb

---

# そろそろ本気出す
（｀・ω・´）((ｷﾘｯ

<!-- 

習うより慣れろ、脳筋演習タイムです

 -->
---

## 応用（１）

基本的な表データの読み込みなど



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

## ご清聴ありがとうございました

---
# 参考文献

https://pandas.pydata.org/docs/getting_started/index.html
https://ja.wikipedia.org/wiki/Pandas
https://note.nkmk.me/pandas/

