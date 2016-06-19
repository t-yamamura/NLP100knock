# 35. 名詞の連接
# 名詞の連接（連続して出現する名詞）を最長一致で抽出せよ．

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

# 出力(名詞の連接の最長一致を抽出)
my $OUT = '';
foreach my $nodes (@all_nodes) {
	my @noun_phrase = ();
	foreach my $node (@{$nodes}) {
		# 名詞なら現在のリストに追加
		if($node->{pos} eq '名詞') {
			push(@noun_phrase, $node->{surface});
		}
		# リストが空でなければ現在のリストを表示
		elsif(@noun_phrase) {
			$OUT .= join("", @noun_phrase) . "\n";
			@noun_phrase = ();
		}
	}
}

&LIB::fwrite("out35.txt", $OUT);

# **************
#    実行結果
# **************
# 実行結果はout35.txtを参照