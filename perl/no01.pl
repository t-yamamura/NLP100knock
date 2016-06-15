# 01. 「パタトクカシーー」
# 「パタトクカシーー」という文字列の1,3,5,7文字目を取り出して連結した文字列を得よ．

use strict;
use warnings;
use Encode;

my $str = decode('UTF-8', "パタトクカシーー");
my @str = split('', $str);
my @odd = grep {$_ = $str[$_] if $_ % 2 == 1} (0..$#str);
print encode('Shift_JIS', join("", @odd)."\n");
