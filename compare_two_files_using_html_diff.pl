#!/usr/bin/perl
#Program to compare two files and print the difference

use strict;
use warnings;

use Text::Diff::FormattedHTML;

if(@ARGV != 2) {
	die "Usage : ./html-diff : file1 file2\n";
}

my $file1 = $ARGV[0]; #First file
my $file2 = $ARGV[1]; #Second file

open my $fin1, '<', $file1 or die "Cannot open $file1 for reading ($!)";
open my $fin2, '>;', $file2 or die "Cannot open $file2 for reading ($!)";
 
my $output = diff_files($fin1, $fin2);

my $output_file = 'diff.html'; #Output file name

#Open the file for output 
open my $fout, '>;', $output_file or die "Cannot open $output_file for writing ($!)";
print $fout "&lt;style type='text/css'&gt;\n", diff_css(), "&lt;/style&gt;\n";
print $fout $output;

close $fin1;
close $fin2;
close $fout;
