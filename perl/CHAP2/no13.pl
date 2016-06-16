# 13. col1.txtとcol2.txtをマージ
# 12で作ったcol1.txtとcol2.txtを結合し，元のファイルの1列目と2列目をタブ区切りで並べたテキストファイルを作成せよ．
# 確認にはpasteコマンドを用いよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

my @col1 = split/\n/, &LIB::fopen("col1.txt");
my @col2 = split/\n/, &LIB::fopen("col2.txt");
my @merge = ();
push(@merge, $col1[$_] . "\t" . $col2[$_]) for (0..$#col1);

&LIB::fwrite("merge.txt", join("\n", @merge));
print join("\n", @merge);

# **************
#    実行結果
# **************
# 高知県	江川崎
# 埼玉県	熊谷
# 岐阜県	多治見
# 山形県	山形
# 山梨県	甲府
# 和歌山県	かつらぎ
# 静岡県	天竜
# 山梨県	勝沼
# 埼玉県	越谷
# 群馬県	館林
# 群馬県	上里見
# 愛知県	愛西
# 千葉県	牛久
# 静岡県	佐久間
# 愛媛県	宇和島
# 山形県	酒田
# 岐阜県	美濃
# 群馬県	前橋
# 千葉県	茂原
# 埼玉県	鳩山
# 大阪府	豊中
# 山梨県	大月
# 山形県	鶴岡
# 愛知県	名古屋[Finished in 0.2s]