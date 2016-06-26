# 46. 動詞の格フレーム情報の抽出
# 45のプログラムを改変し，述語と格パターンに続けて項（述語に係っている文節そのもの）をタブ区切り形式で出力せよ．
# 45の仕様に加えて，以下の仕様を満たすようにせよ．
#   ・項は述語に係っている文節の単語列とする（末尾の助詞を取り除く必要はない）
#   ・述語に係る文節が複数あるときは，助詞と同一の基準・順序でスペース区切りで並べる
#
# 「吾輩はここで始めて人間というものを見た」という例文（neko.txt.cabochaの8文目）を考える．
# この文は「始める」と「見る」の２つの動詞を含み，「始める」に係る文節は「ここで」，
# 「見る」に係る文節は「吾輩は」と「ものを」と解析された場合は，次のような出力になるはずである．

# 始める  で      ここで
# 見る    は を   吾輩は ものを

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

# 格フレームの抽出
tie my %case_frame, 'Tie::IxHash'; # 登録順を記録
foreach my $chunks (@all_nodes) {
	for(my $i = 0; $i < $#{$chunks} + 1; $i++) {
		foreach my $src (@{$chunks->[$i]->{srcs}}) {
			# 係り元の文節に助詞を含み，かつ係り先の文節に動詞を含むパターンを記録
			my $verb = $chunks->[$i]->searchMorph('pos', '動詞');
			my $part = $chunks->[$src]->searchMorphReverse('pos', '助詞');
			# 動詞に係る格パターンと項の抽出
			if($part && $verb) {
				push(@{$case_frame{$verb}{parts}}, $part);
				push(@{$case_frame{$verb}{morphs}}, $chunks->[$src]->{text});
			}
		}
	}
}

# 出力(動詞の格フレームを全て取り出す)
my $OUT = '';
foreach my $verb (keys %case_frame) {
	$OUT .= $verb . "\t" . join("\t", @{$case_frame{$verb}{parts}}) . "\t" . join("\t", @{$case_frame{$verb}{morphs}}) . "\n";
}

&LIB::fwrite("out46.txt", $OUT);
print $OUT;


# **************
#    実行結果
# **************
# 実行結果はout46.txtを参照
# [Finished in 8.5s]