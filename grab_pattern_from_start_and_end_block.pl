use strict;
use warnings;

use subs qw/get_single_record/;

my $start = '^EMPL-START$';    #Start pattern
my $end   = '^EMPL-END$';      #End pattern

while ( my @record = get_single_record( *DATA, $start, $end ) ) {
	chomp @record;
	print join ',', @record;
	print "\n";

	#You can use say instead if your are on version 5.10 and higher
}

sub get_single_record {
	my $file  = shift;         #Get the file to read
	my $start = shift;         #Get the start pattern
	my $end   = shift;         #Get the end pattern
	my @record;
	while (<$file>) {
		if ( /$start/ ... /$end/ ) {

			#Skip the start and end lines
			push @record, $_ unless ( /$start/ || /$end/ );

			#Exit on $end; as we are done with one record
			last if /$end/;
		}
	}
	return @record;
}

__DATA__
EMPL-START
NAME:Jack
LOCATION:New York
DEPARTMENT:Marketing
TYPE:Regular
EMPL-END
EMPL-START
NAME:John
LOCATION:London
DEPARTMENT:Development
TYPE:Contract
EMPL-END
EMPL-START
NAME:Bob
LOCATION:Washington
DEPARTMENT:Research
TYPE:Part-time
EMPL-END	
