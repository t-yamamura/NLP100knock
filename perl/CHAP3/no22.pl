# 22. カテゴリ名の抽出
# 記事のカテゴリ名を（行単位ではなく名前で）抽出せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力 (titleがイギリスの記事を1行毎にリスト化)
my @text = split /\n/, &LIB::getTextFromWiki("../../data/jawiki-country.json", "イギリス");

# 正規表現にマッチする行のカテゴリ名を出力
# $_ => 正規表現にマッチする行
# $1 => 正規表現にマッチする行のカテゴリ名 (.+?)に該当
# $2 => 正規表現にマッチする行の読み       (\|.*)に該当
$_ =~ /\[\[Category:(.+?)(\|.*)*\]\]/ ? print $1 . "\n" : next foreach @text;

# **************
#    実行結果
# **************
# イギリス
# 英連邦王国
# G8加盟国
# 欧州連合加盟国
# 海洋国家
# 君主国
# 島国
# 1801年に設立された州・地域
# [Finished in 19.1s]