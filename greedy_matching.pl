use 5.010;
use strict;
use warnings;

#Greedy matching
while (<DATA>) {
	if (/Betty (.*) butter/) {
		say $1;
	}
}

__DATA__
Betty bought some butter the butter was bitter so she bought some better butter to make the bitter butter better.
