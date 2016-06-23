# 43. 名詞を含む文節が動詞を含む文節に係るものを抽出
# 名詞を含む文節が，動詞を含む文節に係るとき，これらをタブ区切り形式で抽出せよ．ただし，句読点などの記号は出力しないようにせよ．

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

# 出力(係り元の文節と係り先の文節のテキスト)
my $OUT = '';
foreach my $chunks (@all_nodes) {
	for(my $i = 0; $i < $#{$chunks} + 1; $i++) {
		# 名詞が含む文節(係り元)の判定
		if(grep {$_->{pos} eq '名詞'} @{$chunks->[$i]->{morphs}}) {
			# 動詞を含む文節(係り先)の判定
			foreach my $srcs (@{$chunks->[$i]->{srcs}}) {
				if(grep {$_->{pos} eq '動詞'} @{$chunks->[$srcs]->{morphs}}) {
					# 文節番号:係り元のテキスト(名詞を含む)	文節番号:係り先のテキスト(動詞を含む)
					$OUT .= $chunks->[$i]->{num} . ":" . $chunks->[$i]->{text} . "\t" . $chunks->[$srcs]->{num} . ":" . $chunks->[$srcs]->{text} . "\n";
				}
			}
		}
	}
	$OUT .= "\n";
}
$OUT =~ s/\n{3,}/\n\n/g;
&LIB::fwrite("out43.txt", $OUT);
# print $OUT;


# **************
#    実行結果
# **************
# 実行結果はout43.txtを参照
# [Finished in 13.4s]