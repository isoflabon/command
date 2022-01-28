#!/bin/sh
# 拡張子ごとにディレクトリを作成しExtend以下に拡張子の名前で格納
# 既存のディレクトリはそのまま

# Extendディレクトリがない場合のみ作成
extend="Extend"
if [ -e $extend ]; then
	echo "\tINFO: $extend 以下にデータを整理します"
else
	printf "\t\e[34mCREATE\e[30m: Extendディレクトリを作成します\n"
	mkdir $extend
fi

# ls の結果を1行ずつ読み込む
ls -1 | while read filename
do
	# 空白を含んだファイルをSkip
	if [ -d "$filename" ]; then
		printf "\t\e[30mSKIP\e[30m: $filename はDirectoryです\n"
		continue
	fi
	
	# 空白を取り除き拡張子の取り出し
	ext=`echo $filename | sed 's/ //g' | sed 's/^.*\.\([^\.]*\)$/\1/'`
	if [ $ext = `echo $filename | sed 's/ //g'` ]; then printf "\t\e[31mSKIP: $filename には拡張子がありません\e[30m\n"; continue; fi
	
	if [ ! -d $extend/$ext ]; then
		printf "\t\e[34mCREATE\e[30m: $ext ディレクトリを作成します\n"
		mkdir $extend/$ext
	fi

	echo "\tMOVE: $extend/$ext ディレクトリへ $filename を移動させます"
	mv "$filename" $extend/$ext
done
