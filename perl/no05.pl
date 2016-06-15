# 05. n-gram
# 与えられたシーケンス（文字列やリストなど）からn-gramを作る関数を作成せよ．
# この関数を用い，"I am an NLPer"という文から単語bi-gram，文字bi-gramを得よ．

use strict;
use warnings;
use Encode;

my $str = "I am an NLPer";
my @word = split(" ", $str);
my $N = 2;
my @ngram_word = &getWordNgram($N, \@word);
my @ngram_char = &getCharNgram($N, \@word);
print encode('shift_jis', decode('utf-8', "単語$Nグラム : ")) . join(" ", @ngram_word) . "\n";
print encode('shift_jis', decode('utf-8', "文字$Nグラム : ")) . join(" ", @ngram_char) . "\n";

###
### 単語バイグラムを返す
### ($n, $array) = (N, リスト)
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

###
### 文字バイグラムを返す
### ($n, $array) = (N, リスト)
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