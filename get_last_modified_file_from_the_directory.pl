use strict;
use warnings;

use File::Spec;

my $dir;
if ( @ARGV == 0 ) {
	$dir = 'C:/demo/';    #default directory
}
else {
	$dir = shift @ARGV;
}

opendir my $dh, $dir or die "Could not open $dir: $!";
my ( $last_modified_filename, $last_modified_time );

while ( defined( my $file = readdir($dh) ) ) {
	my $path = File::Spec->catfile( $dir, $file );
	next if -d $path;     # skip directories
	if ( not defined $last_modified_time or -M $path < $last_modified_time ) {
		( $last_modified_filename, $last_modified_time ) = ( $file, -M _ );
	}
}

print "Last modified file is $last_modified_filename\n";
