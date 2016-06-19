# 36. 単語の出現頻度
# 文章中に出現する単語とその出現頻度を求め，出現頻度の高い順に並べよ．

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

# 単語の出現頻度をカウント
my %cnt = ();
foreach my $nodes (@all_nodes) {
	foreach my $node (@{$nodes}) {
		# キーが既に存在すればインクリメント, なければ1で初期化
		$cnt{$node->{surface}} = exists $cnt{$node->{surface}} && $node->{pos} eq '名詞' ? ++$cnt{$node->{surface}} : 1;
	}
}

# 出力(出現頻度の降順)
my $OUT = '';
foreach my $key (sort {$cnt{$b} <=> $cnt{$a}} keys %cnt) {
	$OUT .= $cnt{$key} . "\t" . $key . "\n";
}
&LIB::fwrite("out36.txt", $OUT);

# **************
#    実行結果
# **************
# 実行結果はout36.txtを参照