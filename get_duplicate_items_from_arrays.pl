use strict;
use warnings;

my @countries = qw(India Norway Sweden India Switzerland Australia Sweden USA India Australia UK);
my %duplicates;

foreach my $item (@countries) {

    #grep in scalar context returns how many times $item is found in @countries
    my $count = grep { $item eq $_ } @countries;

    #Add to %duplicates hash only if $count is 1. This means ignore unique items
    $duplicates{$item}++ if $count >= 2;
}

#print the duplicate items
print join "\n", keys %duplicates;
