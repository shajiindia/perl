use strict;
use warnings;
use 5.010;

my ( $total, $valid, $invalid, %invalid_count, %count );

while (<DATA>) {
	foreach (split) {
		$total++;
		if (/\W/) {
			$invalid++;
			$invalid_count{$_}++;
		}
		else {
			$valid++;
			$count{$_}++;
		}
	}
}

say '*' x 60;
say "Total Words : $total";
say "Valid Words : $valid";
say "Invalid Words : $invalid";
say '*' x 60;
foreach my $word ( keys %count ) {
	say "[$word] was found $count{$word} times.";
}
say '*' x 60;
foreach my $word ( keys %invalid_count ) {
	say "[$word] was found $invalid_count{$word} times.";
}
say '*' x 60;

__DATA__
GETTING HELP

The perldoc program gives you access to all the documentation that comes with Perl.
You can get more documentation, tutorials and community support online at http://www.perl.org/.

If you're new to Perl, you should start by running perldoc perlintro,
which is a general intro for beginners and provides some background to help you navigate the 
rest of Perl's extensive documentation. Run perldoc perldoc to learn more things you can do with perldoc.

For ease of access, the Perl manual has been split up into several sections	 
