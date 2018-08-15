use strict;
use warnings;

my @matrix = (
	[qw/tendulkar dhoni raina/],
	[qw/sangakara muralidharan silva/],
	[qw/botham peterson williams/],
);

#insert West Indies Team as first column
my @column = qw/walsh ambrose lara/;

for ( my $i = 0 ; $i <= $#matrix ; $i++ ) {
	unshift @{ $matrix[$i] }, $column[$i];
}
#print the matrix
print map { join '|', @$_, "\n" } @matrix;
