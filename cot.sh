#!/bin/sh

# 拡張子のテンプレディレクトリのパスを書く
Temple=~/GitProgram/Command/Templete/templete

file=$1

if [ -e $file ]; then
	open -a  CotEditor $file
else


# 拡張子を取得する
ext="${file##*.}"

while :
do
	printf "『 $file 』 is not exist. Create?[y or n] => "
	read ans
	case "$ans" in
		"y")
# 		拡張子のテンプレートがあればそれを使う.
		if [ -e $Temple.$ext ]; then
			cp $Temple.$ext $file
		else
			touch $file
		fi
			open -a CotEditor $file
			break;;
		"n")
			echo "Miss. Don't open the 『 $file 』!"
			break;;
	esac
done
fi