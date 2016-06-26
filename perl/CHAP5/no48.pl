# 48. 名詞から根へのパスの抽出
# 文中のすべての名詞を含む文節に対し，その文節から構文木の根に至るパスを抽出せよ．
# ただし，構文木上のパスは以下の仕様を満たすものとする．
#   ・各文節は（表層形の）形態素列で表現する
#   ・パスの開始文節から終了文節に至るまで，各文節の表現を"->"で連結する
#
# 「吾輩はここで始めて人間というものを見た」という文（neko.txt.cabochaの8文目）から，次のような出力が得られるはずである．
# 吾輩は -> 見た
# ここで -> 始めて -> 人間という -> ものを -> 見た
# 人間という -> ものを -> 見た
# ものを -> 見た


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

# 名詞から根へのパス抽出
my @all_path = ();
foreach my $chunks (@all_nodes) {
	for(my $i = 0; $i < $#{$chunks} + 1; $i++) {
		my @path = ();
		my $position = $i;
		# 名詞を含む文節に対してパスを抽出
		if($chunks->[$position]->existsMorph('pos', '名詞')) {
			# 終了文節までのパスを探索
			while($position != $chunks->[$position]->{dst}) {
				push(@path, $chunks->[$position]->{text});
				$position = $chunks->[$position]->{dst};
			}
			# 探索したパスをリストに追加
			push(@all_path, join(" -> ", @path));
		}

	}
}

# 出力(全ての名詞から根へのパス)
my $OUT = join("\n", @all_path);

&LIB::fwrite("out48.txt", $OUT);
# print $OUT;

# **************
#    実行結果
# **************
# 実行結果はout48.txtを参照
# [Finished in 9.2s]