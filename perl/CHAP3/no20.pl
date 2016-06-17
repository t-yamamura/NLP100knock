# 20. JSONデータの読み込み
# Wikipedia記事のJSONファイルを読み込み，「イギリス」に関する記事本文を表示せよ．
# 問題21-29では，ここで抽出した記事本文に対して実行せよ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力(Wikipedia記事)からtitleがイギリスの記事を出力
print &LIB::getTextFromWiki("../../data/jawiki-country.json", "イギリス");

# **************
#    実行結果
# **************
# {{redirect|UK}}
# {{基礎情報 国
# |略名 = イギリス
# |日本語国名 = グレートブリテン及び北アイルランド連合王国
# |公式国名 = {{lang|en|United Kingdom of Great Britain and Northern Ireland}}<ref>英語以外での正式国名:<br/>
# *{{lang|gd|An Rìoghachd Aonaichte na Breatainn Mhòr agus Eirinn mu Thuath}}（[[スコットランド・ゲール語]]）<br/>
# *{{lang|cy|Teyrnas Gyfunol Prydain Fawr a Gogledd Iwerddon}}（[[ウェールズ語]]）<br/>
# *{{lang|ga|Ríocht Aontaithe na Breataine Móire agus Tuaisceart na hÉireann}}（[[アイルランド語]]）<br/>
# *{{lang|kw|An Rywvaneth Unys a Vreten Veur hag Iwerdhon Glédh}}（[[コーンウォール語]]）<br/>
# *{{lang|sco|Unitit Kinrick o Great Breetain an Northren Ireland}}（[[スコットランド語]]）<br/>
# **{{lang|sco|Claught Kängrick o Docht Brätain an Norlin Airlann}}、{{lang|sco|Unitet Kängdom o Great Brittain an Norlin Airlann}}（アルスター・スコットランド語）</ref>
# |国旗画像 = Flag of the United Kingdom.svg
# |国章画像 = [[ファイル:Royal Coat of Arms of the United Kingdom.svg|85px|イギリスの国章]]
# |国章リンク = （[[イギリスの国章|国章]]）
# |標語 = {{lang|fr|Dieu et mon droit}}<br/>（[[フランス語]]:神と私の権利）
# |国歌 = [[女王陛下万歳|神よ女王陛下を守り給え]]
# |位置画像 = Location_UK_EU_Europe_001.svg
# |公用語 = [[英語]]（事実上）
# |首都 = [[ロンドン]]
# |最大都市 = ロンドン
# |元首等肩書 = [[イギリスの君主|女王]]
# |元首等氏名 = [[エリザベス2世]]
# |首相等肩書 = [[イギリスの首相|首相]]
# |首相等氏名 = [[デーヴィッド・キャメロン]]
# |面積順位 = 76
# |面積大きさ = 1 E11
# |面積値 = 244,820
# |水面積率 = 1.3%
# |人口統計年 = 2011
# |人口順位 = 22
# |人口大きさ = 1 E7
# |人口値 = 63,181,775<ref>[http://esa.un.org/unpd/wpp/Excel-Data/population.htm United Nations Department of Economic and Social Affairs>Population Division>Data>Population>Total Population]</ref>
# |人口密度値 = 246
# |GDP統計年元 = 2012
# |GDP値元 = 1兆5478億<ref name="imf-statistics-gdp">[http://www.imf.org/external/pubs/ft/weo/2012/02/weodata/weorept.aspx?pr.x=70&pr.y=13&sy=2010&ey=2012&scsm=1&ssd=1&sort=country&ds=.&br=1&c=112&s=NGDP%2CNGDPD%2CPPPGDP%2CPPPPC&grp=0&a= IMF>Data and Statistics>World Economic Outlook Databases>By Countrise>United Kingdom]</ref>
# |GDP統計年MER = 2012
# |GDP順位MER = 5
# |GDP値MER = 2兆4337億<ref name="imf-statistics-gdp" />
# |GDP統計年 = 2012
# |GDP順位 = 6
# |GDP値 = 2兆3162億<ref name="imf-statistics-gdp" />
# |GDP/人 = 36,727<ref name="imf-statistics-gdp" />
# |建国形態 = 建国
# |確立形態1 = [[イングランド王国]]／[[スコットランド王国]]<br />（両国とも[[連合法 (1707年)|1707年連合法]]まで）
# |確立年月日1 = [[927年]]／[[843年]]
# |確立形態2 = [[グレートブリテン王国]]建国<br />（[[連合法 (1707年)|1707年連合法]]）
# |確立年月日2 = [[1707年]]
# |確立形態3 = [[グレートブリテン及びアイルランド連合王国]]建国<br />（[[連合法 (1800年)|1800年連合法]]）
# |確立年月日3 = [[1801年]]
# |確立形態4 = 現在の国号「'''グレートブリテン及び北アイルランド連合王国'''」に変更
# |確立年月日4 = [[1927年]]
# |通貨 = [[スターリング・ポンド|UKポンド]] (&pound;)
# |通貨コード = GBP
# |時間帯 = ±0
# |夏時間 = +1
# |ISO 3166-1 = GB / GBR
# |ccTLD = [[.uk]] / [[.gb]]<ref>使用は.ukに比べ圧倒的少数。</ref>
# |国際電話番号 = 44
# |注記 = <references />
# }}
# '''グレートブリテン及び北アイルランド連合王国'''（グレートブリテンおよびきたアイルランドれんごうおうこく、{{lang-en-short|United Kingdom of Great Britain and Northern Ireland}}）、通称'''イギリス'''/'''英国'''は、[[イングランド]]、[[スコットランド]]、[[ウェールズ]]、[[北アイルランド]]の4つの[[イギリスのカントリー|カントリー]]から構成される[[立憲君主制]][[国家]]であり、[[英連邦王国]]（英連邦）の一国である。また、国際関係について責任を負う地域として[[イギリスの王室属領|王室属領]]及び[[イギリスの海外領土#属領|海外領土]]があるが、これらは厳密には「連合王国」には含まれておらず、これらをも含む正式な名称は存在しない。

# [[ユーラシア大陸]]西部の北西にある[[島国]]であるが、[[アイルランド島]]で[[アイルランド|アイルランド共和国]]と[[国境]]を接している。[[国家体制]]は[[国王]]を[[元首|国家元首]]とし、[[議院内閣制]]に基づく[[立憲君主制]]である。[[国際連合安全保障理事会]]の[[国際連合安全保障理事会#常任理事国|常任理事国]]の一つである。事実上の[[公用語]]である[[英語]]は世界[[共通語]]としての機能を果たしており、広大な[[英語圏]]を形成している。

# [[大航海時代]]を経て、[[世界]]屈指の[[海洋国家]]として成長。[[西ヨーロッパ|西欧]][[列強]]のひとつとして世界中に[[植民地]]を拡大し、[[超大国]]として栄え[[イギリス帝国|大英帝国]]と呼んだ。<!--[[第一次世界大戦]]以降の[[勢力均衡]]中心の時代にあっては'''名誉あるバランサー'''を標榜し、自国と自国の交易上、友好関係にある国々、地域、植民地の経済と安全保障の安定化に向けた世界戦略を展開したことで、-->[[19世紀]]には世界の過半を影響下におき、'''[[パクス・ブリタニカ]]'''（イギリスによる平和）と呼ばれる比較的平和な時代をもたらしたが、19世紀終盤にはアメリカに経済規模で抜かれ、[[第二次世界大戦]]を機に植民地の大部分を失い衰退し、現在に至る。

# ==国名==
# 正式名称は、{{lang|en|the United Kingdom of Great Britain and Northern Ireland}} である。{{lang|en|United Kingdom}}、{{lang|en|UK}} とも略される。

# 日本語では、'''グレートブリテン及び北アイルランド連合王国'''あるいは'''グレートブリテン及び北部アイルランド連合王国'''と表記される<ref>なお、ここでいう「連合王国」とは、英語では単数形であることから分かるように、[[連合]]により形成された1つの[[王国]]という意味であり、「連合した諸王国」という意味ではない（すなわち、連合王国それ自体が1つの王国である）。「連合王国」という名称は、[[イングランド王国]]と[[スコットランド王国]]の合併の際に「[[グレートブリテン王国]]」として、またグレートブリテン王国と[[アイルランド王国]]の合併の際に「グレートブリテン及びアイルランド連合王国」として採用された。なお、合併に関する[[歴史]]については、[[イギリスの歴史]]を参照。</ref>。通称は、'''イギリス'''や'''英国'''（えいこく）が一般的だが、その[[語源]]はいずれもイングランド単体との関係が深い言葉であり、「UK」や「グレートブリテン」を表すには、相応しくないとも考えられる<ref>[[日本]]の[[外務省]]は一時期「連合王国」という名称を使っていた（「明治三十二年発行の英貨公債を償還する等のため発行する外貨公債に関する特別措置法」、「領事官の徴収する手数料の額を定める省令」本文など）が一般には定着せず、代わって「英国」を主に使うようになってきている（「[[在外公館の名称及び位置並びに在外公館に勤務する外務公務員の給与に関する法律|名称位置給与法]]」、「外務省組織令」、「国家公務員等の旅費支給規程」）。また[[駐日英国大使館]]は「英国」を用いているほか、[[ブリティッシュ・カウンシル]]など英国政府関連の団体は主に「英国」を用いる。省庁によっては、現在も連合王国と呼ぶ事もある。例えば、[[自衛隊]]などは「連合王国」と呼んでいる[http://www.mod.go.jp/msdf/formal/info/news/200808/082001.html 2008/08/20 連合王国（イギリス）海軍艦艇の訪日に伴うホストシップの派出等について]{{リンク切れ|date=2010年3月}}</ref>（本節にて詳述）。'''英'''と略されることもある。他に'''連合王国'''や'''ブリテン'''とも呼ばれる。[[漢字]]による当て字は、'''英吉利'''と表記される。

