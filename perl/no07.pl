# 07. テンプレートによる文生成
# 引数x, y, zを受け取り「x時のyはz」という文字列を返す関数を実装せよ．
# さらに，x=12, y="気温", z=22.4として，実行結果を確認せよ．

use strict;
use warnings;
use utf8;
binmode STDOUT, ':encoding(Shift_JIS)';

my ($x, $y, $z) = qw/12 気温 22.4/;
print &connectXYZ($x, $y, $z);

sub connectXYZ {
	my ($x, $y, $z) = @_;
	return $x . "時の" . $y . "は" . $z;
}