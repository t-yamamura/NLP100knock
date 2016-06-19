# 38. ヒストグラム
# 単語の出現頻度のヒストグラム（横軸に出現頻度，縦軸に出現頻度をとる単語の種類数を棒グラフで表したもの）を描け．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
use Math::Round;
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

# ヒストグラムデータの作成
# 出現頻度を100毎に分布を作成
my %histogram = ();
my $max = -1;
foreach my $key (keys %cnt) {
	my $class = $cnt{$key} =~ /([0-9]+)([0-9])([0-9])/ ? $1 * 100 : 0;
	$histogram{$class} = exists $histogram{$class} ? ++$histogram{$class} : 1;
	$max = $class if $max < $class;
}

# 出現していない分布の補完
for(my $i = 0; $i < $max; $i += 100) {
	$histogram{$i} = !exists $histogram{$i} ? 0 : next;
}

# gnuplot用データの作成
my $DATA = '';
foreach my $key (sort {$a <=> $b} keys %histogram) {
	$DATA .= $key . "\t" . $histogram{$key} . "\n" if $key % 1000 == 0;
}
&LIB::fwrite("xydata38.dat", $DATA);

# gnuplotのコマンド
my $command = "set title \'ヒストグラム(吾輩は猫である)\' font \'Ricty, 20\'\n" # タイトル フォント(指定, サイズ)
			. "set boxwidth 0.5 relative\n" # 棒グラフ(横幅1/2)
			. "set xlabel \'出現頻度分布\' font \'Ricty, 16\'\n"     # x軸のラベル表記
			. "set ylabel \'単語の種類数\' font \'Ricty, 16\'\n" # y軸のラベル表記
			. "set xtics rotate\n" # x軸の目盛りを縦
			. "set style fill solid border lc rgb \"black\"\n" # ボーダー(縁取り)の設定
			. "plot \"xydata38.dat\" using 0:2:xtic(1) with boxes lw 2 lc rgb \"#33CC66\" notitle\n"; # xydata38.datをプロット

# gnuplotへデータ渡し
open (GP, "| gnuplot -persist") or die "no gnuplot";
print GP $command;
close GP;

# **************
#    実行結果
# **************
# 実行結果はout37.pngを参照