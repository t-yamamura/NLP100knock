# 05. n-gram
# 与えられたシーケンス（文字列やリストなど）からn-gramを作る関数を作成せよ．
# この関数を用い，"I am an NLPer"という文から単語bi-gram，文字bi-gramを得よ．

use strict;
use warnings;
use lib ".";
use LIB;
use Encode;

my $str = "I am an NLPer";
my @word = split(" ", $str);
my $N = 2;
my @ngram_word = &LIB::getWordNgram($N, \@word);
my @ngram_char = &LIB::getCharNgram($N, \@word);
print encode('shift_jis', decode('utf-8', "単語$Nグラム : ")) . join(" ", @ngram_word) . "\n";
print encode('shift_jis', decode('utf-8', "文字$Nグラム : ")) . join(" ", @ngram_char) . "\n";
