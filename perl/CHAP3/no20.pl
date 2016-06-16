# 21. カテゴリ名を含む行を抽出
# 記事中でカテゴリ名を宣言している行を抽出せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

my @text = split /\n/, &LIB::getTextFromWiki("../../data/jawiki-country.json", "イギリス");

$_ =~ /\[\[Category:(.+)\]\]/ ? print $_ . "\n" : next foreach @text;

