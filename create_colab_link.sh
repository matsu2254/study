#!/bin/bash


if [ -z "$1" ];then
    cat << EOF
    引数が必要です。
    notebookのGitHub URLを指定してください
EOF
    exit 1
fi


if [[ $1 =~ http(s)?://github.com/.*/blob/.*/.*\.ipynb ]];then
    echo pass
else
    echo "URLが正しくありません"
    exit 1
fi

URL=`echo $1 | sed "s@\(http\|https\)://github.com@http://colab.research.google.com/github@g"`

echo URL: $URL
echo "[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)]($URL)"