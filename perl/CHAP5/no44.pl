# 44. 係り受け木の可視化
# 与えられた文の係り受け木を有向グラフとして可視化せよ．可視化には，係り受け木をDOT言語に変換し，Graphvizを用いるとよい．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
use Graphviz::DSL;
binmode STDOUT, ':encoding(utf-8)';

# 入力
my @each_sentence = split /EOS\n/, &LIB::fopen("../../data/neko.txt.cabocha");

# 1文毎に係り受け解析結果(形態素)の読み込み
my @all_nodes = &LIB::makeChunkResultNodes(\@each_sentence);

# 係り受け木の入力文(例として8文目を入力)
my @chunks = @{$all_nodes[5]};

# DOT言語の変換
my $graph = graph {
	name 'dependency relation';
	nodes fontname => 'Ricty'; # フォント指定(文字化けに注意)
	edges fontname => 'Ricty'; # フォント指定

	my @texts = ();
	for(my $i = 0; $i < $#chunks + 1; $i++) {
		# 係り元のテキスト => 係り先のテキスト
		route $chunks[$i]->{text} => $chunks[$chunks[$i]->{dst}]->{text} if $chunks[$i]->{dst} != -1;
		push(@texts, $chunks[$i]->{text});
	}

	rank 'same', @texts; # 全てのノードを同じランク(高さ)に設定
};

# out44.dotを生成
my $filename = 'out44';
$graph->save(path => $filename, encoding => 'utf-8');
# out44.pngを生成
system("dot -Tpng $filename.dot -o $filename.png");