# 「イギリス」の語源については、[[ポルトガル語]]の {{lang|pt|Inglez}} に由来すると言われる<ref>三省堂 『大辞林』 第二版より「イギリス」の項。</ref>。江戸時代には「エゲレス」とも呼ばれていた（前掲ポルトガル語 {{lang|pt|Inglez}}、またはオランダ語 {{lang|nl|Engelsch}} が訛ったもの<ref>小学館 『デジタル大辞泉』より「エゲレス」の項。</ref>）。当て字である「英吉利」という表記は、もともと先行する[[中国語]]に由来する<ref>現代の中国語でも「{{lang|zh-CN|英吉利海峡}}」などと言った語に残っている。</ref>。徳川幕府との開国等に関する交渉の際には、猊利太尼亜（ぶりたにあ）や諳尼利亜（あんぐりあ）と呼称されていた。「グレートブリテン」はイングランドのほかに、スコットランド及びウェールズを含み、「連合王国」はこれにさらに北アイルランドが加わる。しかし、「連合王国」は、少なくとも国内法上は、王室属領（[[マン島]]及び[[チャンネル諸島]]）や海外領土は含まない。そのため、海外領土や王室属領を含む場合や、海外領土等に本国を表記する場合はイギリスと表記することも多い。

# 英語話者が「UK」を指して「{{lang|en|England}}」と称することが（特に[[口語]]で）あるが、「[[ポリティカル・コレクトネス|政治的に正しく]]ない」として公式な場では控えられる傾向にある。連合王国全体を指して「グレートブリテン」と呼ぶことも、その本来の意に含まれない北アイルランドのユニオニストから批判されることがあるが、連合王国政府は連合王国全体を指す語として「グレートブリテン」を使うことがある（例えば、自動車に使われている[[欧州連合のナンバープレート|EUのナンバープレート]]の[[国際識別記号 (自動車)|加盟国略号]]や[[国際標準化機構|ISO]]の[[ISO 3166-1|国コード]]では「GB」が用いられる）。また[[スコットランド人]]や[[ウェールズ人]]には、[[民族]]的[[アイデンティティー]]を無視した単語として「{{lang|en|British}}」と呼ばれることを嫌う人もいる（もちろん彼らを「{{lang|en|English}}」と呼ぶのはタブーである）。国全体、個々の[[地域]]、またそこに暮らす人々をどう呼ぶべきかという問題は、個々人の政治的[[価値観]]や[[歴史観]]を含むため複雑であり、個々人や[[マスコミ]]によって様々な見解がある。[[英国放送協会|BBC]]がスコットランド人やウェールズ人を「{{lang|en|British}}」という単語で表さない原則を表明した直後、「[[タイムズ]]」は社説でBBCの決定を批判し、その後も「{{lang|en|British}}」という単語をスコットランド人やウェールズ人に対して用いている。

# ==歴史==
# [[File:Battle of Waterloo 1815.PNG|thumb|left|[[ワーテルローの戦い]]での勝利により[[ナポレオン戦争]]は終止符が打たれ、[[パクス・ブリタニカ]]の時代が到来した。]]
# [[File:The British Empire.png|thumb|250px|[[イギリス帝国]]統治下の経験を有する国・地域。現在の[[イギリスの海外領土]]は赤い下線が引いてある。]]
# {{main|イギリスの歴史}}
# [[1066年]]に[[ノルマンディー公]]であった[[ウィリアム1世 (イングランド王)|ウィリアム征服王]] (William the Conqueror) が[[ノルマン・コンクエスト|イングランドを征服]]し、大陸の進んだ[[封建制]]を導入して、[[王国]]の体制を整えていった。人口、[[経済力]]に勝るイングランドがウェールズ、スコットランドを圧倒していった。

# [[1282年]]にウェールズ地方にもイングランドの州制度がしかれ、[[1536年]]には正式に併合した（{{仮リンク|ウェールズ法諸法|en|Laws in Wales Acts 1535–1542}}）。[[1603年]]にイングランドとスコットランドが[[同君連合]]を形成、[[1707年]]、スコットランド合併法（[[連合法 (1707年)|1707年連合法]]）により、イングランドとスコットランドは合併し[[グレートブリテン王国]]となった。さらに1801年には、[[連合法 (1800年)|アイルランド合併法]]（1800年連合法）によりグレートブリテン王国は[[アイルランド王国]]と連合し、[[グレートブリテン及びアイルランド連合王国]]となった。[[ウィンザー朝]]の[[ジョージ5世 (イギリス王)|ジョージ5世]]の[[1922年]]に[[英愛条約]]が発効され、北部6州（北アイルランド;アルスター9州の中の6州）を除く26州が[[アイルランド自由国]]（現[[アイルランド|アイルランド共和国]]）として独立した。[[1927年]]に現在の名称へと改名した。スコットランドが独立すべきかどうかを問う住民投票が2014年9月に実施されたが独立は否決された<ref>{{cite web|url=http://www.cnn.co.jp/world/35023094.html|title=スコットランド独立の是非を問う住民投票実施へ　英国|author=<code>CNN.co.jp</code>|accessdate=2012-10-16}}</ref>。

# イギリスは世界に先駆けて[[産業革命]]を達成し、19世紀始めの[[ナポレオン戦争]]後は七つの海の[[覇権]]を握って世界中に進出し、[[カナダ]]から[[オーストラリア]]、[[インド]]や[[香港]]に広がる広大な植民地を経営し、[[奴隷貿易]]が代表するような交易を繰り広げ[[イギリス帝国]]を建設した。[[中国]]国内での[[アヘン]]販売を[[武力]]で認めさせるため、[[清|清朝]]に対して[[阿片戦争]]を仕掛けた。イギリスの世界覇権は[[第一次世界大戦]]までで、[[世界大戦|二度の大戦]]を経てその後は[[アメリカ合衆国|アメリカ]]が強大国として台頭する。

# 戦後、[[労働党 (イギリス)|労働党]]の[[クレメント・アトリー]]政権が'''「[[ゆりかごから墓場まで]]」'''をスローガンにいち早く[[福祉国家]]を作り上げたが、[[社会階級|階級社会]]の[[伝統]]が根強いこともあって経済の停滞を招き、[[1960年代]]以降は「[[英国病]]」とまで呼ばれる[[景気後退|不景気]]に苦しんだ。

# [[1980年代]]に[[マーガレット・サッチャー]]首相が経済再建のために[[ネオリベラリズム]]的な[[サッチャー主義]]に基づき、急進的な[[構造改革]]（[[民営化]]・[[行政改革]]・[[規制緩和]]）を実施し、[[失業]]者が続出、地方経済は不振を極めたが、ロンドンを中心に[[金融]]産業などが成長した。[[1990年代]]、政権は[[保守党 (イギリス)|保守党]]から労働党の[[トニー・ブレア]]に交代し、イギリスは[[市場]]化一辺倒の[[政策]]を修正した[[第三の道]]への路線に進むことになった。このころからイギリスは久しぶりの好況に沸き、「老大国」のイメージを払拭すべく[[クール・ブリタニア]]と言われるイメージ戦略、[[文化政策]]に力が入れられるようになった。

# ==地理==
# [[File:Uk topo en.jpg|thumb|200px|イギリスの地形図]]
# [[File:BenNevis2005.jpg|thumb|right|[[ブリテン諸島]]最高峰の[[ベン・ネビス山]]]]
# イギリスは[[グレートブリテン島]]のイングランド、ウェールズ、スコットランド、およびアイルランド島北東部の北アイルランドで構成されている。この2つの大きな島と、その周囲大小の島々を[[ブリテン諸島]]と呼ぶ。グレートブリテン島は中部から南部を占めるイングランド、北部のスコットランド、西部のウェールズに大別される。アイルランド島から北アイルランドを除いた地域はアイルランド共和国がある。

# イングランドの大部分は<!--rolling lowland terrain-->岩の多い低地からなり、西から東へと順に並べると、北西の山がちな地域（[[湖水地方]]のカンブリア山脈）、北部（ペニンネスの湿地帯、ピーク・ディストリクトの[[石灰岩]]丘陵地帯。[[パーベック島]]、[[リンカンシャー]]の石灰岩質の丘陵地帯）から南イングランドの泥炭質のノース・ダウンズ、サウス・ダウンズ、チルターンにいたる。イングランドを流れる主な河川は、[[テムズ川]]、[[セヴァーン川]]、[[トレント川]]、[[ウーズ川]]である。主な都市はロンドン、バーミンガム、[[ヨーク (イングランド)|ヨーク]]、[[ニューカッスル・アポン・タイン]]など。イングランド南部の[[ドーヴァー]]には、[[英仏海峡トンネル]]があり、対岸の[[フランス]]と連絡する。イングランドには標高 1000m を超える地点はない。

# ウェールズは山がちで、最高峰は標高 1,085m の[[スノードン山]]である。本土の北に[[アングルシー島]]がある。ウェールズの首都また最大の都市はカーディフで、南ウェールズに位置する。

# スコットランドは地理的に多様で、南部および東部は比較的標高が低く、[[ベン・ネビス山|ベン・ネヴィス]]を含む北部および西部は標高が高い。[[ベン・ネヴィス]]はイギリスの最高地点で標高 1343 m である。スコットランドには数多くの半島、湾、ロッホと呼ばれる[[湖]]があり、グレート・ブリテン島最大の淡水湖である[[ネス湖]]もスコットランドに位置する。スコットランドの西部また北部の海域には、[[ヘブリディーズ諸島]]、[[オークニー諸島]]、[[シェトランド諸島|シェットランド諸島]]を含む大小さまざまな島が位置する。スコットランドの主要都市は首都エディンバラ、グラスゴー、[[アバディーン]]である。

