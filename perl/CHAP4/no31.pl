# 31. 動詞
# 動詞の表層形をすべて抽出せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力
my @each_sentence = split /EOS\n/, &LIB::fopen("../../data/neko.txt.mecab");

# 1文毎に形態素解析結果の読み込み
my @all_nodes = &LIB::makeMecabResultNodes(\@each_sentence);

# 出力(動詞の表層刑の抽出)
my $OUT = '';
foreach my $nodes (@all_nodes) {
	foreach my $node (@{$nodes}) {
		$OUT .= $node->{surface} . "\n" if $node->{pos} eq '動詞';
	}
}

&LIB::fwrite("out31.txt", $OUT);

# **************
#    実行結果
# **************
# 実行結果はout31.txtを参照