use strict;
use warnings;

my @matrix = (
	[qw/tendulkar dhoni raina/],
	[qw/sangakara muralidharan silva/],
	[qw/botham peterson williams/],
);

#insert West Indies Team as a first row
my @row = qw/walsh ambrose lara/;

unshift @matrix, \@row;

#print the matrix
print map { join '|', @$_, "\n" } @matrix;
