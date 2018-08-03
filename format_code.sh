#!/bin/bash
# C,C++のソースのフォーマットを整える

# 飾りコメント削除
## "/******" => "/**"
sed -ri 's/\/\*+/\/\**/g' main.cc
## "******/" => "*/"
sed -ri 's/\*+\//\*\//g' main.cc

# doxygenの不要属性削除
sed -ri '/@author/d' main.cc
sed -ri '/@date/d' main.cc
#sed -ri '/@note/d' main.cc

# astyleで連続するタブを削除する方法はなさそうだったのでsed使う
sed -ri 's/\t+/ /g' main.cc

# astyleのoptioin詳細は、
# http://astyle.sourceforge.net/astyle.html を参照
astyle \
    --style=attach            `#行末にbraceを配置` \
    -s4                       `#インデント = 空白4文字` \
    --attach-namespaces       `#namespaceブロック開始でインデントしない` \
    --pad-oper                `#演算子前後にスペース配置` \
    --pad-comma               `#カンマ後にスペース配置` \
    --align-pointer=name      `#変数の前に*配置` \
    --align-reference=type    `#データ型の後ろに&配置` \
    --break-one-line-headers  `#if文ブロックなど開始時に必ず改行` \
    --convert-tabs            `#インデント目的以外のタブも禁止(quote内はOK)` \
    main.cc

