use strict;
use warnings;

use File::Find::Rule;
use File::Slurp qw/edit_file_lines/;

my $searchdir     = "/home/shaji/Documents";
my $search_string = q|Bobby Bigtime|;

# File::Find::Rule is a friendlier interface to File::Find. It allows you
# to build rules which specify the desired files and directories.

my @txtfiles = find( file => name => '*.txt' => in => $searchdir );

for my $file (@txtfiles) {
	print "Found : $file\n";

	# These subs read in a file into $_, execute a code block which should
	# modify $_ and then write $_ back to the file. With "edit_file_lines"
	# each line is read into $_ and the code is called for each line and
	# desired and it will be written back out.

	edit_file_lines {

		if (/$search_string/) {

			# replace the search string with empty string
			$_ = "";
			print "Match found. Replaced pattern...\n";
		}

	}
	$file;
}
