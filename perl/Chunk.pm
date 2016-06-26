package Chunk;
use utf8;


# コンストラクタ
sub new {
	my $this = bless {};
	$this->init();
	return $this;
}

# initialize
sub init {
	my $this = shift;
	my @array1 = ();
	my @array2 = ();
	%{$this} = (num      => undef,    # 文節番号
				morphs   => \@array1, # 形態素リスト
				text     => undef,    # テキスト(表層)
				dst      => undef,    # 係り先文節番号
				srcs     => \@array2, # 係り元文節番号
				head_wrd => undef,    # 主辞の単語
				head_pos => undef);   # 主辞の品詞
}

#---------------------------------------------------#
#          係り受け解析結果の情報を追加             #
#---------------------------------------------------#
sub setChunk {
	my $this = shift;
	my ($num, $morph, $text, $dst, $srcs, $head_wrd, $head_pos) = @_;
	%{$this} = (num      => $num,
				text     => $text,
				dst      => $dst,
				head_wrd => $head_wrd,
				head_pos => $head_pos);
	push(@{$this{morphs}}, $morph);
	push(@{$this{srcs}}, $srcs);
}

#---------------------------------------------------#
#        文節内の特定の形態素の有無を返す           #
#---------------------------------------------------#
sub existsMorph {

	my ($this, $key, $val) = @_;

	foreach my $morph (@{$this->{morphs}}) {
		return 1 if $morph->{$key} eq $val;
	}
	return 0;
}

#---------------------------------------------------#
#            文節内の特定の形態素を返す             #
#---------------------------------------------------#
sub searchMorph {
	my ($this, $key, $val) = @_;

	foreach my $morph (@{$this->{morphs}}) {
		return $morph->{base} if $morph->{$key} eq $val;
	}
	return 0;
}

#---------------------------------------------------#
#        節内の特定の形態素を返す(逆順検索)         #
#---------------------------------------------------#
sub searchMorphReverse {
	my ($this, $key, $val) = @_;

	foreach my $morph (reverse @{$this->{morphs}}) {
		return $morph->{base} if $morph->{$key} eq $val;
	}
	return 0;
}

#---------------------------------------------------#
#   文節内の名詞を記号(X,Y)に置換した文字列を返す   #
#---------------------------------------------------#
sub replaceNounToSymbol {
	my ($this, $symbol) = @_;

	my $text = '';
	foreach my $morph (@{$this->{morphs}}) {
		$text .= $morph->{pos} eq '名詞' ? $symbol : $morph->{surface};
	}
	$text =~ s/$symbol{2,}/$symbol/g;
	return $text;
}

1;