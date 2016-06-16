# 14. 先頭からN行を出力
# 自然数Nをコマンドライン引数などの手段で受け取り，入力のうち先頭のN行だけを表示せよ．確認にはheadコマンドを用いよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(Shift_JIS)';

my $N;
$N = @ARGV == 1 ? $ARGV[0] : 0;
my @text = split/\n/, &LIB::fopen("../../data/hightemp.txt");

print $text[$_] . "\n" for (0..$N-1);

# **************
#    実行結果
# **************

###
### N = 5
###
# 高知県	江川崎	41	2013-08-12
# 埼玉県	熊谷	40.9	2007-08-16
# 岐阜県	多治見	40.9	2007-08-16
# 山形県	山形	40.8	1933-07-25
# 山梨県	甲府	40.7	2013-08-10
# [Finished in 0.1s]