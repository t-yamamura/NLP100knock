# 10. 行数のカウント
# 行数をカウントせよ．確認にはwcコマンドを用いよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

# 入力ファイル(hightemp.txt)を1行毎にリスト化
my @text = split/\n/, &LIB::fopen("../../data/hightemp.txt");
print "行数 : " . eval($#text + 1). "\n";

# **************
#    実行結果
# **************
# 行数24
# [Finished in 0.1s]