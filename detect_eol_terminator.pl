use strict;
use warnings;

unless ( @ARGV == 1 ) {
	die "Usage : $0 <filename>\n";
}

my $file = shift;
my $fin = IO::File->new( $file, 'r' ) or die "Cannot open file for read ($!)";
$fin->binmode(":raw");

my $content;
{
	local $/;
	$content = <$fin>;
}

my $cr   = $content =~ tr/\r/\r/;
my $lf   = $content =~ tr/\n/\n/;
my $crlf = $content =~ s/\r\n/\r\n/g;

#other alternatives (Suggested by Dr.Ruud)
#If you want a count of a certain single character
#within a string, you can use the "tr///" function
#my $cr = $content =~ tr/\r//;
#my $lf = $content =~ tr/\n//;
#This is fine if you are just looking for a single
#character. However, if you are trying to count
#multiple character substrings within a larger
#string, "tr///" won't work.So the solution is
#to use global match in list context, then assigns
#the result to a scalar, producing a count of the
#number of matches.
#my $crlf =()= $content =~ /\r\n/g;

#debugging info
#print "CR : $cr\tLF : $lf\tCRLF : $crlf";

$fin->close();

$cr -= $crlf;
$lf -= $crlf;

if ( ( $cr == 0 ) && ( $lf == 0 ) && ( $crlf != 0 ) ) {
	print "DOS/Windows";

	#Do Something
}
elsif ( ( $cr == 0 ) && ( $lf != 0 ) && ( $crlf == 0 ) ) {
	print "Unix/Linux";

	#Do Something
}
elsif ( ( $cr != 0 ) && ( $lf == 0 ) && ( $crlf == 0 ) ) {
	print "Mac";

	#Do Something
}
else {
	print "Binary file";

	#Do Something
}
