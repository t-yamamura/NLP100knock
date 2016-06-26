# 47. 機能動詞構文のマイニング
# 動詞のヲ格にサ変接続名詞が入っている場合のみに着目したい．46のプログラムを以下の仕様を満たすように改変せよ．
#   ・「サ変接続名詞+を（助詞）」で構成される文節が動詞に係る場合のみを対象とする
#   ・述語は「サ変接続名詞+を+動詞の基本形」とし，文節中に複数の動詞があるときは，最左の動詞を用いる
#   ・述語に係る助詞（文節）が複数あるときは，すべての助詞をスペース区切りで辞書順に並べる
#   ・述語に係る文節が複数ある場合は，すべての項をスペース区切りで並べる（助詞の並び順と揃えよ）
#
# 例えば「別段くるにも及ばんさと、主人は手紙に返事をする。」という文から，以下の出力が得られるはずである．
# 返事をする      と に は        及ばんさと 手紙に 主人は


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

# 格フレームの抽出(サ変接続名詞+を+動詞 のみ)
tie my %case_frame, 'Tie::IxHash'; # 登録順を記録
foreach my $chunks (@all_nodes) {
	for(my $i = 0; $i < $#{$chunks} + 1; $i++) {
		my @parts = ();
		my @morphs = ();
		my $noun_verb = '';
		foreach my $src (@{$chunks->[$i]->{srcs}}) {
			# 係り元の文節に助詞を含み，かつ係り先の文節に動詞を含むパターンを記録
			my $verb = $chunks->[$i]->searchMorph('pos', '動詞');
			my $noun = $chunks->[$src]->searchMorph('pos', '名詞');
			my $pos1 = $chunks->[$src]->existsMorph('pos1', 'サ変接続');
			my $part = $chunks->[$src]->searchMorphReverse('pos', '助詞');
			# 係り先の動詞がサ変接続動詞のとき
			if($verb && $noun && $pos1 && $part eq 'を') {
				$noun_verb = $noun . $part . $verb;
			}
			# 動詞に係る格パターンと項の抽出
			elsif($part && $verb) {
				push(@parts, $part);
				push(@morphs, $chunks->[$src]->{text});
			}
		}
		# サ変接続に係る格パターンと項の抽出
		if($noun_verb && @parts) {
			$case_frame{$noun_verb}{parts} = \@parts;
			$case_frame{$noun_verb}{morphs} = \@morphs;
		}
	}
}

# 出力(動詞の格パターンを全て取り出す)
my $OUT = '';
foreach my $noun_verb (keys %case_frame) {
	$OUT .= $noun_verb . "\t" . join("\t", @{$case_frame{$noun_verb}{parts}}) . "\t" . join("\t", @{$case_frame{$noun_verb}{morphs}}) . "\n";
}

# &LIB::fwrite("out47.txt", $OUT);
print $OUT;


# **************
#    実行結果
# **************
# 実行結果はout47.txtを参照
# [Finished in 8.8s]