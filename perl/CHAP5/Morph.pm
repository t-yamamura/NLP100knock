package Morph;

# コンストラクタ
sub new {
	my $this = bless {};
	$this->init();
	return $this;
}

# initialize
sub init {
	my $this = shift;
	%{$this} = (surface => '',  # 表層形
				base    => '',  # 基本形
				pos     => '',  # 品詞
				pos1    => ''); # 品詞細分類1
}

sub setMorph {
	my $this = shift;
	%{$this} = (surface => shift,
				base    => shift,
				pos     => shift,
				pos1    => shift);
}
1;