# 北アイルランドは、アイルランド島の北東部を占め、ほとんどは丘陵地である。中央部は平野で、ほぼ中央に位置する[[ネイ湖]]はイギリス諸島最大の湖である。主要都市はベルファストと[[ロンドンデリー|デリー]]。

# 現在イギリスは大小あわせて1098ほどの島々からなる。ほとんどは自然の島だが、いくつかは[[クランノグ]]といわれる、過去の時代に石と木を骨組みに作られ、しだいに廃棄物で大きくなっていった人工の島がある。

# イギリスの大半はなだらかな丘陵地及び平原で占められており、国土のおよそ90%が可住地となっている。そのため、国土面積自体は[[日本]]のおよそ3分の2（[[本州]]と[[四国]]を併せた程度）であるが、[[可住地面積]]は逆に日本の倍近くに及んでいる。イギリスは[[森林]]も少なく、日本が国土の3分の2が森林で覆われているのに対し、イギリスの[[森林率]]は11%ほどである<ref>{{Cite web|url=http://yoshio-kusano.sakura.ne.jp/nakayamakouen6newpage3.html |title=中山徹奈良女子大教授の記念講演6 どうやって森を再生するかイギリスの例 |publisher=日本共産党宝塚市議 草野義雄 |accessdate=2014-5-10}}</ref>。

# ===気候===
# イギリスの[[気候]]は2つの要因によって基調が定まっている。まず、[[メキシコ湾流]]に由来する暖流の北大西洋海流の影響下にあるため、北緯50度から60度という高緯度にもかかわらず温暖であること、次に中緯度の偏西風の影響を強く受けることである。以上から[[西岸海洋性気候]] (Cfb) が卓越する。[[大陸性気候]]はまったく見られず、気温の年較差は小さい。

# メキシコ湾流の影響は冬季に強く現れる。特に西部において気温の低下が抑制され、気温が西岸からの距離に依存するようになる。夏季においては緯度と気温の関連が強くなり、比較的東部が高温になる。水の蒸散量が多い夏季に東部が高温になることから、年間を通じて東部が比較的乾燥し、西部が湿潤となる。

# 降水量の傾向もメキシコ湾流の影響を受けている。東部においては、降水量は一年を通じて平均しており、かつ、一日当たりの降水量が少ない。冬季、特に風速が観測できない日には霧が発生しやすい。この傾向が強く当てはまる都市としてロンドンが挙げられる。西部においては降水量が2500mmを超えることがある。

# 首都ロンドンの年平均気温は10.0度、年平均降水量は750.6mm。1月の平均気温は4.4度、7月の平均気温は17.1度。

# ==政治==
# [[File:Elizabeth II greets NASA GSFC employees, May 8, 2007 edit.jpg|thumb|left|150px|英国本国及び[[英連邦王国]][[イギリスの君主|女王]]、[[エリザベス2世]]]]
# [[File:Palace of Westminster, London - Feb 2007.jpg|thumb|[[イギリスの議会|英国議会]]が議事堂として使用する[[ウェストミンスター宮殿]]]]
# {{main|イギリスの政治|イギリスの憲法|英国法|英米法}}
# [[政体]]は[[立憲君主制]]をとっている。[[不文憲法]]の[[国家]]であり、一つに成典化された[[憲法]]典はなく、[[制定法]]（議会制定法だけでなく「大憲章（[[マグナ・カルタ]]）」のような国王と貴族の契約も含む）や[[判例法]]、歴史的文書及び[[慣習法]]（憲法的習律と呼ばれる）など[[イギリスの憲法]]を構成している。憲法を構成する法律が他の法律と同様に議会で修正可能なため[[軟性憲法]]と呼ばれる。国家[[元首]]は[[イギリスの君主]]であるが、憲法を構成する慣習法の一つに「'''国王は君臨すれども統治せず'''」とあり、その存在は極めて儀礼的である。このように歴史的にも人の支配を排した[[法の支配]]が発達しており、伝統の中に築かれた[[民主主義]]が見て取れる。また、立法権優位の[[間接民主制|議会主義]]が発達している。議院内閣制や[[政党制]]（[[複数政党制]]）など、現在多くの国家が採用している民主的諸制度が発祥した国として有名である。

# [[立法権]]は[[イギリスの議会|議会]]に、[[行政権]]は首相及び[[内閣 (イギリス)|内閣]]に、[[司法権]]は[[イギリス最高裁判所]]及び以下の下級[[裁判所]]によって行使される。

# [[イギリスの議会]]は、上院（[[貴族院 (イギリス)|貴族院]]）と下院（[[庶民院]]）の[[二院制]]である。[[1911年]]に制定された[[議会法]]（[[イギリスの憲法|憲法]]の構成要素の一つ）により、「下院の優越」が定められている。議院内閣制に基づき、行政の長である首相は憲法的習律に従って下院第一党党首（下院議員）を国王が任命、閣僚は議会上下両院の議員から選出される。下院は単純[[小選挙区制]]による[[直接選挙]]（[[普通選挙]]）で選ばれるが、上院は非公選であり任命制である。近年、従来[[右派]]の保守党と[[左派]]の労働党により[[二大政党制]]化して来たが、近年では第三勢力の[[自由民主党 (イギリス)|自由民主党]]（旧[[自由党 (イギリス)|自由党]]の継承政党）の勢力も拡大している。

# [[1996年]]に[[北アイルランド議会]]が、[[1999年]]には[[スコットランド議会]]と[[ウェールズ議会]]が設置され、自治が始まった。スコットランドには主に[[スコットランド国民党]]による[[スコットランド独立運動]]が存在し、北アイルランドには20世紀から続く[[北アイルランド問題]]も存在する。

# ==外交と軍事==
# [[File:David Cameron and Barack Obama at the G20 Summit in Toronto.jpg|thumb|left|[[デーヴィッド・キャメロン]][[イギリスの首相|英国首相]]及び[[バラク・オバマ]][[アメリカ合衆国大統領|米国大統領]] (G20トロント・サミット)]]
# {{Main|イギリスの国際関係|イギリス軍}}
# イギリスは[[国際連合安全保障理事会|安全保障理事会]]の常任理事国であり、[[主要国首脳会議|G8]]、[[北大西洋条約機構|NATO]]、[[欧州連合|EU]]の加盟国である。そして、[[アメリカ合衆国]]と歴史的に「特別な関係」を持つ。アメリカ合衆国とヨーロッパ以外にも、イギリスと密接な同盟国は、[[イギリス連邦|連邦国]]と他の英語圏の国家を含む。イギリスの世界的な存在と影響は、各国との相補関係と軍事力を通して拡大されている。それは、世界中で約80の軍事基地の設置と軍の配備を維持していることにも現れている<ref>{{cite web|url=http://www.globalpowereurope.eu/|title=Global Power Europe|publisher=<code>Globalpowereurope.eu</code>|language=英語|accessdate=2008-10-17}}</ref>。2011年の軍事支出は627億ドルと一定水準を保っている。

# [[File:Soldiers Trooping the Colour, 16th June 2007.jpg|thumb|軍旗分列行進式における[[近衛兵 (イギリス)|近衛兵]]]]
# イギリスの[[軍隊]]は「イギリス軍」<ref>{{lang-en-short|British Armed Forces}}</ref>または「陛下の軍」<ref>{{lang-en-short|His/Her Majesty's Armed Forces}}</ref>として知られている。しかし、公式の場では「アームド・フォーシーズ・オブ・ザ・クラウン」<!-- 慣例がないため未翻訳 --><ref>{{lang-en-short|Armed Forces of the Crown}}</ref>と呼ばれる<ref>{{Cite web|url=http://www.raf.mod.uk/legalservices/p3chp29.htm|title=Armed Forces Act 1976, Arrangement of Sections|publisher=<code>raf.mod.uk</code>|language=英語|accessdate=2009-02-22 }}</ref>（クラウンは冠、王冠の意）。全軍の最高司令官はイギリスの君主であるが、首相が事実上の指揮権を有している。軍の日常的な管理は[[国防省 (イギリス)|国防省]]に設置されている[[国防委員会]]によって行われている。

# イギリスの軍隊は各国の軍隊に比べて広範囲にわたる活動を行い、世界的な[[戦力投射]]能力を有する軍事大国の1つに数えられ、国防省によると[[軍事費]]は世界で2位を誇る。現在、軍事費はGDPの2.5%を占めている<ref>{{Cite web|url=http://www.mod.uk/DefenceInternet/AboutDefence/Organisation/KeyFactsAboutDefence/DefenceSpending.htm|title=Defence Spending|publisher={{lang|en|Ministry of Defence}}|language=英語|accessdate=2008-01-06 }}</ref>。イギリス軍はイギリス本国と海外の領土を防衛しつつ、世界的なイギリスの将来的国益を保護し、国際的な平和維持活動の支援を任ぜられている。

# 2005年の時点で[[イギリス陸軍|陸軍]]は102,440名、[[イギリス空軍|空軍]]は49,210名、[[イギリス海軍|海軍]]（[[イギリス海兵隊|海兵隊]]を含む）は36,320名の兵員から構成されており、イギリス軍の190,000名が現役軍人として80か国以上の国に展開、配置されている<ref>{{lang-en-short|Ministry of Defence}}「{{PDFlink|[http://www.mod.uk/NR/rdonlyres/6FBA7459-7407-4B85-AA47-7063F1F22461/0/modara_0405_s1_resources.pdf Annual Reports and Accounts 2004-05]|1.60&nbsp;MB}}」2006-05-14 閲覧。{{En icon}}</ref>。

# イギリスは[[核兵器]]の保有を認められている5カ国の1つであり、[[核弾頭]]搭載の[[トライデント (ミサイル)|トライデント II]] [[潜水艦発射弾道ミサイル]] (SLBM) を運用している。[[イギリス海軍]]は、トライデント IIを搭載した[[原子力潜水艦]]4隻で[[核抑止]]力の任務に担っている。
# {{See also|イギリスの大量破壊兵器}}

