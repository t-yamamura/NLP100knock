# 01. 「パタトクカシーー」
# 「パタトクカシーー」という文字列の1,3,5,7文字目を取り出して連結した文字列を得よ．

use strict;
use warnings;
use utf8;
binmode STDOUT, ':encoding(Shift_JIS)';

my $str = "パタトクカシーー";
my @str = split('', $str);
my @odd = grep {$_ = $str[$_] if $_ % 2 == 1} (0..$#str);
print join("", @odd)."\n";

# **************
#    実行結果
# **************
# タクシー
# [Finished in 0.2s]