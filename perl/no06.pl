# 06. 集合
# "paraparaparadise"と"paragraph"に含まれる文字bi-gramの集合を，それぞれ, XとYとして求め，XとYの和集合，積集合，差集合を求めよ．
# さらに，'se'というbi-gramがXおよびYに含まれるかどうかを調べよ．

use strict;
use warnings;
use lib ".";
use LIB;
use Encode;

my $N = 2; # bi-gram
my @str1 = split //, "paraparaparadise";
my @str2 = split //, "paragraph";
my @x = &LIB::getCharNgram(2, \@str1);
my @y = &LIB::getCharNgram(2, \@str2);

# 和集合
my %cnt = ();
my @wa_set = grep { ++$cnt{$_} == 1} (@x, @y);

# 積集合
%cnt = ();
my @seki_set = grep { ++$cnt{$_} == 2} (@x, @y);

# 差集合
%cnt = ();
map { $cnt{$_}-- } @y;
my @sa_set = grep { ++$cnt{$_} == 1} @x;

print encode('shift_jis', decode('utf-8', "和集合 : ")) . join(" ", sort @wa_set) . "\n";
print encode('shift_jis', decode('utf-8', "積集合 : ")) . join(" ", sort @seki_set) . "\n";
print encode('shift_jis', decode('utf-8', "差集合 : ")) . join(" ", sort @sa_set) . "\n";
grep {"se" eq $_} @x ? print "\"se\" is in x\n" : print "\"se\" is not in x\n";
grep {"se" eq $_} @y ? print "\"se\" is in y\n" : print "\"se\" is not in y\n";

# **************
#    実行結果
# **************
# 和集合 : ad ag ap ar di gr is pa ph ra se
# 積集合 : ap ar pa ra
# 差集合 : ad ap ar di is pa ra se
# "se" is in x
# "se" is in y
# [Finished in 0.1s]