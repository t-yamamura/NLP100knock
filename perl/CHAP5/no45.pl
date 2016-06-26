# 45. 動詞の格パターンの抽出
# 今回用いている文章をコーパスと見なし，日本語の述語が取りうる格を調査したい．
# 動詞を述語，動詞に係っている文節の助詞を格と考え，述語と格をタブ区切り形式で出力せよ． ただし，出力は以下の仕様を満たすようにせよ．
#   ・動詞を含む文節において，最左の動詞の基本形を述語とする
#   ・述語に係る助詞を格とする
#   ・述語に係る助詞（文節）が複数あるときは，すべての助詞をスペース区切りで辞書順に並べる
#
# 「吾輩はここで始めて人間というものを見た」という例文（neko.txt.cabochaの8文目）を考える．
# この文は「始める」と「見る」の２つの動詞を含み，「始める」に係る文節は「ここで」，
# 「見る」に係る文節は「吾輩は」と「ものを」と解析された場合は，次のような出力になるはずである．
#
# 始める  で
# 見る    は を

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

# 格パターンの抽出
tie my %case_frame, 'Tie::IxHash'; # 登録順を記録
foreach my $chunks (@all_nodes) {
	for(my $i = 0; $i < $#{$chunks} + 1; $i++) {
		foreach my $src (@{$chunks->[$i]->{srcs}}) {
			# 係り元の文節に助詞を含み，かつ係り先の文節に動詞を含むパターンを記録
			my $verb = $chunks->[$i]->searchMorph('pos', '動詞');
			my $part = $chunks->[$src]->searchMorph('pos', '助詞');
			if($part && $verb) {
				$case_frame{$verb}{$part} = exists $case_frame{$verb}{$part} ? ++$case_frame{$verb}{$part} : 1;
			}
		}
	}
}

# 出力(動詞の格パターンを全て取り出す)
my $OUT = '';
foreach my $verb (keys %case_frame) {
	$OUT .= $verb;
	foreach my $part (keys %{$case_frame{$verb}}) {
		$OUT .= "\t" . $part;
	}
	$OUT .= "\n";
}

&LIB::fwrite("out45.txt", $OUT);
# print $OUT;


# **************
#    実行結果
# **************
# 実行結果はout45.txtを参照
# [Finished in 7.9s]