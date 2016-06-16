# 09. Typoglycemia
# スペースで区切られた単語列に対して，各単語の先頭と末尾の文字は残し，それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．
# ただし，長さが４以下の単語は並び替えないこととする．適当な英語の文（例えば
# "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
# ）を与え，その実行結果を確認せよ．

use strict;
use warnings;
use List::Util qw/shuffle/;

my @str = split / /, "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind .";
my $typoglycemia = '';
foreach my $word (@str) {
	if(length $word <= 4) {
		$typoglycemia .= $word . " ";
	} else {
		my @char = split //, $word;
		my $first = shift @char;
		my $last = pop @char;
		$typoglycemia .= $first . join('', shuffle(@char)) . $last . " ";
	}
}
print $typoglycemia;


# **************
#    実行結果
# **************
# I cod'ulnt bvleiee that I cuold alclauty unerdatsnd what I was rediang : the pnoanhemel power of the human mind . [Finished in 0.1s]
# I cunl'dot biveele that I cluod alcaulty ustedanrnd what I was rnadeig : the pamnonheel pwoer of the huamn mind . [Finished in 0.1s]