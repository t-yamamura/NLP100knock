;#####################
;# perl Library LIB
;#####################
package LIB;

use strict;
use warnings;
use utf8;
use JSON;

# *******************************************************************
# 単語Nグラムを返す (No.05, 06)
#
# $param  N, List
# $return 単語N-gram
# *******************************************************************
sub getWordNgram {
	my ($n, $array) = @_;
	my @ngram = ();
	for(my $i = 0; $i < $#{$array} + 2 - $n; $i++) {
		my $hoge = '';
		$hoge .= $array->[$i + $_] for (0..$n-1);
		push(@ngram, $hoge);
	}
	return @ngram;
}

# *******************************************************************
# 文字Nグラムを返す(No.05, 06)
#
# $param  N, List
# $return 文字N-gram
# *******************************************************************
sub getCharNgram {
	my ($n, $array) = @_;
	my @ngram = ();
	my @char = split('', join('', @{$array}));
	for(my $i = 0; $i < $#char + 2 - $n; $i++) {
		my $hoge = '';
		$hoge .= $char[$i + $_] for (0..$n-1);
		push(@ngram, $hoge);
	}
	return @ngram;
}

# *******************************************************************
# 読み込みファイルのテキスト内容を受け取る
#
# $param  読み込みファイルパス
# $return 読み込みファイルのテキスト
# *******************************************************************
sub fopen {

	# 引数受け取り
	my ( $pass ) = @_;

	# 入力ファイルオープン
	open(my $FH , "<:utf8", $pass) or die "Cannot open $pass: $!";

	# テキスト読み込み
	my $text;
	{
		local $/ = undef;
		$text = readline $FH;
	}
	close $FH;

	return $text;

}

# *******************************************************************
# 引数に渡したテキスト内容を出力ファイルに書き込む
#
# $param0,1  (書き込みファイルパス, テキスト)
# $return
# *******************************************************************
sub fwrite {

	# 引数受け取り
	my ( $pass, $text ) = @_;

	# 出力ファイルオープン
	open(my $FH , ">:utf8", $pass) or die "Cannot open $pass: $!";

	# ファイルの書き込み
	print $FH $text;
	close $FH;

}

# *******************************************************************
# Wikipediaの記事からあるタイトルのテキストを返す
#
# $param0,1  (データのパス, タイトル)
# $return    あるタイトルのテキスト
# *******************************************************************
sub getTextFromWiki {

	my ($pass, $title) = @_;

	my $text = '';
	my @wiki = split /\n/, &fopen($pass);
	foreach my $line (@wiki) {
		my $article = JSON->new()->decode($line);
		$text = $article->{text} if $article->{title} eq $title;
	}

	return $text;

}

# ******************************************************************
# MeCabの解析結果をリストで受け取る
#
# \@param 形態素解析結果
# @return Mecab解析結果のリスト
# *******************************************************************
sub makeMecabResultNodes {

	# 引数受け取り
	my ($ref_each_sentence) = @_;

	# ノード情報のリスト
	my @all_nodes = ();

	# 1文単位で処理
	foreach my $sentence (@{$ref_each_sentence}) {
		next if $sentence eq ''; # 改行(EOS)が続く場合はスキップ
		my @nodes = ();
		my @each_node = split/\n/, $sentence;

		# 各ノード(単語)毎に形態素解析結果をハッシュ化
		foreach my $node (@each_node) {
			my ($surface, $feature) = split /\t/, $node;
			my ($pos, $pos1, $pos2, $pos3, $katsuyo1, $katsuyo2, $base, $yomi, $hatsuon) = split /,/, $feature;

			my %node_info = (	surface  => $surface,	# 表層形
								pos      => $pos,		# 品詞
								pos1     => $pos1,		# 品詞細分類1
								pos2     => $pos2,		# 品詞細分類2
								pos3     => $pos3,		# 品詞細分類3
								katsuyo1 => $katsuyo1,	# 活用型
								katsuyo2 => $katsuyo2,	# 活用形
								base     => $base,		# 原形
								yomi     => $yomi,		# 読み
								hatsuon  => $hatsuon);	# 発音

			# ノード情報をリストに追加
			push(@nodes, \%node_info);
		}

		# 1文毎に各ノードをリストに追加
		push(@all_nodes, \@nodes);
	}

	return @all_nodes;

}


1; # omazinai
