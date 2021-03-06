# 17. １列目の文字列の異なり
# 1列目の文字列の種類（異なる文字列の集合）を求めよ．確認にはsort, uniqコマンドを用いよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

# 入力 (1行毎にリスト化)
my @text = split/\n/, &LIB::fopen("../../data/hightemp.txt");

# 1列目のリストを作成
my @col1 = ();
foreach my $line (@text) {
	my @col = split/\t/, $line;
	push(@col1, shift @col);
}

# ハッシュを用いてユニークなキー(文字列の種類)のみのリストを作成
my %cnt = ();
my @col1_uniq = grep {++$cnt{$_} == 1} @col1;

# 出力
print join("\n", @col1_uniq);

# **************
#    実行結果
# **************
# 高知県
# 埼玉県
# 岐阜県
# 山形県
# 山梨県
# 和歌山県
# 静岡県
# 群馬県
# 愛知県
# 千葉県
# 愛媛県
# 大阪府[Finished in 0.1s]