# イギリス軍の幅広い活動能力にも関わらず、最近の国事的な国防政策でも協同作戦時に最も過酷な任務を引き受けることを想定している<ref>{{lang|en|Office for National Statistics}}、{{lang|en|UK 2005:The Official Yearbook of the United Kingdom of Great Britain and Northern Ireland}}、p. 89 {{En icon}}</ref>。イギリス軍が単独で戦った最後の戦争は[[フォークランド紛争]]で、全面的な戦闘が丸々3か月続いた。現在は[[ボスニア紛争]]、[[コソボ紛争]]、[[アフガニスタン紛争 (2001年-)|アフガニスタン侵攻]]、[[イラク戦争]]など、アメリカ軍やNATO諸国との[[連合作戦]]が慣例となっている。イギリス海軍の軽歩兵部隊である[[イギリス海兵隊]]は、[[上陸戦|水陸両用作戦]]の任務が基本であるが、イギリス政府の外交政策を支援するため、軽歩兵部隊の特性を生かして海外へ即座に展開できる機動力を持つ。

# イギリスの在イラン大使館[[2011年]][[11月29日]]に[[イラン]]のデモ隊が乱入した事件について、ヘイグ外相は在イラン大使館の即時閉鎖と職員全員の国外退去を命じたと[[11月30日]]の下院で答弁した。同外相はイランを批判し、キャメロン首相もイランを非難した。この事件に対して欧州各国（ドイツやフランス、イタリア）も大使の召還を決定・検討している。<ref>[http://www.asahi.com/international/update/1201/TKY201111300900.html?ref=reca 英、イラン大使館を閉鎖　全職員、国外に退避] 朝日新聞 2011年12月1日</ref><ref>[http://mainichi.jp/select/world/europe/news/20111130k0000e030066000c.html イラン：英首相が報復措置を示唆　英国大使館襲撃で] 毎日新聞　2011年11月30日</ref>

# ==地方行政区分==
# [[File:Scotland Parliament Holyrood.jpg|thumb|[[スコットランド議会]]議事堂]]
# {{main|イギリスの地方行政区画}}

# 連合王国の地方行政制度は次の各地方によって異なっている。
# *イングランド
# *スコットランド
# *ウェールズ
# *北アイルランド
# このほか、連合王国には含まれないものの、連合王国がその国際関係について責任を負う地域として、[[イギリスの海外領土|海外領土]]および[[王室属領]]が存在する。

# ===主要都市===
# {{Main|イギリスの都市の一覧}}
# イギリスは四つの非独立国である[[イングランド]]、[[スコットランド]]、[[ウェールズ]]、[[北アイルランド]]より構成される。それぞれの国は首都を持ち、[[ロンドン]]（イングランド）、[[エディンバラ]]（スコットランド）、[[カーディフ]]（ウェールズ）、[[ベルファスト]]（北アイルランド）がそれである。中でもイングランドの首都であるロンドンは、イギリスの首都としての機能も置かれる。　

# {|class=wikitable
# |+2001年国勢調査
# !都市!![[イギリスの地方行政区画|行政区分]]!!人口
# |-
# |ロンドン||イングランド||align=right|7,172,091
# |-
# |[[バーミンガム]]||イングランド||align=right|970,892
# |-
# |[[グラスゴー]]||スコットランド||align=right|629,501
# |-
# |[[リヴァプール]]||イングランド||align=right|469,017
# |-
# |[[リーズ]]||イングランド||align=right|443,247
# |-
# |[[シェフィールド]]||イングランド||align=right|439,866
# |-
# |エディンバラ||スコットランド||align=right|430,082
# |-
# |[[ブリストル]]||イングランド||align=right|420,556
# |-
# |[[マンチェスター]]||イングランド||align=right|394,269
# |-
# |[[レスター]]||イングランド||align=right|330,574
# |-
# |[[コヴェントリー]]||イングランド||align=right|303,475
# |-
# |[[キングストン・アポン・ハル]]||イングランド||align=right|301,416
# |-
# |[[ブラッドフォード (イングランド)|ブラッドフォード]]||イングランド||align=right|293,717
# |-
# |カーディフ||ウェールズ||align=right|292,150
# |-
# |ベルファスト||北アイルランド||align=right|276,459
# |-
# |[[ストーク・オン・トレント]]||イングランド||align=right|259,252
# |-
# |[[ウルヴァーハンプトン]]||イングランド||align=right|251,462
# |-
# |[[ノッティンガム]]||イングランド||align=right|249,584
# |-
# |[[プリマス]]||イングランド||align=right|243,795
# |-
# |[[サウサンプトン]]||イングランド||align=right|234,224
# |}

# 4位以下の都市人口が僅差であり順位が変わりやすい。2006年はロンドン、バーミンガム、リーズ、グラスゴー、シェフィールドの順となっている。

# ==科学技術==
# 17世紀の科学革命はイングランドとスコットランドが、18世紀の[[産業革命]]はイギリスが世界の中心であった。重要な発展に貢献した科学者と技術者を多数輩出している。[[アイザック・ニュートン]]、[[チャールズ・ダーウィン]]、電磁波の[[ジェームズ・クラーク・マックスウェル]]、そして最近では宇宙関係の[[スティーブン・ホーキング]]。科学上の重要な発見者には水素の[[ヘンリー・キャベンディッシュ]]、ペニシリンの[[アレクサンダー・フレミング]]、DNAの[[フランシス・クリック]]がいる。工学面では[[グラハム・ベル]]など。科学の研究・応用は大学の重要な使命であり続け、2004年から5年間にイギリスが発表した科学論文は世界の7％を占める。学術雑誌[[ネイチャー]]や医学雑誌[[ランセット]]は世界的に著名である。

# ==経済==
# [[File:London.bankofengland.arp.jpg|thumb|left|[[イングランド銀行]]はイギリスの[[中央銀行]]である。]]
# {{main|イギリスの経済}}
# [[国際通貨基金|IMF]]によると、[[2013年]]のイギリスの[[国内総生産|GDP]]は2兆5357億ドルであり、世界第6位、[[ヨーロッパ|欧州]]では、[[ドイツ]]、フランスに次ぐ第3位である<ref name="GDP1">[http://www.imf.org/external/pubs/ft/weo/2014/01/weodata/weorept.aspx?pr.x=71&pr.y=15&sy=2013&ey=2019&scsm=1&ssd=1&sort=country&ds=.&br=1&c=112&s=NGDPD%2CNGDPDPC&grp=0&a= IMF:World Economic Outlook Database]</ref>。同年の一人当たりのGDPは39,567ドルである<ref name="GDP1"/>。

# [[File:City of London skyline from London City Hall - Oct 2008.jpg|thumb|250px|[[ロンドン]]はビジネス、文化、政治などを総合評価した[[世界都市#世界都市指数|世界都市ランキング]]で、ニューヨークに次ぐ世界第2位の都市と評価された<ref>[http://www.atkearney.com/documents/10192/4461492/Global+Cities+Present+and+Future-GCI+2014.pdf/3628fd7d-70be-41bf-99d6-4c8eaf984cd5 2014 Global Cities Index and Emerging Cities Outlook] (2014年4月公表)</ref>。]]
# 首都ロンドンは[[ニューヨーク]]や[[香港]]などと共に世界トップレベルの[[金融センター]]である<ref>[http://www.sh.xinhuanet.com/shstatics/images2013/IFCD2013_En.pdf Xinhua-Dow Jones International Financial Centers Development Index （2013)] (2013年9月公表)</ref>。ロンドンの[[シティ・オブ・ロンドン|シティ]]には、世界屈指の[[証券取引所]]である[[ロンドン証券取引所]]がある。イギリスの[[外国為替]]の1日平均取引金額は2兆7260億ドルであり、アメリカの2倍以上の規模を誇り世界一である<ref>[https://www.bis.org/publ/rpfx13fx.pdf 国際決済銀行の統計] 2013年9月12日閲覧。</ref>。[[富裕層|富裕層人口]]も非常に多く、金融資産100万ドル以上を持つ富裕世帯は約41万世帯と推計されており、アメリカ、日本、[[中華人民共和国|中国]]に次ぐ第4位である<ref name="Rich">[http://www.bcg.com/expertise_impact/publications/PublicationDetails.aspx?id=tcm:12-107081 BCG Global Wealth 2012]</ref>。また、金融資産1億ドル以上を持つ超富裕世帯は1,125世帯と推計されており、アメリカに次ぐ第2位である<ref name="Rich"/>。

# [[18世紀]]の産業革命以降、近代において[[世界経済]]をリードする[[工業国]]で、[[造船]]や[[航空機]]製造などの[[工業|重工業]]から金融業や[[エンターテインメント|エンターテイメント]]産業に至るまで、様々な産業が盛んである。しかしながら、19世紀後半からはアメリカ合衆国、[[ドイツ帝国]]の工業化により世界的優位は失われた。

# イギリスの金融資本は自国内の製造業への投資より、アメリカ合衆国や[[イギリス帝国|植民地]]への投資を優先したため、イギリス製造業はしだいにドイツ・フランスやアメリカ合衆国に立ち後れるようになってゆく。20世紀に入るころより国力は衰え始め、二度の世界大戦は英国経済に大きな負担を与えた。各地の植民地をほとんど独立させた1960年代後半には経済力はいっそう衰退した。

# 戦後の経済政策の基調は市場と国営セクター双方を活用する[[混合経済]]体制となり、左派の労働党は「ゆりかごから墓場まで」と呼ばれる公共福祉の改善に力を入れ、保守党も基本的にこれに近い政策を踏襲、1960年代には世界有数の[[福祉国家論|福祉国家]]になった。しかし、[[オイルショック]]を契機とした不況になんら実用的な手立てを打たなかったために、継続的な不況に陥り、企業の倒産やストが相次いだ。20世紀初頭から沈滞を続けたイギリス経済は深刻に行き詰まり、'''英国病'''とまで呼ばれた。

