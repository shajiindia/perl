use strict;
use warnings;
use IO::File;

my $choice   = "";
my $filename = "data.dat";

until ( $choice =~ /q/ ) {

	$choice = options();

	if    ( $choice =~ /a/ ) { add_record(); }
	elsif ( $choice =~ /l/ ) { list_record(); }
	elsif ( $choice =~ /q/ ) { last; }
	else                     { print "Invalid choice. Please enter again.\n"; }
}

sub options {
	print '*' x 40, "\n";
	print "a - Add a record \n";
	print "l - List record \n";
	print "q - Quit \n";
	print '*' x 40, "\n";
	print "Enter a choice a, l, or q ==> ";
	chomp( my $choice = <STDIN> );
	return $choice;
}

sub add_record {
	my $fout = IO::File->new( $filename, 'a' ) or die "Cannot open file for append ($!)";
	$fout->seek( 0, 2 );
	print "Enter first name: ";
	chomp( my $firstname = <STDIN> );
	print "\nEnter last name: ";
	chomp( my $lastname = <STDIN> );
	print "\nPlease enter the organization: ";
	chomp( my $organization = <STDIN> );
	print "\nPlease enter the department: ";
	chomp( my $department = <STDIN> );
	print "\nEnter phone: ";
	chomp( my $phone = <STDIN> );
	my $record = pack "A25 A25 A30 A30 A15", $firstname, $lastname, $organization, $department, $phone;
	$fout->print($record);
	print "\n1 Record has been successfully added\n";
	$fout->close();
}

sub list_record {
	my ( $counter, $record, $record_number );
	$counter = 0;

	unless ( -e $filename ) {
		print '*' x 40, "\n";
		print "Data file missing. Please add records first and then select the 'l' option\n";
		print '*' x 40, "\n";
		return;
	}

	my $fin = IO::File->new( $filename, 'r' )
	  or die "Cannot open file for read ($!)";
	while ( my $n = $fin->read( $record, 125 ) ) {
		$counter++;
	}

	print '*' x 40, "\n";
	print "There are currently $counter records available\n";
	print "Which one will you choose: ";
	chomp( $record_number = <STDIN> );
	$fin->seek( ( $record_number - 1 ) * 125, 0 );
	my $n = $fin->read( $record, 125 );
	my ( $firstname, $lastname, $organization, $department, $phone ) = unpack "A25 A25 A30 A30 A15", $record;
	print '*' x 40, "\n";
	print "Showing Record $record_number\n";
	print "First name: $firstname\n";
	print "Last name: $lastname \n";
	print "Organization: $organization\n";
	print "Department: $department\n";
	print "Phone No: $phone \n";
	print '*' x 40, "\n";
	$fin->close();
}
