# 37. 頻度上位10語
# 出現頻度が高い10語とその出現頻度をグラフ（例えば棒グラフなど）で表示せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力
my @each_sentence = split /EOS\n/, &LIB::fopen("../../data/neko.txt.mecab");

# 1文毎に形態素解析結果の読み込み
my @all_nodes = &LIB::makeMecabResultNodes(\@each_sentence);

# 単語の出現頻度をカウント
my %cnt = ();
foreach my $nodes (@all_nodes) {
	foreach my $node (@{$nodes}) {
		# キーが既に存在すればインクリメント, なければ1で初期化
		$cnt{$node->{surface}} = exists $cnt{$node->{surface}} ? ++$cnt{$node->{surface}} : 1;
	}
}

# 出現頻度上位10単語と出現頻度を抽出
my @x = (); # 単語
my @y = (); # 出現頻度
my $rank = 0;
foreach my $key (sort {$cnt{$b} <=> $cnt{$a}} keys %cnt) {
	if($rank < 10) {
		push(@x, $key);
		push(@y, $cnt{$key});
	}
	$rank++;
}

# ファイル出力(gnuplotで読み込む)
my $DATA = '';
$DATA .= $x[$_] . " " . $y[$_] . "\n" for (0..$#x);
&LIB::fwrite("xydata37.dat", $DATA);

# gnuplotのコマンド
my $command = "set title \'出現頻度上位10語(吾輩は猫である)\' font \'Ricty, 20\'\n" # タイトル フォント(指定, サイズ)
			. "set boxwidth 0.5 relative\n" # 棒グラフ(横幅1/2)
			. "set xlabel \'上位10語\' font \'Ricty, 16\'\n" # x軸のラベル表記
			. "set ylabel \'出現頻度\' font \'Ricty, 16\'\n" # y軸のラベル表記
			. "set style fill solid border lc rgb \"black\"\n" # ボーダー(縁取り)の設定
			. "plot \"xydata37.dat\" using 0:2:xtic(1) with boxes lw 2 lc rgb \"#33CC66\" notitle\n"; # xydata37.datをプロット

# gnuplotへデータ渡し
open (GP, "| gnuplot -persist") or die "no gnuplot";
print GP $command;
close GP;

# **************
#    実行結果
# **************
# 実行結果はout37.pngを参照