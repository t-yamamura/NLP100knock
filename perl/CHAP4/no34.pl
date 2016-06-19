# 34. 「AのB」
# 2つの名詞が「の」で連結されている名詞句を抽出せよ．

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

# 出力(「名詞」+「の」+「名詞」の組を抽出)
my $OUT = '';
foreach my $nodes (@all_nodes) {
	for(my $i = 0; $i < $#{$nodes} - 1; $i++) {
		if($nodes->[$i]->{pos} eq '名詞' && $nodes->[$i+1]->{surface} eq 'の' && $nodes->[$i+2]->{pos} eq '名詞') {
			$OUT .= $nodes->[$i]->{surface} . $nodes->[$i+1]->{surface} . $nodes->[$i+2]->{surface} . "\n";
		}
	}
}

&LIB::fwrite("out34.txt", $OUT);

# **************
#    実行結果
# **************
# 実行結果はout34.txtを参照