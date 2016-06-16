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

1; # omazinai
