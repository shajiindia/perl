use strict;
use warnings;

my @my_array = qw (one two one two three six three four two six eight eight nine);
my @unique_items = ();

foreach my $item (@my_array) {

    #grep in scalar context returns how many times $item is found in the @my_array
	  my $count = grep $item eq $_, @my_array;

    #Add to array '@unique_items' only if $count is 1. This means ignore duplicates
	  push @unique_items, $item if $count == 1;
}

#print the unique items
print join ',', @unique_items;