# [[1979年]]に登場したサッチャー政権下で国営企業の民営化や各種規制の緩和が進められ、1980年代後半には海外からの直接投資や証券投資が拡大した。この過程で製造業や[[鉱業]]部門の労働者が大量解雇され、深刻な失業問題が発生。基幹産業の一つである[[自動車]]産業の殆どが外国企業の傘下に下ったが、外国からの投資の拡大を、しだいに自国の産業の活性化や雇用の増大に繋げて行き、その後の経済復調のきっかけにして行った（[[ウィンブルドン現象]]）。

# その後、[[1997年]]に登場したブレア政権における経済政策の成功などにより、経済は復調し、アメリカや他のヨーロッパの国に先駆けて好景気を享受するようになったが、その反面でロンドンを除く地方は経済発展から取り残され、[[貧富の差]]の拡大や不動産価格の上昇などの問題が噴出してきている。
# <!--
# 2007年11月7日、FTSE100の先物に大量にプログラミングの不具合で過剰な注文があり、乱高下。これに便乗して投機筋が利鞘を稼ごうと市場に参加したため、株価が不安定になった。--><!-- 11月7日の事件がその後、イギリス経済に与えた影響が確定した時点でコメントアウトをはずしてください -->
# さらに、2008年にはアメリカ合衆国の[[サブプライムローン]]問題の影響をまともに受けて金融不安が増大した上に、資源、食料の高騰の直撃を受け、[[アリスター・ダーリング]][[財務大臣 (イギリス)|財務大臣]]が「過去60年間で恐らく最悪の下降局面に直面している」と非常に悲観的な見通しを明らかにしている<ref>{{Cite web|date=2008-08-30|url=http://sankei.jp.msn.com/economy/business/080830/biz0808301850007-n1.htm|work=産経新聞|title=「英経済、過去60年間で最悪の下降局面」英財務相|accessdate=2008-08-30}}</ref>。2012年2月時点で失業率は8%を超えるまでに悪化した状態にある。

# ===鉱業===
# [[File:Oil platform in the North SeaPros.jpg|thumb|[[北海油田]]]]
# イギリスの鉱業は産業革命を支えた[[石炭]]が著名である。300年以上にわたる採炭の歴史があり、石炭産業の歴史がどの国よりも長い。2002年時点においても3193万トンを採掘しているものの、ほぼ同量の石炭を輸入している。[[北海油田]]からの[[原油]]採掘量は1億1000万トンに及び、これは世界シェアの3.2%に達する。最も重要なエネルギー資源は[[天然ガス]]であり、世界シェアの4.3%（第4位）を占める。有機鉱物以外では、世界第8位となるカリ塩 (KCl) 、同10位となる塩 (NaCl) がある。金属鉱物には恵まれていない。最大の[[鉛]]鉱でも1000トンである。

# ===農業===
# 最も早く工業化された国であり、現在でも高度に工業化されている。農業の重要性は低下し続けており、GDPに占める農業の割合は2%を下回った。しかしながら、世界シェア10位以内に位置する農産物が8品目ある。穀物では[[オオムギ]]（586万トン、世界シェア10位、以下2004年時点）、工芸作物では[[亜麻]]（2万6000トン、5位）、[[テンサイ]]（790万トン、9位）、[[アブラナ|ナタネ]]（173万トン、5位）、[[ホップ]]（2600トン、6位）である。家畜、畜産品では、[[ヒツジ]]（3550万頭、7位）、[[ウール|羊毛]]（6万5000トン、5位）、[[牛乳]]（1480万トン、9位）が主力。

# ===貿易===
# イギリスは産業革命成立後、自由貿易によって多大な利益を享受してきた。ただし、21世紀初頭においては貿易の比重は低下している。2004年時点の貿易依存度、すなわち国内総生産に対する輸出入額の割合は、ヨーロッパ諸国内で比較するとイタリアと並んでもっとも低い。すなわち、輸出16.1%、輸入21.3%である。

# 国際連合のInternational Trade Statistics Yearbook 2003によると、品目別では輸出、輸入とも工業製品が8割弱を占める。輸出では電気機械（15.2%、2003年）、機械類、自動車、医薬品、原油、輸入では電気機械 (16.3%)、自動車、機械類、衣類、医薬品の順になっている。

# 貿易相手国の地域構成は輸出、輸入ともヨーロッパ最大の工業国ドイツと似ている。輸出入とも対EUの比率が5割強。輸出においてはEUが53.4%（2003年）、次いでアメリカ合衆国15.0%、アジア12.1%、輸入においてはEU52.3%、アジア15.1%、アメリカ合衆国9.9%である。

# 国別では、主な輸出相手国はアメリカ合衆国（15.0%、2003年）、ドイツ (10.4%)、フランス (9.4%)、オランダ (5.8%)、アイルランド (6.5%)。輸入相手国はドイツ (13.5%)、アメリカ合衆国 (9.9%)、フランス (8.3%)、オランダ (6.4%)、中華人民共和国 (5.1%) である。

# ===通貨===
# EU加盟国ではあるが、[[通貨]]は[[ユーロ]]ではなく[[スターリング・ポンド]] (GBP) が使用されている。補助単位は[[ペニー]]で、[[1971年]]より1ポンドは100[[ペンス]]である。かつてポンドは[[アメリカ合衆国ドル|USドル]]が世界的に決済通貨として使われるようになる以前、イギリス帝国の経済力を背景に国際的な決済通貨として使用された。イギリスの[[欧州連合]]加盟に伴い、ヨーロッパ共通通貨であるユーロにイギリスが参加するか否かが焦点となったが、イギリス国内に反対が多く、[[欧州連合の経済通貨統合|通貨統合]]は見送られた。[[イングランド銀行]]が連合王国の[[中央銀行]]であるが、スコットランドと北アイルランドでは地元の商業銀行も独自の紙幣を発行している。イングランド銀行の紙幣にはエリザベス女王が刷られており、連合王国内で共通に通用する。スコットランド紙幣、北アイルランド紙幣ともに連合王国内で通用するが、受け取りを拒否されることもある。

# ===企業===
# {{main|イギリスの企業一覧}}

# ==交通==
# ===道路===
# 自動車は[[左側通行]]である。また、インド・オーストラリア・[[香港]]・[[シンガポール]]など、旧イギリス植民地の多くが左側通行を採用している。

# ===鉄道===
# {{main|イギリスの鉄道}}
# [[File:Eurostar at St Pancras Jan 2008.jpg|thumb|国際列車[[ユーロスター]]の発着駅である[[セント・パンクラス駅]]]]
# 近代鉄道の発祥の地であり国内には鉄道網が張り巡らされ、ロンドンなどの都市には14路線ある[[地下鉄]]（チューブトレイン）網が整備されている。しかし1960年代以降は設備の老朽化のために事故が多発し、さらに運行の遅延が常習化するなど問題が多発している。

# 小規模の民間地方鉄道の運営する地方路線の集まりとして誕生したイギリスの鉄道は、19世紀から[[20世紀]]前期にかけて、競合他社の買収などを通じて比較的大規模な少数の会社が残った。[[1921年]]にはついに[[ロンドン・ミッドランド・アンド・スコティッシュ鉄道]]、[[ロンドン・アンド・ノース・イースタン鉄道]]、[[グレート・ウェスタン鉄道]]、[[サザン鉄道 (イギリス)|サザン鉄道]]の4大鉄道会社にまとまり、これらは[[1948年]]に国有化されて[[イギリス国鉄]] (BR) となった。しかし[[1994年|1994]]～[[1997年|97年]]にBRは、旅客輸送・貨物輸送と、線路や駅などの施設を一括管理する部門に分割されて民営化された。

# [[1994年]]開業したイギリス、フランス両国所有の英仏海峡トンネルは、イングランドのフォークストンからフランスのカレーまで、[[イギリス海峡]]の海底130mを長さ50.5kmで走る3本の並行したトンネルからなる。1本は貨物専用で、残り2本は乗客・車・貨物の輸送に使われる。このトンネルを使ってセント・パンクラス駅からはヨーロッパ大陸との間を結ぶ[[ユーロスター]]が運行され、[[パリ]]や[[ブリュッセル]]、[[リール (フランス)|リール]]などのヨーロッパ内の主要都市との間を結んでいる。

# ===海運===
# 周囲を海に囲まれている上、世界中に植民地を持っていたことから古くからの海運立国であり、[[P&O]]や[[キュナード・ライン]]など多くの海運会社がある。また、歴史上有名な「[[タイタニック (客船)|タイタニック号]]」や「[[クイーン・エリザベス2]]」、「[[クイーン・メリー2]]」などの著名な客船を運航している。

# ===航空===
# [[File:Heathrow T5.jpg|thumb|[[w:London Heathrow Terminal 5|London Heathrow Terminal 5]]. [[ロンドン・ヒースロー空港]]は[[w:World's busiest airports by international passenger traffic|国際線利用客数]]では世界随一である。]]

# 民間航空が古くから発達し、特に国際線の拡張は世界に広がる植民地間をつなぐために重要視されてきた。現在は、[[ブリティッシュ・エアウェイズ]]や[[ヴァージン・アトランティック航空]]、[[bmi (航空会社)|bmi]]や[[イージージェット]]などの航空会社がある。中でもブリティッシュ・エアウェイズは、[[英国海外航空]]と[[英国欧州航空]]の2つの国営会社が合併して設立され、1987年に民営化された世界でも最大規模の航空会社である。1976年にはフランスの航空会社、[[エール・フランス]]とともに、コンコルド機を開発して世界初の[[超音速旅客機|超音速旅客]]輸送サービスを開始。しかし、老朽化とコスト高などにより2003年11月26日をもって運航終了となり、コンコルドは空から姿を消した。

