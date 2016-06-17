# 29. 国旗画像のURLを取得する
# テンプレートの内容を利用し，国旗画像のURLを取得せよ．
# （ヒント: MediaWiki API(https://www.mediawiki.org/wiki/API:Main_page/ja)の
#  imageinfo(https://www.mediawiki.org/wiki/API:Properties/ja#imageinfo_.2F_ii)を呼び出して，ファイル参照をURLに変換すればよい）

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
use URI;
use JSON;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
use Data::Dumper;
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
		$hash{$field} = $val;
	}
}

print &getImageUrl($hash{"国旗画像"});



# *******************************************************************
# ファイル参照をURLに変換した結果を返す(MediaWiki APIのimageinfoを利用)
#
# $param	ファイル
# $return	URL
# *******************************************************************
sub getImageUrl {

	# 引数受け取り
	my ($file) = @_;

	# URLとパラメータの設定
	my $uri = URI->new('http://en.wikipedia.org/w/api.php');
	my $params = {
		action => 'query',
		titles => "File:" . $file,
		prop   => "imageinfo",
		format => "json",
		iiprop => "url"};
	$uri->query_form(%$params);

	my $ua = LWP::UserAgent->new();

	# プロキシの設定
	$ua->env_proxy; # 環境変数から取得
	# $ua->proxy("http", "http://proxy:ポート番号/"); # 直接指定するならこんな感じ

	my $req = HTTP::Request->new('POST' => $uri);
	my $res = $ua->request($req);
	die "Error: " . $res->status_line if $res->is_error; # リクエストに失敗したらエラー

	# リクエスト結果をjsonにデコード
	my $json_data = $res->content;
	my $ref = JSON->new()->decode($json_data);

	# ファイル構造はDumperで確認
	# print Dumper $ref;

	# ファイルのURLを返す
	return $ref->{query}->{pages}->{23473560}->{imageinfo}->[0]->{url};
}



# **************
#    実行結果
# **************
# http://upload.wikimedia.org/wikipedia/en/a/ae/Flag_of_the_United_Kingdom.svg[Finished in 18.8s]