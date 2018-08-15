use warnings;
use strict;

use Scalar::Util qw(looks_like_number);

my @words =
  qw/9 8.76  dhoni 0.00981 raina 0.000000001 1cd 2.8e12 55apples oranges65 0xff 0377 0b11111111/;

foreach my $val (@words) {
	print "$val is", looks_like_number($val) ? '' : ' not', " a number\n";
}
