# 00. 文字列の逆順
# 文字列"stressed"の文字を逆に（末尾から先頭に向かって）並べた文字列を得よ．

use strict;
use warnings;

# reverse関数
my $str = "stressed";
my $reverse1 = reverse $str;
print "reverse1 : $reverse1\n";

# unshift関数
my @str = split('', $str);
my @reverse2 = ();
unshift(@reverse2, $_) foreach @str;
print "reverse2 : " . join("", @reverse2) . "\n";