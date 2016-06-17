# 24. ファイル参照の抽出
# 記事から参照されているメディアファイルをすべて抜き出せ．

use strict;
use warnings;
use lib "..";
use LIB;
use utf8;
binmode STDOUT, ':encoding(utf-8)';

# 入力 (titleがイギリスの記事を1行毎にリスト化)
my @text = split /\n/, &LIB::getTextFromWiki("../../data/jawiki-country.json", "イギリス");

# 記事中のメディアファイルを出力
# $_ => 正規表現にマッチする行
# $2 => メディアファイル (.+?)に該当
$_ =~ /(File|ファイル):(.+?)\|/ ? print $2 . "\n" : next foreach @text;


# **************
#    実行結果
# **************
# Royal Coat of Arms of the United Kingdom.svg
# Battle of Waterloo 1815.PNG
# The British Empire.png
# Uk topo en.jpg
# BenNevis2005.jpg
# Elizabeth II greets NASA GSFC employees, May 8, 2007 edit.jpg
# Palace of Westminster, London - Feb 2007.jpg
# David Cameron and Barack Obama at the G20 Summit in Toronto.jpg
# Soldiers Trooping the Colour, 16th June 2007.jpg
# Scotland Parliament Holyrood.jpg
# London.bankofengland.arp.jpg
# City of London skyline from London City Hall - Oct 2008.jpg
# Oil platform in the North SeaPros.jpg
# Eurostar at St Pancras Jan 2008.jpg
# Heathrow T5.jpg
# Anglospeak.svg
# CHANDOS3.jpg
# The Fabs.JPG
# PalaceOfWestminsterAtNight.jpg
# Westminster Abbey - West Door.jpg
# Edinburgh Cockburn St dsc06789.jpg
# Canterbury Cathedral - Portal Nave Cross-spire.jpeg
# Kew Gardens Palm House, London - July 2009.jpg
# 2005-06-27 - United Kingdom - England - London - Greenwich.jpg
# Stonehenge2007 07 30.jpg
# Yard2.jpg
# Durham Kathedrale Nahaufnahme.jpg
# Roman Baths in Bath Spa, England - July 2006.jpg
# Fountains Abbey view02 2005-08-27.jpg
# Blenheim Palace IMG 3673.JPG
# Liverpool Pier Head by night.jpg
# Hadrian's Wall view near Greenhead.jpg
# London Tower (1).JPG
# Wembley Stadium, illuminated.jpg
# [Finished in 16.6s]