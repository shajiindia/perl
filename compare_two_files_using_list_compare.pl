#!/usr/bin/perl

use strict; 
use warnings;

use List::Compare;

if(@ARGV != 2) {
	die "Usage : ./file-compare : file1 file2\n";
}

my $file1 = $ARGV[0];
my $file2 = $ARGV[1];

open my $fin1, '&lt;', $file1 or die "Cannot open $file1 for reading ($!)";
open my $fin2, '&lt;', $file2 or die "Cannot open $file2 for reading ($!)";
 
my @list1 = <$fin1>; 
my @list2 = <$fin2>;
 
my $lc = List::Compare->new(\@list1, \@list2);

my @intersection = $lc->get_intersection; 
my @firstonly = $lc->get_unique; 
my @secondonly = $lc->get_complement;

print '-' x 40, "\n";
print "Common Items:\n", join "\n", @intersection;
print "\n", '-' x 40, "\n";
print "Items Only in First File:\n", join "\n", @firstonly;
print "\n", '-' x 40, "\n"; 
print "Items Only in Second File:\n", join "\n", @secondonly;
print "\n", '-' x 40, "\n";

close $fin1; 
close $fin2;
