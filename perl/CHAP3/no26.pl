# 26. 強調マークアップの除去
# 25の処理時に，テンプレートの値からMediaWikiの強調マークアップ（弱い強調，強調，強い強調のすべて）を除去してテキストに変換せよ
# （参考: マークアップ早見表https://ja.wikipedia.org/wiki/Help:%E6%97%A9%E8%A6%8B%E8%A1%A8）．

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
		#         弱い強調・強調・強い強調を除去            #
		#---------------------------------------------------#
		# 弱い強調 => ''hoge''
		# 強調     => '''hoge'''
		# 強い強調 => '''''hoge'''''
		$val =~ s/('+)(.+?)('+)/$2/g; # 強調('')を除去

		# $hash{フィールド} = 値
		$hash{$field} = $val;
	}

}

# 出力
foreach my $key (keys %hash) {
	print $key . "\t" . $hash{$key} . "\n";
}


# **************
#    実行結果
# **************
# ISO 3166-1	GB / GBR
# 首相等氏名	[[デーヴィッド・キャメロン]]
# 通貨コード	GBP
# GDP値	2兆3162億<ref name="imf-statistics-gdp" />
# 確立形態2	[[グレートブリテン王国]]建国<br />（[[連合法 (1707年)|1707年連合法]]）
# 確立年月日4	[[1927年]]
# 国章リンク	（[[イギリスの国章|国章]]）
# 通貨	[[スターリング・ポンド|UKポンド]] (&pound;)
# 人口順位	22
# 面積大きさ	1 E11
# 国際電話番号	44
# GDP値MER	2兆4337億<ref name="imf-statistics-gdp" />
# 夏時間	+1
# 確立年月日3	[[1801年]]
# 首都	[[ロンドン]]
# 位置画像	Location_UK_EU_Europe_001.svg
# 首相等肩書	[[イギリスの首相|首相]]
# 時間帯	±0
# 人口統計年	2011
# GDP順位	6
# GDP値元	1兆5478億<ref name="imf-statistics-gdp">[http://www.imf.org/external/pubs/ft/weo/2012/02/weodata/weorept.aspx?pr.x=70&pr.y=13&sy=2010&ey=2012&scsm=1&ssd=1&sort=country&ds=.&br=1&c=112&s=NGDP%2CNGDPD%2CPPPGDP%2CPPPPC&grp=0&a= IMF>Data and Statistics>World Economic Outlook Databases>By Countrise>United Kingdom]</ref>
# 最大都市	ロンドン
# ccTLD	[[.uk]] / [[.gb]]<ref>使用は.ukに比べ圧倒的少数。</ref>
# 確立形態1	[[イングランド王国]]／[[スコットランド王国]]<br />（両国とも[[連合法 (1707年)|1707年連合法]]まで）
# 水面積率	1.3%
# 日本語国名	グレートブリテン及び北アイルランド連合王国
# 標語	{{lang|fr|Dieu et mon droit}}<br/>（[[フランス語]]:神と私の権利）
# GDP順位MER	5
# 人口値	63,181,775<ref>[http://esa.un.org/unpd/wpp/Excel-Data/population.htm United Nations Department of Economic and Social Affairs>Population Division>Data>Population>Total Population]</ref>
# 注記	<references />
# 建国形態	建国
# 国旗画像	Flag of the United Kingdom.svg
# 元首等肩書	[[イギリスの君主|女王]]
# 国章画像	[[ファイル:Royal Coat of Arms of the United Kingdom.svg|85px|イギリスの国章]]
# 面積順位	76
# 確立年月日2	[[1707年]]
# 確立年月日1	[[927年]]／[[843年]]
# GDP統計年MER	2012
# 国歌	[[女王陛下万歳|神よ女王陛下を守り給え]]
# GDP/人	36,727<ref name="imf-statistics-gdp" />
# GDP統計年	2012
# 人口大きさ	1 E7
# 人口密度値	246
# 公式国名	{{lang|en|United Kingdom of Great Britain and Northern Ireland}}<ref>英語以外での正式国名:<br/>
# *{{lang|gd|An Rìoghachd Aonaichte na Breatainn Mhòr agus Eirinn mu Thuath}}（[[スコットランド・ゲール語]]）<br/>
# *{{lang|cy|Teyrnas Gyfunol Prydain Fawr a Gogledd Iwerddon}}（[[ウェールズ語]]）<br/>
# *{{lang|ga|Ríocht Aontaithe na Breataine Móire agus Tuaisceart na hÉireann}}（[[アイルランド語]]）<br/>
# *{{lang|kw|An Rywvaneth Unys a Vreten Veur hag Iwerdhon Glédh}}（[[コーンウォール語]]）<br/>
# *{{lang|sco|Unitit Kinrick o Great Breetain an Northren Ireland}}（[[スコットランド語]]）<br/>
# **{{lang|sco|Claught Kängrick o Docht Brätain an Norlin Airlann}}、{{lang|sco|Unitet Kängdom o Great Brittain an Norlin Airlann}}（アルスター・スコットランド語）</ref>
# 確立形態4	現在の国号「グレートブリテン及び北アイルランド連合王国」に変更
# 面積値	244,820
# 確立形態3	[[グレートブリテン及びアイルランド連合王国]]建国<br />（[[連合法 (1800年)|1800年連合法]]）
# GDP統計年元	2012
# 公用語	[[英語]]（事実上）
# 元首等氏名	[[エリザベス2世]]
# 略名	イギリス
# [Finished in 15.9s]