# 04. 元素記号
# "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
# という文を単語に分解し，1, 5, 6, 7, 8, 9, 15, 16, 19番目の単語は先頭の1文字，それ以外の単語は先頭に2文字を取り出し，
# 取り出した文字列から単語の位置（先頭から何番目の単語か）への連想配列（辞書型もしくはマップ型）を作成せよ．

use strict;
use warnings;

my $str = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.";
$str =~ s/\.//g;
my @word = split(" ", $str);

my %hash = ();
my @num = qw/1 5 6 7 8 9 15 16 19/;
for(my $i = 0; $i < $#word + 1; $i++) {
	my @char = split //, $word[$i];
	if(grep {$_ == $i + 1} @num) {
		$hash{$char[0]} = $i + 1;
	} else {
		$hash{$char[0] . $char[1]} = $i + 1;
	}
}

# 元素番号順に出力
foreach my $key (sort {$hash{$a} <=> $hash{$b}} keys %hash) {
	print "$hash{$key} : $key\n";
}