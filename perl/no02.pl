# 02. 「パトカー」＋「タクシー」＝「パタトクカシーー」
# 「パトカー」＋「タクシー」の文字を先頭から交互に連結して文字列「パタトクカシーー」を得よ．

use strict;
use warnings;
use utf8;
binmode STDOUT, ':encoding(Shift_JIS)';

my $str1 = "パトカー";
my $str2 = "タクシー";
my @str1 = split //, $str1;
my @str2 = split //, $str2;
my $join = '';
$join .= $str1[$_] . $str2[$_] for (0..$#str1);
print $join . "\n";

# **************
#    実行結果
# **************
# パタトクカシーー
# [Finished in 0.2s]