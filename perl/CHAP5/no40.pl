# 40. 係り受け解析結果の読み込み（形態素）
# 形態素を表すクラスMorphを実装せよ．
# このクラスは表層形（surface），基本形（base），品詞（pos），品詞細分類1（pos1）をメンバ変数に持つこととする．
# さらに，CaboChaの解析結果（neko.txt.cabocha）を読み込み，各文をMorphオブジェクトのリストとして表現し，3文目の形態素列を表示せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
use Morph;
binmode STDOUT, ':encoding(utf-8)';

# 入力
my @each_sentence = split /EOS\n/, &LIB::fopen("../../data/neko.txt.cabocha");

# 1文毎に係り受け解析結果(形態素)の読み込み
my @all_nodes = &makeMorphResultNodes(\@each_sentence);

# ******************************************************************
# Cabochaの解析結果をリストで受け取る
#
# \@param 形態素解析結果
# @return 形態素解析結果のリスト
# *******************************************************************
sub makeMorphResultNodes {

	# 引数受け取り
	my ($ref_each_sentence) = @_;

	# ノード情報のリスト
	my @all_nodes = ();

	foreach my $sentence (@{$ref_each_sentence}) {
		next if $sentence eq '';
		my @nodes = ();
		my @each_node = split/\n/, $sentence;

		# 各ノード(単語)毎に携帯し解析結果をハッシュ化
		foreach my $node (@each_node) {
			if($node =~ /\t/) {
				my ($surface, $feature) = split /\t/, $node;
				my ($pos, $pos1, $base) = (split /,/, $feature)[0,1,6];
				my $morph = Morph->new();
				$morph->setMorph($surface, $base, $pos, $pos1);
				push(@nodes, $morph);
			}
		}
		push(@all_nodes, \@nodes);
	}

	return @all_nodes;

}

# **************
#    実行結果
# **************
# [Finished in 3.7s]