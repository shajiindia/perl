use 5.010;
use strict;
use warnings;

#Retrieve 2nd column

#Runs scored in ODI,Test and Match Number
my @runs = ( 
              [ 97, 215, 1 ],
              [ 88, 345, 4 ],
              [ 43, 198, 7 ],
              [ 22, 201, 3 ],
           ); 

my $column = 1;
say join ',', map $_->[$column], @runs;
