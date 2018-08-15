use strict;
use warnings;
use Hash::Merge qw/merge/;
use Data::Dumper;

my %team1 = (
	player => {
		name  => 'Tendulkar',
		genre => 'Batsman',
	}
);

my %team2 = (
	player => {
		age           => '39',
		country       => 'India',
		nickname      => 'God of Cricket',
		test_hundreds => '51',
		odi_hundreds  => '49'
	}
);

my %merged = %{ merge( \%team1, \%team2 ) };

print Dumper \%merged;
