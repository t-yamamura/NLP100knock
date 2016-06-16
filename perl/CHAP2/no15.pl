# 15. 末尾のN行を出力
# 自然数Nをコマンドライン引数などの手段で受け取り，入力のうち末尾のN行だけを表示せよ．確認にはtailコマンドを用いよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

my $N;
$N = @ARGV == 1 ? $ARGV[0] : 5;
my @text = split/\n/, &LIB::fopen("../../data/hightemp.txt");

print $text[$_] . "\n" for ($#text-$N+1..$#text);

# **************
#    実行結果
# **************

###
### N = 5
###
# 埼玉県	鳩山	39.9	1997-07-05
# 大阪府	豊中	39.9	1994-08-08
# 山梨県	大月	39.9	1990-07-19
# 山形県	鶴岡	39.9	1978-08-03
# 愛知県	名古屋	39.9	1942-08-02
# [Finished in 0.1s]