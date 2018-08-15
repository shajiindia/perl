#!/usr/bin/perl
use strict;
use warnings;

use Text::CSV;
my $csv = Text::CSV->new( { sep_char => ',', binary => 1, auto_diag => 1  } );

my $project_code = "RMS";
my $count;
while (my $row = <DATA>) {
    chomp $row;
    next if($row =~ /^#/); #Skip if row starts with a comment
    #Parse will break if line contains unmatched quotes
    if ( $csv->parse($row) ) {
        my @fields = $csv->fields();
        #Check if any fields contains $project_code (i.e 'RMS')
        #Grep in scalar context returns number of times $project_code is found
        $count = grep /\b$project_code\b/, @fields;
        if($count >= 2) {
            print "Found project code[$project_code] more than once in the row [$row]\n";
        }                 
    } else {
        warn "Problem parsing $row\n";
    }
}

#A sample Employee CSV file (Name,Employee Code,Email,Department,Location,Project Code)
__DATA__
#Asia
Jack,980444,jack@example.com,Research,Bangalore,RMS
#Australia
Mathews,876598,mathews@example.com,Marketing,Sydney,RMSCD
#Europe
Peter,765478,peter@example.com,Development,London,RMS
#America
June,654367,june@example.com,Support,Redmond,UBC
John,785421,john@example.com,Marketing,Detroit,NBUX
Marty,776667,marty@example.com,RMS,California,RMS	
