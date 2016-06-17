# 21. カテゴリ名を含む行を抽出
# 記事中でカテゴリ名を宣言している行を抽出せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力 (titleがイギリスの記事を1行毎にリスト化)
my @text = split /\n/, &LIB::getTextFromWiki("../../data/jawiki-country.json", "イギリス");

# 正規表現にマッチする行を出力
$_ =~ /\[\[Category:(.+?)(\|.*)*\]\]/ ? print $_ . "\n" : next foreach @text;

# **************
#    実行結果
# **************
# [[Category:イギリス|*]]
# [[Category:英連邦王国|*]]
# [[Category:G8加盟国]]
# [[Category:欧州連合加盟国]]
# [[Category:海洋国家]]
# [[Category:君主国]]
# [[Category:島国|くれいとふりてん]]
# [[Category:1801年に設立された州・地域]]
# [Finished in 15.8s]