package Chunk;

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

1;