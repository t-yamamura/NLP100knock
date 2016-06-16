# 19. 各行の1コラム目の文字列の出現頻度を求め，出現頻度の高い順に並べる
# 各行の1列目の文字列の出現頻度を求め，その高い順に並べて表示せよ．確認にはcut, uniq, sortコマンドを用いよ．


use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

my @text = split/\n/, &LIB::fopen("../../data/hightemp.txt");

my %cnt = ();
foreach my $line (@text) {
	my @col = split/\t/, $line;
	$cnt{$col[0]} = exists $cnt{$col[0]} ? ++$cnt{$col[0]} : 1;
}

foreach my $key (sort {$cnt{$b} <=> $cnt{$a}} keys %cnt) {
	print $cnt{$key} . "\t" . $key . "\n";
}


# **************
#    実行結果
# **************
# 3	埼玉県
# 3	山形県
# 3	群馬県
# 3	山梨県
# 2	千葉県
# 2	岐阜県
# 2	愛知県
# 2	静岡県
# 1	大阪府
# 1	愛媛県
# 1	高知県
# 1	和歌山県
# [Finished in 0.1s]