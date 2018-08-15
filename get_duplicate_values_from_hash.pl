use strict;
use warnings;

my %team = (
	india      => 245,
	england    => 212,
	pakistan   => 212,
	australia  => 245,
	srilanka   => 222,
	bangladesh => 178,
	kenya      => 212,
	newzealand => 225
);

my %count;
for ( values %team ) {
	$count{$_}++;
}

for my $key ( keys %count ) {
	print "$key found $count{$key} times\n" if $count{$key} >= 2;
}
