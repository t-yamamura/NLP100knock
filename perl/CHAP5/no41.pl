# 41. 係り受け解析結果の読み込み（文節・係り受け）
# 40に加えて，文節を表すクラスChunkを実装せよ．このクラスは形態素（Morphオブジェクト）のリスト（morphs），
# 係り先文節インデックス番号（dst），係り元文節インデックス番号のリスト（srcs）をメンバ変数に持つこととする．
# さらに，入力テキストのCaboChaの解析結果を読み込み，１文をChunkオブジェクトのリストとして表現し，8文目の文節の文字列と係り先を表示せよ．
# 第5章の残りの問題では，ここで作ったプログラムを活用せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力
my @each_sentence = split /EOS\n/, &LIB::fopen("../../data/neko.txt.cabocha");

# 1文毎に係り受け解析結果(形態素)の読み込み
my @all_nodes = &LIB::makeChunkResultNodes(\@each_sentence);

# 出力(8文目の文節の文字列と係り先を表示)
my @chunks = @{$all_nodes[5]};
for(my $i = 0; $i < $#chunks + 1; $i++) {
	# 文節番号:文節の文字列	係り先の文節番号:係り先の文字列
	printf "%s:%s\t%s:%s\n", ($chunks[$i]->{num}, $chunks[$i]->{text}, $chunks[$i]->{dst}, $chunks[$chunks[$i]->{dst}]->{text});
}

# **************
#    実行結果
# **************
# 0:吾輩は	5:見た
# 1:ここで	2:始めて
# 2:始めて	3:人間という
# 3:人間という	4:ものを
# 4:ものを	5:見た
# 5:見た	-1:見た
# [Finished in 5.7s]