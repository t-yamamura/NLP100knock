# 28. MediaWikiマークアップの除去
# 27の処理に加えて，テンプレートの値からMediaWikiマークアップを可能な限り除去し，国の基本情報を整形せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力 (titleがイギリスの記事)
my $text = &LIB::getTextFromWiki("../../data/jawiki-country.json", "イギリス");

# 基礎情報テンプレートの取得
my %hash = ();
my $stdinfo = $1 if $text =~ /\{\{基礎情報\s国([\s\S]*)\n\}\}/;

# "フィールド名 = 値"の正規表現を抽出
foreach my $item (split /\n\|/, $stdinfo) {
	next if $item eq '';
	if($item =~ /(.+?)\s\=\s([\s\S]*)/) {
		my $field = $1; # フィールド名
		my $val = $2;   # 値

		#---------------------------------------------------#
		#             メディアファイルの処理                #
		#---------------------------------------------------#
		# [[File:filename|○○|title]] => title
		$val =~ s/\[\[(File|ファイル)\:(.+?)\|(.+?)\|(.+?)\]\]/$4/g;

		#---------------------------------------------------#
		#         弱い強調・強調・強い強調を除去            #
		#---------------------------------------------------#
		# 弱い強調 => ''hoge''
		# 強調     => '''hoge'''
		# 強い強調 => '''''hoge'''''
		$val =~ s/('+)(.+?)('+)/$2/g; # 強調('')を除去

		#---------------------------------------------------#
		#         内部リンクマークアップを除去              #
		#---------------------------------------------------#
		# [[記事名]] => $1:記事名
		$val =~ s/\[\[(((?![\||\]|\#]).)*)\]\]/$1/g;
		# [[記事名|表示文字]] => $3:表示文字($1:記事名)
		$val =~ s/\[\[(((?![\||\]|\#]).)*)\|(((?!\]).)*)\]\]/$3/g;
		# [[記事名#節名|表示文字]] => $5:表示文字($1:記事名, $3:節名)
		$val =~ s/\[\[(((?![\||\]|\#]).)*)\#(((?![\||\]|\#]).)*)\|(((?!\]).)*)\]\]/$5/g;

		#---------------------------------------------------#
		#                  外部リンク                       #
		#---------------------------------------------------#
		# [http://www.example.org 表示文字] => 表示文字
		$val =~ s/\[(.+?) (.+)\]/$2/g;

		#---------------------------------------------------#
		#                  リダイレクト                     #
		#---------------------------------------------------#
		# #REDIRECT [[記事名]] => ↳記事名
		# #REDIRECT [[記事名#節名]] => ↳記事名#節名
		$val =~ s/\#REDIRECT \[\[(.+?)\]\]/↳/g;


		# $hash{フィールド} = 値
		$hash{$field} = $val;
	}

}

# 出力
foreach my $key (sort keys %hash) {
	print $key . "\t" . $hash{$key} . "\n";
}


# **************
#    実行結果
# **************
# GDP/人	36,727<ref name="imf-statistics-gdp" />
# GDP値	2兆3162億<ref name="imf-statistics-gdp" />
# GDP値MER	2兆4337億<ref name="imf-statistics-gdp" />
# GDP値元	1兆5478億<ref name="imf-statistics-gdp">IMF>Data and Statistics>World Economic Outlook Databases>By Countrise>United Kingdom</ref>
# GDP統計年	2012
# GDP統計年MER	2012
# GDP統計年元	2012
# GDP順位	6
# GDP順位MER	5
# ISO 3166-1	GB / GBR
# ccTLD	.uk / .gb<ref>使用は.ukに比べ圧倒的少数。</ref>
# 人口値	63,181,775<ref>United Nations Department of Economic and Social Affairs>Population Division>Data>Population>Total Population</ref>
# 人口大きさ	1 E7
# 人口密度値	246
# 人口統計年	2011
# 人口順位	22
# 位置画像	Location_UK_EU_Europe_001.svg
# 元首等氏名	エリザベス2世
# 元首等肩書	女王
# 公式国名	{{lang|en|United Kingdom of Great Britain and Northern Ireland}}<ref>英語以外での正式国名:<br/>
# *{{lang|gd|An Rìoghachd Aonaichte na Breatainn Mhòr agus Eirinn mu Thuath}}（スコットランド・ゲール語）<br/>
# *{{lang|cy|Teyrnas Gyfunol Prydain Fawr a Gogledd Iwerddon}}（ウェールズ語）<br/>
# *{{lang|ga|Ríocht Aontaithe na Breataine Móire agus Tuaisceart na hÉireann}}（アイルランド語）<br/>
# *{{lang|kw|An Rywvaneth Unys a Vreten Veur hag Iwerdhon Glédh}}（コーンウォール語）<br/>
# *{{lang|sco|Unitit Kinrick o Great Breetain an Northren Ireland}}（スコットランド語）<br/>
# **{{lang|sco|Claught Kängrick o Docht Brätain an Norlin Airlann}}、{{lang|sco|Unitet Kängdom o Great Brittain an Norlin Airlann}}（アルスター・スコットランド語）</ref>
# 公用語	英語（事実上）
# 国旗画像	Flag of the United Kingdom.svg
# 国歌	神よ女王陛下を守り給え
# 国章リンク	（国章）
# 国章画像	イギリスの国章
# 国際電話番号	44
# 夏時間	+1
# 建国形態	建国
# 日本語国名	グレートブリテン及び北アイルランド連合王国
# 時間帯	±0
# 最大都市	ロンドン
# 標語	{{lang|fr|Dieu et mon droit}}<br/>（フランス語:神と私の権利）
# 水面積率	1.3%
# 注記	<references />
# 略名	イギリス
# 確立年月日1	927年／843年
# 確立年月日2	1707年
# 確立年月日3	1801年
# 確立年月日4	1927年
# 確立形態1	イングランド王国／スコットランド王国<br />（両国とも1707年連合法まで）
# 確立形態2	グレートブリテン王国建国<br />（1707年連合法）
# 確立形態3	グレートブリテン及びアイルランド連合王国建国<br />（1800年連合法）
# 確立形態4	現在の国号「グレートブリテン及び北アイルランド連合王国」に変更
# 通貨	UKポンド (&pound;)
# 通貨コード	GBP
# 面積値	244,820
# 面積大きさ	1 E11
# 面積順位	76
# 首相等氏名	デーヴィッド・キャメロン
# 首相等肩書	首相
# 首都	ロンドン
# [Finished in 16.0s]