;#####################
;# perl Library LIB
;#####################
package LIB;

# *******************************************************************
# 単語Nグラムを返す (No.05, 06)
#
# $param  N, List
# $return 単語N-gram
# *******************************************************************
sub getWordNgram {
	my ($n, $array) = @_;
	my @ngram = ();
	for(my $i = 0; $i < $#{$array} + 2 - $n; $i++) {
		my $hoge = '';
		$hoge .= $array->[$i + $_] for (0..$n-1);
		push(@ngram, $hoge);
	}
	return @ngram;
}

# *******************************************************************
# 文字Nグラムを返す(No.05, 06)
#
# $param  N, List
# $return 文字N-gram
# *******************************************************************
sub getCharNgram {
	my ($n, $array) = @_;
	my @ngram = ();
	my @char = split('', join('', @{$array}));
	for(my $i = 0; $i < $#char + 2 - $n; $i++) {
		my $hoge = '';
		$hoge .= $char[$i + $_] for (0..$n-1);
		push(@ngram, $hoge);
	}
	return @ngram;
}


1; # omazinai