# 主な空港として、ロンドンの[[ロンドン・ヒースロー空港|ヒースロー空港]]、[[ロンドン・ガトウィック空港|ガトウィック]]、[[ロンドン・スタンステッド空港|スタンステッド]]のほか、[[ロンドン・ルートン空港|ルートン]]、[[マンチェスター空港|マンチェスター]]、グラスゴー空港などが挙げられる。

# 日本との間には2014年9月現在、ヒースロー空港と[[成田国際空港|成田空港]]の間にブリティッシュ・エアウェイズ、ヴァージンアトランティック航空がそれぞれ1日1便直行便を運航している。またヒースロー空港と[[東京国際空港|羽田空港]]の間にも、ブリティッシュ・エアウェイズ、[[日本航空]]、[[全日本空輸|全日空]]がそれぞれ1日1便直行便を運航している。

# ==通信==
# 近年のイギリスでは、[[スマートフォン]]の利用者が増加している。ヒースロー空港などに自動販売機で[[SIMカード]]を購入できるようになっている。[[プリペイド|プリペイド式]]となっており、スーパーなどで、通話・通信料をチャージして使う。

# おもな通信業者
# *[[ボーダフォン]] イギリス
# *[[Orange]] フランス T-Mobile（イギリス）と資本合併
# *[[T-Mobile]] ドイツ Orange（イギリス）と資本合併
# *[[O2]] [[スペイン]] Telefonica傘下
# *3（Three） 香港

# ==国民==
# {{main|イギリス人|:en:British people|:en:Demography of the United Kingdom}}
# 「イギリス民族」という民族は存在しない。主な民族はイングランドを中心に居住する[[ゲルマン人|ゲルマン民族]]系の[[イングランド人]]（[[アングロ・サクソン人]]）、[[ケルト人|ケルト]]系の[[スコットランド人]]、[[アイルランド人]]、[[ウェールズ人]]だが、旧植民地出身のインド系（[[印僑]]）、[[アフリカ系]]、[[アラブ系]]や[[華僑]]なども多く住む[[多民族国家]]である。

# イギリスの国籍法では、旧植民地関連の者も含め、自国民を次の六つの区分に分けている。
# *GBR:British Citizen - 英国市民
# *: 本国人
# *GBN:British National (Overseas) - 英国国民（海外）※「BN(O)」とも書く。
# *: 英国国籍で、香港の[[永住権|住民権]]も持つ人。
# *GBD:British Dependent (Overseas) Territories Citizen - イギリス属領市民
# *: 植民地出身者
# *GBO:British Overseas Citizen - イギリス海外市民
# *: ギリシャ西岸の諸島・インド・パキスタン・マレーシアなどの旧植民地出身者のうち特殊な歴史的経緯のある者
# *GBP:British Protected Person - イギリス保護民
# *GBS:British Subject - イギリス臣民
# *: アイルランド（北部以外）・ジブラルタルなどGBDやGBOとは別の経緯のある地域の住民で一定要件に該当する者

# いずれの身分に属するかによって、国内での様々な取扱いで差異を生ずることがあるほか、パスポートにその区分が明示されるため、海外渡航の際も相手国により取扱いが異なることがある。例えば、日本に入国する場合、British citizen（本国人）とBritish National (Overseas)（英国籍香港人）は短期訪問目的なら[[査証]]（ビザ）不要となるが、残りの四つは数日の[[観光]]訪日であってもビザが必要となる。

# ===言語===
# {{main|:en:Languages of the United Kingdom}}
# [[File:Anglospeak.svg|thumb|250px|世界の[[英語圏]]地域。濃い青色は英語が[[公用語]]または事実上の公用語になっている地域。薄い青色は英語が公用語であるが主要な言語ではない地域。]]
# 事実上の[[公用語]]は英語（[[イギリス英語]]）でありもっとも広く使用されているが、イングランドの主に[[コーンウォール]]で[[コーンウォール語]]、ウェールズの主に北部と中部で[[ウェールズ語]]、スコットランドの主に[[ローランド地方]]で[[スコットランド語]]、ヘブリディーズ諸島の一部で[[スコットランド・ゲール語]]、北アイルランドの一部で[[:en:Ulster Scots dialects|アルスター・スコットランド語]]と[[アイルランド語]]が話されており、それぞれの構成国で公用語になっている。

# 特に、ウェールズでは[[1993年]]にウェールズ語が公用語になり、英語と同等の法的な地位を得た。[[2001年]]現在、ウェールズ人口の約20%がウェールズ語を使用し、その割合は僅かではあるが増加傾向にある。公文書や道路標識などはすべてウェールズ語と英語とで併記される。また、16歳までの義務教育においてウェールズ語は必修科目であり、ウェールズ語を主要な教育言語として使用し、英語は第二言語として扱う学校も多く存在する。

# ===宗教===
# {{See also|イギリスの宗教}}
# 10年に一度行われるイギリス政府の国勢調査によれば、2001年、[[キリスト教徒]]が71.6%、[[イスラム教徒]]が2.7%、[[ヒンドゥー教]]徒が1.0%。
# 2011年、キリスト教徒74.7%、イスラム教徒2.3%、ヒンドゥー教徒が1.1%。
# キリスト教徒が増えた背景には、2011年4月29日のウィリアム王子の結婚が影響しているという見解がある。

# キリスト教の内訳は、[[英国国教会]]が62%、[[カトリック]]が13%、[[長老派]]が6%、[[メソジスト]]が3%程度と推定されている<ref>『The Changing Religious Landscape of Europe』 Hans Knippenberg</ref>。

# === 婚姻 ===
# 婚姻の際には、夫婦同姓・複合姓・[[夫婦別姓]]のいずれも選択可能である。また[[同性婚]]も可能である<ref>「英国・イングランドとウェールズ、同性婚を初の合法化」朝日新聞、2014年3月29日</ref>。また、在日英国大使館においても、同性婚登録を行うことが可能である<ref>「在日本英国大使館・領事館で同性婚登録が可能に」　週刊金曜日　2014年6月13日</ref><ref>https://www.gov.uk/government/news/introduction-of-same-sex-marriage-at-british-consulates-overseas.ja</ref>。

# ===教育===
# {{main|イギリスの教育}}
# イギリスの学校教育は地域や公立・私立の別により異なるが、5歳より小学校教育が開始される。

# ==文化==
# {{Main|:en:Culture of the United Kingdom}}
# ===食文化===
# {{Main|イギリス料理}}
# {{節stub}}

# ===文学===
# [[ファイル:CHANDOS3.jpg|thumb|150px|[[ウィリアム・シェイクスピア]]]]
# {{main|イギリス文学}}
# 多くの傑作を後世に残した[[ウィリアム・シェイクスピア]]は、[[イギリス・ルネサンス演劇]]を代表する空前絶後の詩人、および劇作家と言われる。初期のイギリス文学者としては[[ジェフリー・オブ・モンマス]]や[[ジェフリー・チョーサー]]、[[トマス・マロリー]]が著名。18世紀になると[[サミュエル・リチャードソン]]が登場する。彼の作品には3つの小説の基本条件、すなわち「フィクション性および物語性、人間同士の関係（愛情・結婚など）、個人の性格や心理」といった条件が満たされていたことから、彼は「近代小説の父」と呼ばれている。

# 19世紀の初めになると[[ウィリアム・ブレイク]]、[[ウィリアム・ワーズワース]]ら[[ロマン主義]]の詩人が活躍した。19世紀には小説分野において革新が見られ、[[ジェーン・オースティン]]、[[ブロンテ姉妹]]、[[チャールズ・ディケンズ]]、[[トーマス・ハーディ]]らが活躍した。19世紀末には、[[耽美主義]]の[[オスカー・ワイルド]]、現代の[[推理小説]]の生みの親[[アーサー・コナン・ドイル]]が登場。

# 20世紀に突入すると、「[[サイエンス・フィクション|SF]]の父」[[ハーバート・ジョージ・ウェルズ]]、[[モダニズム]]を探求した[[デーヴィッド・ハーバート・ローレンス]]、[[ヴァージニア・ウルフ]]、預言者[[ジョージ・オーウェル]]、「ミステリーの女王」[[アガサ・クリスティ]]などが出てくる。そして近年、[[ハリー・ポッターシリーズ]]の[[J・K・ローリング]]がかつての[[J・R・R・トールキン]]のような人気を世界中で湧かせている。

# === 哲学 ===
# {{main|{{仮リンク|イギリスの哲学|en|British philosophy}}}}
# {{節stub}}
# * [[イギリス経験論]]
# * [[イギリス理想主義]]

# ===音楽===
# {{main|イギリスの音楽}}
# <!-- 音楽の欄はジャンルも影響力もバラバラの人名が並んでいるため、出典に基づいた整理が必要 -->
# [[クラシック音楽]]における特筆すべきイギリス人作曲家として、「ブリタニア音楽の父」[[ウィリアム・バード]]、[[ヘンリー・パーセル]]、[[エドワード・エルガー]]、[[アーサー・サリヴァン]]、[[レイフ・ヴォーン・ウィリアムズ]]、[[ベンジャミン・ブリテン]]がいる。特に欧州大陸で古典派、ロマン派が隆盛をきわめた18世紀後半から19世紀にかけて有力な作曲家が乏しかった時期もあったが、旺盛な経済力を背景に演奏市場としては隆盛を続け、ロンドンはクラシック音楽の都の一つとして現在残る。

