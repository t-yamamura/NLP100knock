# 39. Zipfの法則
# 単語の出現頻度順位を横軸，その出現頻度を縦軸として，両対数グラフをプロットせよ．

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

# gnuplot用データの作成(出現頻度順にソート)
my $DATA = '';
my $rank = 1;
foreach my $key (sort {$cnt{$b} <=> $cnt{$a}} keys %cnt) {
	$DATA .= $rank . "\t" . $cnt{$key} . "\n";
	$rank++;
}
&LIB::fwrite("xydata39.dat", $DATA);

# gnuplotのコマンド
my $command = "set title \'Zipfの法則(吾輩は猫である)\' font \'Ricty, 20\'\n" # タイトル フォント(指定, サイズ)
			. "set boxwidth 0.5 relative\n" # 棒グラフ(横幅1/2)
			. "set xlabel \'出現頻度順位\' font \'Ricty, 16\'\n"     # x軸のラベル表記
			. "set ylabel \'出現頻度\' font \'Ricty, 16\'\n" # y軸のラベル表記
			. "set logscale xy\n"    # x軸y軸を対数目盛り
			. "set xtics autofreq\n" # x軸目盛りの表示値
			. "set ytics autofreq\n" # y軸目盛りの表示値
			. "set xtics rotate\n"   # x軸の目盛りを縦
			. "set style fill solid border lc rgb \"black\"\n" # ボーダー(縁取り)の設定
			. "plot \"xydata39.dat\" with lines lw 2 lc rgb \"#33CC66\" notitle\n"; # xydata39.datをプロット

# gnuplotへデータ渡し
open (GP, "| gnuplot -persist") or die "no gnuplot";
print GP $command;
close GP;

# **************
#    実行結果
# **************
# 実行結果はout39.pngを参照