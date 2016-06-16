# 03. 円周率
# "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
# という文を単語に分解し，各単語の（アルファベットの）文字数を先頭から出現順に並べたリストを作成せよ．

use strict;
use warnings;

my $str = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.";
$str =~ s/\,|\.//g;
my @word = split(" ", $str);
my @list = ();
push(@list, length $_) foreach @word;
print shift(@list) . "." . join("", @list) . "\n";

# **************
#    実行結果
# **************
# 3.14159265358979
# [Finished in 0.1s]