# ====イギリスのポピュラー音楽====
# [[ファイル:The Fabs.JPG|thumb|200px|[[ビートルズ]]]]
# {{main|ロック (音楽)}}
# [[ポピュラー音楽]]（特にロックミュージック）において、イギリスは先鋭文化の発信地として世界的に有名である。1960、70年代になると[[ロック (音楽)|ロック]]が誕生し、中でも[[ビートルズ]]や[[ローリング・ストーンズ]]といった[[ロックンロール]]の影響色濃いバンドが、その表現の先駆者として活躍した。やがて[[キング・クリムゾン]]や[[ピンク・フロイド]]などの[[プログレッシブ・ロック]]や、[[クイーン (バンド)|クイーン]]、[[クリーム (バンド)|クリーム]]、[[レッド・ツェッペリン]]、[[ディープ・パープル]]、[[ブラック・サバス]]などの[[R&B]]や[[ハードロック]]がロックの更新に貢献。1970年代後半の[[パンク・ロック]]の勃興においては、アメリカ・ニューヨークからの文化を取り入れ、ロンドンを中心に[[セックス・ピストルズ]]、[[ザ・クラッシュ]]らが国民的なムーブメントを起こす。

# パンク・ロック以降はインディー・ロックを中心に[[ニュー・ウェーヴ (音楽)|ニュー・ウェーヴ]]などといった新たな潮流が生まれ、[[テクノポップ]]・ドラッグミュージック文化の発達と共に[[ニュー・オーダー]]、[[ザ・ストーン・ローゼズ]]、[[グリッド]]などが、メインストリームでは[[デュラン・デュラン]]、[[デペッシュ・モード]]らの著名なバンドが生まれた。90年代は[[ブリットポップ]]や[[エレクトロニカ]]がイギリスから世界中に広まり人気を博し、[[オアシス (バンド)|オアシス]]、[[ブラー]]、[[レディオヘッド]]、[[プロディジー]]、[[マッシヴ・アタック]]などは特に目覚ましい。[[シューゲイザー]]、[[トリップホップ]]、[[ビッグビート]]などといった多くの革新的音楽ジャンルも登場した。近年では[[エイミー・ワインハウス]]、[[マクフライ]]、[[コールドプレイ]]、[[スパイス・ガールズ]]らがポップシーンに名を馳せた。

# イギリスではロックやポップなどのポピュラー音楽が、国内だけでなく世界へ大きな市場を持つ主要な[[外貨]]獲得興業となっており、トニー・ブレア政権下などではクール・ブリタニアでロックミュージックに対する国策支援などが行われたりなど、その重要度は高い。アメリカ合衆国と共にカルチャーの本山として世界的な影響力を保ち続け、他国のポピュラー音楽産業の潮流への先駆性は、近年もいささかも揺るがない。

# ===映画===
# {{Main|イギリスの映画}}
# {{節stub}}

# ===コメディ===
# イギリス人はユーモアのセンスが高いと言われている。また、コメディアンの多くは高学歴である。
# *[[ローワン・アトキンソン]]
# *[[チャールズ・チャップリン]]
# *[[ピーター・セラーズ]]
# *[[モンティ・パイソン]]
# *[[リック・ウェイクマン]]　（但し、本職は[[ミュージシャン]]）

# ===国花===
# [[国花]]はそれぞれの地域が持っている。
# *イングランドは[[バラ]]
# *ウェールズは[[ラッパスイセン]]（[[スイセン]]の1種）。[[リーキ]]もより歴史のあるシンボルだが、リーキは花ではない。
# *北アイルランドは[[シャムロック]]
# *スコットランドは[[アザミ]]

# ===世界遺産===
# イギリス国内には、[[国際連合教育科学文化機関|ユネスコ]]の[[世界遺産]]リストに登録された文化遺産が21件、自然遺産が5件ある。詳細は、[[イギリスの世界遺産]]を参照。
# <gallery>
# ファイル:PalaceOfWestminsterAtNight.jpg|[[ウェストミンスター宮殿]]
# ファイル:Westminster Abbey - West Door.jpg|[[ウェストミンスター寺院]]
# ファイル:Edinburgh Cockburn St dsc06789.jpg|[[エディンバラ旧市街|エディンバラの旧市街]]・[[エディンバラ新市街|新市街]]
# ファイル:Canterbury Cathedral - Portal Nave Cross-spire.jpeg|[[カンタベリー大聖堂]]
# ファイル:Kew Gardens Palm House, London - July 2009.jpg|[[キューガーデン|キュー王立植物園]]
# ファイル:2005-06-27 - United Kingdom - England - London - Greenwich.jpg|[[グリニッジ|マリタイム・グリニッジ]]
# ファイル:Stonehenge2007 07 30.jpg|[[ストーンヘンジ]]
# ファイル:Yard2.jpg|[[ダラム城]]
# ファイル:Durham Kathedrale Nahaufnahme.jpg|[[ダラム大聖堂]]
# ファイル:Roman Baths in Bath Spa, England - July 2006.jpg|[[バース市街]]
# ファイル:Fountains Abbey view02 2005-08-27.jpg|[[ファウンテンズ修道院]]跡を含む[[スタッドリー王立公園]]
# ファイル:Blenheim Palace IMG 3673.JPG|[[ブレナム宮殿]]
# ファイル:Liverpool Pier Head by night.jpg|[[海商都市リヴァプール]]
# ファイル:Hadrian's Wall view near Greenhead.jpg|[[ローマ帝国の国境線]] ([[ハドリアヌスの長城]])
# ファイル:London Tower (1).JPG|[[ロンドン塔]]
# </gallery>

# ===祝祭日===
# 祝祭日は、イングランド、ウェールズ、スコットランド、北アイルランドの各政府により異なる場合がある。銀行をはじめ多くの企業が休みとなることから、国民の祝祭日をバンク・ホリデー({{interlang|en|Bank holiday}})（銀行休業日）と呼ぶ。
# {|class=wikitable
# !日付!!日本語表記!!現地語表記!!備考
# |-
# |[[1月1日]]||[[元日]]||{{lang|en|New Year's Day}}||[[移動祝日]]
# |-
# |[[1月2日]]||元日翌日||-||移動祝日、スコットランドのみ
# |-
# |[[3月17日]]||[[聖パトリックの祝日|聖パトリックの日]]||{{lang|en|St. Patrick's Day}}||北アイルランドのみ
# |-
# |3月 - 4月||[[聖金曜日]]||{{lang|en|Good Friday}}||移動祝日
# |-
# |3月 - 4月||[[復活祭]]月曜日||{{lang|en|Easter Monday}}||移動祝日
# |-
# |5月第1月曜日||[[五月祭]]||{{lang|en|Early May Bank Holiday}}||移動祝日
# |-
# |5月最終月曜日||五月祭終り||{{lang|en|Spring Bank Holiday}}||移動祝日
# |-
# |[[7月12日]]||[[ボイン川の戦い]]記念日||{{lang|en|Battle of the Boyne (Orangemen's Day)}}||北アイルランドのみ
# |-
# |8月第1月曜日||夏季銀行休業日||{{lang|en|Summer Bank Holiday}}||移動祝日、スコットランドのみ
# |-
# |8月最終月曜日||夏季銀行休業日||{{lang|en|Summer Bank Holiday}}||移動祝日、スコットランドを除く
# |-
# |[[12月25日]]||[[クリスマス]]||{{lang|en|Christmas Day}}||
# |-
# |[[12月26日]]||[[ボクシングデー]]||{{lang|en|Boxing Day}}||
# |}
# *聖金曜日を除く移動祝日は原則的に月曜日に設定されている。
# *ボクシングデー後の2日も銀行休業日であったが2005年を最後に廃止されている。

# ==スポーツ==
# [[ファイル:Wembley Stadium, illuminated.jpg|thumb|220px|[[ウェンブリー・スタジアム]]]]
# イギリスは[[サッカー]]、[[ラグビー]]、[[クリケット]]、[[ゴルフ]]、[[ボクシング]]など多くの競技が発祥もしくは近代スポーツとして整備された地域であり、国技としても定着している。年間観客動員数は4000万人以上を集めるサッカーが他を大きく凌いでおり、[[競馬]]の600万人、ユニオンラグビーの300万、クリケット200万がそれに続く。

# このうち団体球技（サッカー、ラグビー、クリケット）は発祥地域の伝統的な配慮から国際競技団体ではイギリス単体ではなく、イングランド、スコットランド、ウェールズ、北アイルランド（ラグビーに関しては[[アイルランド]]にまとめている）の4地域それぞれの加盟を認めているが、サッカーが公式なプログラムとして行われている[[近代オリンピック]]では単一国家としての出場が大原則であるため、長年出場していなかった。しかし[[2012年]]の開催が内定した[[ロンドンオリンピック (2012年)|ロンドン五輪]]では4協会が一体となった統一イギリス代表としてエントリーした。またイギリスの首都であるロンドンで[[夏季オリンピック]]を行ったのは、1948年以来64年ぶりである。ただし[[野球]]においては早くから[[野球イギリス代表|英国代表]]として、[[欧州野球選手権]]や[[ワールド・ベースボール・クラシック|WBC]]などに統一ナショナルチームを送り出している。

