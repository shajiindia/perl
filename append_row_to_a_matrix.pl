use strict;
use warnings;

my @matrix = ( [ qw/tendulkar dhoni raina/ ], [ qw/sangakara muralidharan silva/ ], [ qw/botham peterson williams/ ], );

#append West Indies Team as a first row
my @row = qw/walsh ambrose lara/;

push @matrix, \@row;

#print the matrix
print map { join '|', @$_, "\n" } @matrix;
