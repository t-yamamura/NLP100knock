# 42. 係り元と係り先の文節の表示
# 係り元の文節と係り先の文節のテキストをタブ区切り形式ですべて抽出せよ．ただし，句読点などの記号は出力しないようにせよ．

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
		$OUT .= $chunks->[$i]->{num} . ":" . $chunks->[$i]->{text} . "\t";
		$OUT .= $chunks->[$_]->{num} . ":" . $chunks->[$_]->{text} . "\t" for @{$chunks->[$i]->{srcs}};
		$OUT =~ s/\t$/\n/g;
	}
	$OUT .= "\n";
}
&LIB::fwrite("out42.txt", $OUT);
# print $OUT;


# **************
#    実行結果
# **************
