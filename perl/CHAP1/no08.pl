# 08. 暗号文
# 与えられた文字列の各文字を，以下の仕様で変換する関数cipherを実装せよ．
#
# 英小文字ならば(219 - 文字コード)の文字に置換
# その他の文字はそのまま出力
# この関数を用い，英語のメッセージを暗号化・復号化せよ．

use strict;
use warnings;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

my $str = "Hello, world!";
print "暗号化 : " . &cipher($str) . "\n";
print "復号化 : " . &cipher(&cipher($str)) . "\n";

sub cipher {
	my @str = split //, shift;

	my $cipher = '';
	foreach my $char (@str) {
		$cipher .= $char =~ /[a-z]/ ? chr(219 - ord($char)) : $char;
	}
	return $cipher;
}

# **************
#    実行結果
# **************
# 暗号化 : Hvool, dliow!
# 復号化 : Hello, world!
# [Finished in 0.1s]