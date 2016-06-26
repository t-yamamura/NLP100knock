;#####################
;# perl Library LIB
;#####################
package LIB;

use strict;
use warnings;
use utf8;
use JSON;
use Morph;
use Chunk;


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
# 2つの配列の和集合(X∪Y)を返す
#
# $param  配列X, 配列Y
# $return 和集合(X∪Y)
# *******************************************************************
sub getUnion {
	my ($array1, $array2) = @_;
	my %cnt = ();
	return grep { ++$cnt{$_} == 1} (@{$array1}, @{$array2});
}

# *******************************************************************
# 2つの配列の積集合(X∩Y)を返す
#
# $param  配列X, 配列Y
# $return 積集合(X∩Y)
# *******************************************************************
sub getProductSet {
	my ($array1, $array2) = @_;
	my %cnt = ();
	return grep {++$cnt{$_} == 2} (@{$array1}, @{$array2});
}

# *******************************************************************
# 2つの配列の差集合(X-Y)を返す
#
# $param  配列X, 配列Y
# $return 積集合(X∩Y)
# *******************************************************************
sub getDifferenceSet {
	my ($array1, $array2) = @_;
	my %cnt = ();
	map { $cnt{$_}-- } @{$array2};
	return grep {++$cnt{$_} == 1} @{$array1};
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

# ******************************************************************
# Cabochaの解析結果をリストで受け取る
#
# \@param 係り受け解析結果
# @return 係り受け解析結果のリスト
# *******************************************************************
sub makeChunkResultNodes {

	# 引数受け取り
	my ($ref_each_sentence) = @_;

	# ノード情報のリスト
	my @all_nodes = ();


	foreach my $sentence (@{$ref_each_sentence}) {
		next if $sentence eq '';
		my @nodes = ();
		my @dependency = ();
		my $chunk = Chunk->new();
		my @lines = split /\n/, $sentence;
		my $head = -1;
		my $position = 0;

		# 各文節毎にMophs, dst, srcsの解析結果を保持
		for(my $i = 0; $i < $#lines + 1; $i++) {

			# 文節情報
			if($lines[$i] =~ /\* /) {
				my ($aster, $phrase_num, $dst, $head_func, $score) = split /\ /, $lines[$i];
				$dst =~ s/D//g;
				$head = (split //, $head_func)[0];
				$chunk = Chunk->new();
				$chunk->setChunk($phrase_num, '', '', $dst, '', '', '');
				$dependency[$phrase_num] = $dst;
				push(@nodes, $chunk);

				# 文節番号を初期化
				$position = 0;
			}
			# 文節内の形態素
			elsif($lines[$i] =~ /\t/) {
				my ($surface, $feature) = split /\t/, $lines[$i];
				my ($pos, $pos1, $base) = (split /,/, $feature)[0,1,6];
				my $morph = Morph->new();
				$morph->setMorph($surface, $base, $pos, $pos1);
				push(@{$chunk->{morphs}}, $morph);

				# 記号以外の表層を結合
				$chunk->{text} .= $surface if $pos ne '記号';

				# 文節中の主辞の情報を保持
				if($position == $head) {
					$base = $surface if $base eq '*';
					$chunk->{head_wrd} = $base;
					$chunk->{head_pos} = $pos;
				}

				# 文節番号をカウント
				$position++;
			}

			# 最後の文節のとき
			if($i == $#lines) {
				# 係り元のリストの作成
				for(my $j = 0; $j < $#nodes + 1; $j++) {
					push(@{$nodes[$j]->{srcs}},  grep {$j == $dependency[$_]} (0..$#dependency));
					@{$nodes[$j]->{srcs}} = sort @{$nodes[$j]->{srcs}};
				}
				# 1文内の全ての文節をリストに追加
				push(@all_nodes, \@nodes);
			}
		}
	}

	return @all_nodes;
}



1; # omazinai