# ===サッカー===
# 数多くのスポーツを誕生させたイギリスでも取り分け人気なのが[[サッカー]]である。イギリスでサッカーは「'''フットボール'''」と呼び、近代的なルールを確立したことから「'''近代サッカーの母国'''」と呼ばれ、それぞれの地域に独自のサッカー協会がある。イギリス国内でそれぞれ独立した形でサッカーリーグを展開しており、中でもイングランドの[[プレミアリーグ]]は世界的に人気である。[[フットボール・アソシエーション|イングランドサッカー協会]] (FA) などを含むイギリス国内の地域協会は全て、[[国際サッカー連盟]] (FIFA) よりも早くに発足しており、FIFA加盟国では唯一特例で国内の地域単位での加盟を認められている(以降、FIFAは海外領土など一定の自治が行われている[[国際サッカー連盟|地域協会を認可]]している)。その為、FIFAや[[欧州サッカー連盟]]（UEFA）が主宰する各種国際大会（[[FIFAワールドカップ]]・[[UEFA欧州選手権]]・[[UEFAチャンピオンズリーグ]]・[[UEFAカップ]]・[[FIFA U-20ワールドカップ]]や[[UEFA U-21欧州選手権]]などの年代別国際大会）には地域協会単位でのクラブチームやナショナルチームを参加させており、さらには7人いるFIFA副会長の一人はこの英本土4協会から選ばれる、サッカーのルールや重要事項に関しては、FIFAと英本土4協会で構成する[[国際サッカー評議会]]が決定するなど特権的な地位が与えられている。また、サッカー選手や監督がプロ競技における傑出した実績によって一代限りの騎士や勲爵士となることがある（[[デビッド・ベッカム|デヴィッド・ベッカム]]、[[スティーヴン・ジェラード]]や[[ボビー・ロブソン]]、[[アレックス・ファーガソン]]など）。

# また、サッカーはもともとラグビーと同じく中流階級の師弟が通う[[パブリックスクール]]で近代競技として成立したが、その過程は労働者階級の娯楽として発展していった。ただ、当時のイギリスの継続的な不況からくる労働者階級の人口の割合と、それ以外の階級者も観戦していたということを注意しなければならない。労働者階級がラグビーよりもサッカーを好んでいたとされる理由として、[[フーリガン]]というあまり好ましくない暴力的なファンの存在が挙げられることもある。ただ、相次ぐフーリガン絡みの事件や事故を重く見た政府は1980年代にフーリガン規制法を制定し、スタジアムの大幅な安全基準の見直しなどを行った。現在では各スタジアムの試合運営スタッフがスタジアムの至る所に監視カメラを設置し、特定のサポーター（フーリガン）に対する厳重な監視や入場制限を行っている。そのような取り組みの結果、近年スタジアムではそれまで頻発していたフーリガン絡みの事件や事故の件数が大幅に減少した。
# *2007-2008シーズンにおけるイングランドサッカー入場者数<ref>2008年12月10日付けの日本経済新聞</ref>
# **[[プレミアリーグ|プレミアシップ]]　1370万8875人
# **[[フットボールリーグ・チャンピオンシップ|チャンピオンシップ]]　939万7036人
# **[[フットボールリーグ1]]　441万2023人
# **[[フットボールリーグ2]]　239万6278人
# **[[FAカップ]]　201万1320人
# **[[フットボールリーグカップ|リーグカップ]]　133万2841人
# **[[UEFAチャンピオンズ・リーグ|CL]]　122万0127人
# **UEFAカップ　46万2002人
# **総動員数　3494万人

# ===競馬===
# {{main|イギリスの競馬}}
# 近代競馬発祥の地でもある。18世紀ゴルフに次いでスポーツ組織として[[ジョッキークラブ]]が組織され、同時期に[[サラブレッド]]も成立した。どちらかと言えば[[平地競走]]よりも[[障害競走]]の方が盛んな国であり、"Favourite 100 Horses"（好きな馬100選）では[[アークル]]を初め障害馬が上位を独占した。障害の[[チェルトナムフェスティバル]]や[[グランドナショナルミーティング]]は15～25万人もの観客動員数がある。特に最大の競走であるG3[[グランドナショナル]]の売り上げは700億円近くになり、2007年現在世界で最も馬券を売り上げる競走になっている。平地競走は、[[ダービーステークス|ダービー]]、[[イギリス王室|王室]]開催の[[ロイヤルアスコット開催]]が知られ、こちらも14～25万人の観客を集める。ダービーは、この競走を冠した競走が競馬を行っている国には必ずと言っていい程存在しており世界で最も知られた競走といって良いだろう。エリザベス女王も競馬ファンとして知られており、自身何頭も競走馬を所有している。

# イギリスでは、日本などと違い競馬など特定の競技だけでなく全てのスポーツがギャンブルの対象となるが、売り上げはやはり競馬とサッカーが多い。競馬は1970年代を頂点に人気を失いつつあったが、近年急速に観客動員数が持ち直す傾向にある。売上高も2兆円を超え、人口当りの売り上げは香港を除けばオーストラリアに次ぐ。しかし、売り上げの多く（2003年で97.1%）が主催者側と関係のない[[ブックメーカー]]に占められるという構造的な課題がある。なお、イギリス人はどんな小さな植民地にも必ずと言っていい程競馬場を建設したため、現在でも旧イギリス領は競馬が盛んな国が多い。また、[[馬術]]も盛んであり、馬術のバドミントンは3日間で15万人以上の観客動員数がある。

# ===モータースポーツ===
# [[モータースポーツ]]発祥の地としても知られており、[[フォーミュラ1]]（F1）で多数のチャンピオンドライバーを生み出している他、歴史的には[[チーム・ロータス|ロータス]]、[[ティレル]]、現存するものとしては[[マクラーレン]]、[[ウィリアムズF1|ウィリアムズ]]といった、数多くの名門レーシングチームが本拠を置き、モータースポーツ車両の設計製造において常に最先端を行く。イベントにも歴史があり、1926年に初開催された[[イギリスグランプリ]]は最も古いグランプリレースのひとつであり、1950年にはこの年始まったF1の第1戦を[[シルバーストン]]サーキットで開催した。[[世界ラリー選手権]]の一戦として組み込まれているラリー・グレート・ブリテン（1933年初開催）も同シリーズの中でもっとも古いイベントの一つである。

# ==脚注==
# {{脚注ヘルプ}}
# {{Reflist}}

# ==関連項目==
# * [[イギリス関係記事の一覧]]
# * [[イギリスの銃規制]]
# * [[ジョン・ブル]]
# * [[ブリタニア (女神)]]

# ==外部リンク==
# {{Wiktionary}}
# {{Commons&cat|United Kingdom|United Kingdom}}
# ;本国政府
# *[http://www.royal.gov.uk/ 英国王室（The British Monarchy）] {{en icon}}
# **{{Facebook|TheBritishMonarchy|The British Monarchy}} {{en icon}}
# **{{Twitter|BritishMonarchy|BritishMonarchy}} {{en icon}}
# **{{Google+|+britishmonarchy|name=The British Monarchy}} {{en icon}}
# **{{flickr|photos/britishmonarchy/|The British Monarchy}} {{en icon}}
# **{{YouTube channel|TheRoyalChannel|The British Monarchy}} {{en icon}}
# *[http://www.direct.gov.uk/ 英国政府（GOV.UK）] {{en icon}}
# *[https://www.gov.uk/government/organisations/prime-ministers-office-10-downing-street 英国首相府（Prime Minister's Office, 10 Downing Street）] {{en icon}}
# **{{Facebook|10downingstreet|10 Downing Street}} {{en icon}}
# **{{Twitter|@Number10gov|UK Prime Minister}} {{en icon}}
# **{{Twitter|@Number10press|No.10 Press Office}} {{en icon}}
# **{{flickr|photos/number10gov|Number 10}} {{en icon}}
# **{{Pinterest|number10gov|UK Prime Minister}} {{en icon}}
# **{{YouTube channel|Number10gov|Number10gov|films and features from Downing Street and the British Prime Minister}} {{en icon}}
# **{{YouTube channel|DowningSt|Downing Street|archive footage from Downing Street and past British Prime Ministers}} {{en icon}}
# *[https://www.gov.uk/government/world/japan.ja UK and Japan (UK and the world - GOV.UK)] {{ja icon}}{{en icon}}
# **[https://www.gov.uk/government/world/organisations/british-embassy-tokyo.ja 駐日英国大使館（GOV.UK）] {{ja icon}}{{en icon}}
# ***{{Facebook|ukinjapan|British Embassy Tokyo}} {{ja icon}}{{en icon}}※使用言語は個々の投稿による
# ***{{Twitter|UKinJapan|BritishEmbassy英国大使館}} {{ja icon}}{{en icon}}※使用言語は個々の投稿による
# ***{{flickr|photos/uk-in-japan|UK in Japan- FCO}} {{en icon}}
# ***{{YouTube channel|UKinJapan|UKinJapan|British Embassy in Japan}} {{en icon}}
# *[https://www.gov.uk/government/organisations/uk-visas-and-immigration UK Visas and Immigration (GOV.UK)] {{en icon}}
# **[http://www.vfsglobal.co.uk/japan/Japanese/ 英国ビザ申請センター] - VFS Global Japan (上記「UK Visas and Immigration」日本地区取扱代行サイト) {{ja icon}}{{en icon}}
# ;日本政府内
# *[http://www.mofa.go.jp/mofaj/area/uk/ 日本外務省 - 英国] {{ja icon}}
# *[http://www.uk.emb-japan.go.jp/jp/index.html 在英国日本国大使館] {{ja icon}}
# ;観光
# *[http://www.visitbritain.com/ja/JP/ 英国政府観光庁（日本語版サイト）] {{ja icon}}
# ** {{Facebook|LoveGreatBritain|Love GREAT Britain}} {{en icon}}
# ;その他
# *[http://www.jetro.go.jp/world/europe/uk/ JETRO - 英国]

# {{イギリス関連の項目}}
# {{ヨーロッパ}}
# {{EU}}
# {{国連安全保障理事会理事国}}
# {{G8}}
# {{OECD}}
# {{イギリス連邦}}

# {{デフォルトソート:いきりす}}
# [[Category:イギリス|*]]
# [[Category:英連邦王国|*]]
# [[Category:G8加盟国]]
# [[Category:欧州連合加盟国]]
# [[Category:海洋国家]]
# [[Category:君主国]]
# [[Category:島国|くれいとふりてん]]
# [[Category:1801年に設立された州・地域]][Finished in 16.1s]