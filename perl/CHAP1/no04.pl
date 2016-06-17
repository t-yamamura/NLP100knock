# 04. 元素記号
# "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
# という文を単語に分解し，1, 5, 6, 7, 8, 9, 15, 16, 19番目の単語は先頭の1文字，それ以外の単語は先頭に2文字を取り出し，
# 取り出した文字列から単語の位置（先頭から何番目の単語か）への連想配列（辞書型もしくはマップ型）を作成せよ．

use strict;
use warnings;

# .を削除し, スペース毎に分割して各単語毎にリスト化
my $str = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.";
$str =~ s/\.//g;
my @word = split(" ", $str);

my %hash = ();
my @num = qw/1 5 6 7 8 9 15 16 19/;
for(my $i = 0; $i < $#word + 1; $i++) {
	my @char = split //, $word[$i];
	if(grep {$_ == $i + 1} @num) {
		$hash{$char[0]} = $i + 1; # 先頭の1文字をkeyに
	} else {
		$hash{$char[0] . $char[1]} = $i + 1; # 先頭の2文字をkeyに
	}
}

# 元素番号順(単語の位置の昇順)に出力
foreach my $key (sort {$hash{$a} <=> $hash{$b}} keys %hash) {
	print "$hash{$key} : $key\n";
}

# **************
#    実行結果
# **************
# 1 : H
# 2 : He
# 3 : Li
# 4 : Be
# 5 : B
# 6 : C
# 7 : N
# 8 : O
# 9 : F
# 10 : Ne
# 11 : Na
# 12 : Mi
# 13 : Al
# 14 : Si
# 15 : P
# 16 : S
# 17 : Cl
# 18 : Ar
# 19 : K
# 20 : Ca
# [Finished in 0.1s]