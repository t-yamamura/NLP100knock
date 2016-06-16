# 12. 1列目をcol1.txtに，2列目をcol2.txtに保存
# 各行の1列目だけを抜き出したものをcol1.txtに，2列目だけを抜き出したものをcol2.txtとしてファイルに保存せよ．
# 確認にはcutコマンドを用いよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

my @text = split/\n/, &LIB::fopen("../../data/hightemp.txt");
my $COL1TEXT = '';
my $COL2TEXT = '';
foreach my $line (@text) {
	my ($col1, $col2) = split /\t/, $line;
	$COL1TEXT .= $col1 . "\n";
	$COL2TEXT .= $col2 . "\n";
}
&LIB::fwrite("col1.txt", $COL1TEXT);
&LIB::fwrite("col2.txt", $COL2TEXT);

# **************
#    実行結果
# **************

### col1.txt
# 高知県
# 埼玉県
# 岐阜県
# 山形県
# 山梨県
# 和歌山県
# 静岡県
# 山梨県
# 埼玉県
# 群馬県
# 群馬県
# 愛知県
# 千葉県
# 静岡県
# 愛媛県
# 山形県
# 岐阜県
# 群馬県
# 千葉県
# 埼玉県
# 大阪府
# 山梨県
# 山形県
# 愛知県

### col2.txt
# 江川崎
# 熊谷
# 多治見
# 山形
# 甲府
# かつらぎ
# 天竜
# 勝沼
# 越谷
# 館林
# 上里見
# 愛西
# 牛久
# 佐久間
# 宇和島
# 酒田
# 美濃
# 前橋
# 茂原
# 鳩山
# 豊中
# 大月
# 鶴岡
# 名古屋
