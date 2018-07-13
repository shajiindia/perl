use strict;
use warnings;
use subs qw/checkhash/;

my %cell = (
                aabbcc => "xxyyzz",
                abcabc => "xyzxyz",
                aaabbb => "xxxyyy",
                aaaccc => "xxxzzz"              
            );
              
my $pattern = "aaaccc";

#If you use version 5.10 or above, Replace next line with this smart matching 'if($pattern ~~ %cell)'
if(checkhash(\%cell,$pattern)) {
	print "Pattern Found\n";
} else {
	print "Pattern Not Found\n";
}

sub checkhash {
	#Get the hash i.e %cell
	my $hash = shift;
	#Get the pattern
	my $pattern = shift;
	#This flag indicates whether a pattern is found or not. 0 for not found and 1 for found
	my $flag = 0;
	foreach my $key (keys %$hash) {
		#Check if it matches pattern. Continue if not found. Set flag to 1 when found
		next unless $key =~ /$pattern/;
		#Key found so set the flag to 1
		$flag = 1;
		#Terminate the loop
		last;        
	}
	#Return result. 0 when not found and 1 on found
	return $flag;
}	 
