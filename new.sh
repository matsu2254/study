#!/bin/bash

if [ -z "$1" ];then
    cat << EOF
    引数が必要です。
    第一引数にスライド・資材フォルダの名前を指定してください。
EOF
    exit 1
fi

if [ -e "docs/$1.md" ];then
    echo file exists
    exit 1
fi

if [[ $1 =~ 20[2-9][0-9][0-1][0-9][0-3][0-9]_.* ]];then
    echo pass
else
    echo "20230101_nameのような命名に従ってください"
    exit 1
fi

cat << EOF > docs/$1.md
---
# marpをオンに
marp: true
# ページ番号
paginate: true
# テーマ
theme: default
#class: invert # 白黒反転
#header: "**〇〇株式会社など**"
#footer: "by 作成者名など"
---
EOF

mkdir material/$1

(
    cd material/$1 &&  ln -s ../../docs/$1.md $1.md
)