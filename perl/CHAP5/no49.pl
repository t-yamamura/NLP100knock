# 49. 名詞間の係り受けパスの抽出
# 文中のすべての名詞句のペアを結ぶ最短係り受けパスを抽出せよ．
# ただし，名詞句ペアの文節番号がiとj（i<j）のとき，係り受けパスは以下の仕様を満たすものとする．
#   ・問題48と同様に，パスは開始文節から終了文節に至るまでの各文節の表現（表層形の形態素列）を"->"で連結して表現する
#   ・文節iとjに含まれる名詞句はそれぞれ，XとYに置換する
#
# また，係り受けパスの形状は，以下の2通りが考えられる．
#   ・文節iから構文木の根に至る経路上に文節jが存在する場合: 文節iから文節jのパスを表示
#   ・上記以外で，文節iと文節jから構文木の根に至る経路上で共通の文節kで交わる場合:
#     文節iから文節kに至る直前のパスと文節jから文節kに至る直前までのパス，文節kの内容を"|"で連結して表示
#
# 例えば，「吾輩はここで始めて人間というものを見た。」という文（neko.txt.cabochaの8文目）から，次のような出力が得られるはずである．
# Xは | Yで -> 始めて -> 人間という -> ものを | 見た
# Xは | Yという -> ものを | 見た
# Xは | Yを | 見た
# Xで -> 始めて -> Y
# Xで -> 始めて -> 人間という -> Y
# Xという -> Y


use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
use Tie::IxHash;
binmode STDOUT, ':encoding(utf-8)';

# 入力
my @each_sentence = split /EOS\n/, &LIB::fopen("../../data/neko.txt.cabocha");

# 1文毎に係り受け解析結果(形態素)の読み込み
my @all_nodes = &LIB::makeChunkResultNodes(\@each_sentence);

my @all_path = ();
foreach my $chunks (@all_nodes) {
	# my $chunks = $all_nodes[1];
	for(my $i = 0; $i < $#{$chunks}; $i++) {
		for(my $j = $i + 1; $j < $#{$chunks} + 1; $j++) {
			my @path = ();
			# i < j を満たす名詞句ペア
			if($chunks->[$i]->existsMorph('pos', '名詞') && $chunks->[$j]->existsMorph('pos', '名詞')) {
				my $replaced_x = $chunks->[$i]->replaceNounToSymbol('X');
				my $replaced_y = $chunks->[$j]->replaceNounToSymbol('Y');
				my @route_x = &getRouteListToRoot($chunks, $i);
				my @route_y = &getRouteListToRoot($chunks, $j);

				# 文節iから構文木の根に至る経路上に文節jが存在する場合
				if(grep {$_ == $j} @route_x) {
					for(my $k = 0; $k < $#route_x + 1 && $route_x[$k] <= $j; $k++) {
						my $text = $chunks->[$route_x[$k]]->{text};
						$text = $replaced_x if $route_x[$k] == $i;
						$text = $replaced_y if $route_x[$k] == $j;
						push(@path, $text);
					}
					#
					push(@all_path, join(" -> ", @path));
				}
				# 文節iと文節jから構文木の根に至る経路上で共通の文節kで交わる場合
				else {
					my @uniq_x = &LIB::getDifferenceSet(\@route_x, \@route_y);
					my @uniq_y = &LIB::getDifferenceSet(\@route_y, \@route_x);
					my @common = &LIB::getProductSet(\@route_x, \@route_y);
					my $k = shift @common;
					my %text = ();
					$_ == $i ? push(@{$text{x}}, $replaced_x) : push(@{$text{x}}, $chunks->[$_]->{text}) foreach @uniq_x;
					$_ == $j ? push(@{$text{y}}, $replaced_y) : push(@{$text{y}}, $chunks->[$_]->{text}) foreach @uniq_y;

					#
					push(@all_path, join(" -> ", @{$text{x}}) . " | " . join(" -> ", @{$text{y}}) . " | " . $chunks->[$k]->{text});
				}

			}
		}
	}
}

my $OUT = join("\n", @all_path);
# print $OUT;
&LIB::fwrite("out49.txt", $OUT);



#---------------------------------------------------#
#        根へのパス(文節番号のリスト)を返す         #
#---------------------------------------------------#
sub getRouteListToRoot {
	my ($chunks, $i) = @_;

	my @path = ();
	my $position = $i;
	while($position != $chunks->[$position]->{dst}) {
		push(@path, $position);
		$position = $chunks->[$position]->{dst};
	}
	return @path;
}


# **************
#    実行結果
# **************
# 実行結果はout49.txtを参照
# [Finished in 30.8s]