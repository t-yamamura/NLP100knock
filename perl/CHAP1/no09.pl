# 09. Typoglycemia
# スペースで区切られた単語列に対して，各単語の先頭と末尾の文字は残し，それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．
# ただし，長さが４以下の単語は並び替えないこととする．適当な英語の文（例えば
# "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
# ）を与え，その実行結果を確認せよ．

use strict;
use warnings;
use List::Util qw/shuffle/;

# 入力(単語毎にリスト化)
my @str = split / /, "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind .";

# 並び替え処理
my $typoglycemia = '';
foreach my $word (@str) {
	# 文字数が4以下はそのまま
	if(length $word <= 4) {
		$typoglycemia .= $word . " ";
	}
	# それ以外は先頭と末尾以外を並び替える
	else {
		my @char = split //, $word;
		my $first = shift @char; # 先頭
		my $last = pop @char;    # 末尾
		$typoglycemia .= $first . join('', shuffle(@char)) . $last . " ";
	}
}

# 出力
print $typoglycemia;


# **************
#    実行結果
# **************
# I cod'ulnt bvleiee that I cuold alclauty unerdatsnd what I was rediang : the pnoanhemel power of the human mind . [Finished in 0.1s]
# I cunl'dot biveele that I cluod alcaulty ustedanrnd what I was rnadeig : the pamnonheel pwoer of the huamn mind . [Finished in 0.1s]