# 05. n-gram
# 与えられたシーケンス（文字列やリストなど）からn-gramを作る関数を作成せよ．
# この関数を用い，"I am an NLPer"という文から単語bi-gram，文字bi-gramを得よ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

my $str = "I am an NLPer";
my @word = split(" ", $str);
my $N = 2;
my @ngram_word = &LIB::getWordNgram($N, \@word);
my @ngram_char = &LIB::getCharNgram($N, \@word);
print "単語$N-グラム : " . join(" ", @ngram_word) . "\n";
print "文字$N-グラム : " . join(" ", @ngram_char) . "\n";


# **************
#    実行結果
# **************
# 単語2グラム : Iam aman anNLPer
# 文字2グラム : Ia am ma an nN NL LP Pe er
# [Finished in 0.2s]