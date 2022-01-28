#!/bin/sh
# LaTexをコマンド1つでコンパイルするようにする
# 目標:ファイルを指定しなくてもディレクトリ内texファイルが1つのみであればそのファイルをコンパイル

# Helpオプション
if [ "$1" = "-h" -o "$1" = "--help" ] ; then
   echo "Help\nこのスクリプトtexファイルが存在するディレクトリで実行します。\n"
	 echo "オプション"
	 echo "-r ... コンパイル時の中間ファイルを削除します。"
	 exit
fi

# ファイル名の取得
file=`ls | grep *.tex`

# ファイルが見つからなかった場合の例外処理
if [ -z "$file" ]; then
   echo "同一ディレクトリにファイルが見つかりませんでした。"
	 echo "使い方は -h もしくは --help で参照してください。"
	 exit
fi

# コンパイル
platex $file > make.log
# 拡張子を取り除いたファイル名 
f=`echo $file | sed 's/\.[^\.]*$//'`

echo $f "をコンパイル"
dvipdfmx $f

# 引数に-rを渡すことで作業ファイルを削除する
if [ "$1" = "-r" ] ;then
	rm $f.log $f.dvi $f.aux
else
# 引数がない時もしくは"y"以外の時
	while :
	do
		printf "『作業ファイル(.texと.pdfを除く)』 を消しますか?[y or n] => "
		read ans
		case "$ans" in
			"y")
				rm $f.log $f.dvi $f.aux
				break;;
			"n")
				echo "完了しました"
				break;;
		esac
	done
fi
