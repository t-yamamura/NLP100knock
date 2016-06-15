# 02. 「パトカー」＋「タクシー」＝「パタトクカシーー」
# 「パトカー」＋「タクシー」の文字を先頭から交互に連結して文字列「パタトクカシーー」を得よ．

use strict;
use warnings;
use Encode;

my $str1 = decode('UTF-8', "パトカー");
my $str2 = decode('UTF-8', "タクシー");
my @str1 = split //, $str1;
my @str2 = split //, $str2;
my $join = '';
$join .= $str1[$_] . $str2[$_] for (0..$#str1);
print encode('Shift_JIS', $join) . "\n";