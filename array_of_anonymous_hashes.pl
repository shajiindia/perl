use 5.010;
use strict;
use warnings;

my @team = (
              {
                  Name  => "Tendulkar",
                  Style => "Batsman",
              },
              {
                  Name  => "Dhoni",
                  Style => "Wicket Keeper"
              }	 
           );

say "Number of elements in the array: ", $#team + 1;

say '-' x 60;
for(my $i = 0; $i <= $#team; $i++) {
    say $team[$i]->{Name}, " : ", $team[$i]->{Style};
}							   
say '-' x 60;
