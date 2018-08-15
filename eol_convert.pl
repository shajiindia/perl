use 5.010;
no warnings;

sub usage() {
	die "Usage $0 <unix|linux|mac|dos|windows|apple>";
}

binmode STDIN;
binmode STDOUT;

my $eol = "\n";

given ( $ARGV[0] ) {
	when ('linux')   { $eol = "\n"; }
	when ('unix')    { $eol = "\n"; }
	when ('windows') { $eol = "\r\n"; }
	when ('dos')     { $eol = "\r\n"; }
	when ('mac')     { $eol = "\r"; }
	when ('apple')   { $eol = "\r"; }
	default          { usage(); }
}

while (1) {
	my $ch = getc;

	unless ( defined $ch ) {
		last;
	}

	if ( $ch eq "\n" ) {
		print STDOUT $eol;
		next;
	}

	if ( $ch eq "\r" ) {
		my $next_ch = getc;

		unless ( defined $next_ch ) {
			print STDOUT $eol;
			last;
		}

		if ( $next_ch eq "\n" ) {
			print STDOUT $eol;
			next;
		}

		print STDOUT $eol;
		$ch = $next_ch;
	}

	print STDOUT $ch;
}
