use 5.010;
use strict;
use warnings;

my %country = (
	India     => [ 108, 120, 178 ],
	Pakistan  => [ 112, 167, 135 ],
	Australia => [ 123, 176, 118 ]
);

say "India's score in game three : ",       $country{India}->[2];
say "All of the Australia's scores are : ", join ',',
  @{ $country{Australia} };
