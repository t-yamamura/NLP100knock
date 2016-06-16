# 01. 「パタトクカシーー」
# 「パタトクカシーー」という文字列の1,3,5,7文字目を取り出して連結した文字列を得よ．

use strict;
use warnings;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

# 奇数文字目(配列の添え字は0始まりなのでプログラム的には偶数文字目)だけの配列を作る
my $str = "パタトクカシーー";
my @str = split('', $str);
my @odd = grep {$_ = $str[$_] if $_ % 2 == 0} (0..$#str);
print join("", @odd)."\n";

# **************
#    実行結果
# **************
# タクシー
# [Finished in 0.2s]