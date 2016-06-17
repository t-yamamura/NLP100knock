# 25. テンプレートの抽出
# 記事中に含まれる「基礎情報」テンプレートのフィールド名と値を抽出し，辞書オブジェクトとして格納せよ．

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
# 但し，値には改行を含む場合があるので注意
foreach my $item (split /\n\|/, $stdinfo) {
	next if $item eq '';
	$hash{$1} = $2 if $item =~ /(.+?)\s\=\s([\s\S]*)/;
}

# 出力
# foreach my $key (keys %hash) {
# 	print $key . "\t" . $hash{$key} . "\n";
# }


# **************
#    実行結果
# **************
# 時間帯	±0
# GDP値元	1兆5478億<ref name="imf-statistics-gdp">[http://www.imf.org/external/pubs/ft/weo/2012/02/weodata/weorept.aspx?pr.x=70&pr.y=13&sy=2010&ey=2012&scsm=1&ssd=1&sort=country&ds=.&br=1&c=112&s=NGDP%2CNGDPD%2CPPPGDP%2CPPPPC&grp=0&a= IMF>Data and Statistics>World Economic Outlook Databases>By Countrise>United Kingdom]</ref>
# 人口大きさ	1 E7
# 確立形態4	現在の国号「'''グレートブリテン及び北アイルランド連合王国'''」に変更
# 国歌	[[女王陛下万歳|神よ女王陛下を守り給え]]
# 元首等肩書	[[イギリスの君主|女王]]
# 人口値	63,181,775<ref>[http://esa.un.org/unpd/wpp/Excel-Data/population.htm United Nations Department of Economic and Social Affairs>Population Division>Data>Population>Total Population]</ref>
# 人口統計年	2011
# 面積大きさ	1 E11
# 公用語	[[英語]]（事実上）
# GDP値	2兆3162億<ref name="imf-statistics-gdp" />
# GDP順位MER	5
# 水面積率	1.3%
# 国際電話番号	44
# GDP統計年MER	2012
# 確立形態2	[[グレートブリテン王国]]建国<br />（[[連合法 (1707年)|1707年連合法]]）
# 標語	{{lang|fr|Dieu et mon droit}}<br/>（[[フランス語]]:神と私の権利）
# 元首等氏名	[[エリザベス2世]]
# 確立年月日3	[[1801年]]
# 国章画像	[[ファイル:Royal Coat of Arms of the United Kingdom.svg|85px|イギリスの国章]]
# GDP統計年元	2012
# ccTLD	[[.uk]] / [[.gb]]<ref>使用は.ukに比べ圧倒的少数。</ref>
# 確立年月日4	[[1927年]]
# 確立年月日2	[[1707年]]
# 公式国名	{{lang|en|United Kingdom of Great Britain and Northern Ireland}}<ref>英語以外での正式国名:<br/>
# *{{lang|gd|An Rìoghachd Aonaichte na Breatainn Mhòr agus Eirinn mu Thuath}}（[[スコットランド・ゲール語]]）<br/>
# *{{lang|cy|Teyrnas Gyfunol Prydain Fawr a Gogledd Iwerddon}}（[[ウェールズ語]]）<br/>
# *{{lang|ga|Ríocht Aontaithe na Breataine Móire agus Tuaisceart na hÉireann}}（[[アイルランド語]]）<br/>
# *{{lang|kw|An Rywvaneth Unys a Vreten Veur hag Iwerdhon Glédh}}（[[コーンウォール語]]）<br/>
# *{{lang|sco|Unitit Kinrick o Great Breetain an Northren Ireland}}（[[スコットランド語]]）<br/>
# **{{lang|sco|Claught Kängrick o Docht Brätain an Norlin Airlann}}、{{lang|sco|Unitet Kängdom o Great Brittain an Norlin Airlann}}（アルスター・スコットランド語）</ref>
# 国章リンク	（[[イギリスの国章|国章]]）
# GDP値MER	2兆4337億<ref name="imf-statistics-gdp" />
# 首都	[[ロンドン]]
# ISO 3166-1	GB / GBR
# 注記	<references />
# 確立形態1	[[イングランド王国]]／[[スコットランド王国]]<br />（両国とも[[連合法 (1707年)|1707年連合法]]まで）
# GDP/人	36,727<ref name="imf-statistics-gdp" />
# GDP順位	6
# 確立形態3	[[グレートブリテン及びアイルランド連合王国]]建国<br />（[[連合法 (1800年)|1800年連合法]]）
# 略名	イギリス
# 建国形態	建国
# 通貨コード	GBP
# GDP統計年	2012
# 通貨	[[スターリング・ポンド|UKポンド]] (&pound;)
# 首相等氏名	[[デーヴィッド・キャメロン]]
# 人口密度値	246
# 面積値	244,820
# 首相等肩書	[[イギリスの首相|首相]]
# 国旗画像	Flag of the United Kingdom.svg
# 日本語国名	グレートブリテン及び北アイルランド連合王国
# 最大都市	ロンドン
# 位置画像	Location_UK_EU_Europe_001.svg
# 面積順位	76
# 人口順位	22
# 夏時間	+1
# 確立年月日1	[[927年]]／[[843年]]
# [Finished in 16.2s]