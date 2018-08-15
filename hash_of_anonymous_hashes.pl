use 5.010;
use strict;
use warnings;

my %team = (
	India     => { Tendulkar => 100, Dhoni => 98 },
	Australia => { Border    => 87,  Boon  => 120 }
);

say "In Border Gavaskar Cup, Tendulkar scored : ",
  $team{India}->{Tendulkar};
