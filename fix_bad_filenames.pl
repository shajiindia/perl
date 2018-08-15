use 5.010;
use strict;
use warnings;

foreach my $file_name (@ARGV) {

	# Compute the new name
	my $new_name = $file_name;

	#change the following characters
	$new_name =~ s/[ \t]/_/g;
	$new_name =~ s/[\(\)\[\]<>]/x/g;
	$new_name =~ s/[\'\`]/=/g;
	$new_name =~ s/\&/_and_/g;
	$new_name =~ s/\$/_dol_/g;
	$new_name =~ s/;/:/g;

	# Make sure the names are different
	if ( $file_name ne $new_name ) {

		# If a file already exists by that name
		# compute a new name.
		if ( -f $new_name ) {
			my $ext = 0;

			while ( -f $new_name . "." . $ext ) {
				$ext++;
			}

			$new_name = $new_name . "." . $ext;
		}
		say "$file_name -> $new_name\n";
		rename( $file_name, $new_name );
	}
}
