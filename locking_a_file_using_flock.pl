use strict;
use warnings;

use constant LOCK_SH => 1;    # Shared lock (for reading)
use constant LOCK_EX => 2;    # Exclusive lock (for writing)
use constant LOCK_NB => 4;    # Non-blocking request (don't stall)
use constant LOCK_UN => 8;    # Free the lock (careful!)

my @team     = qw/border boon botham tendulkar dhoni sehwag lara richards/;
my $filename = 'data.txt';

open my $fh, '>>', $filename or die "Cannot open file ($!)";
print "Locking file $filename\n";
flock $fh, LOCK_EX | LOCK_NB;
print "Locked\n";
foreach my $player (@team) {
	print $fh "$player\n";
	sleep 1;
}
print "Unlocking $filename\n";
flock $fh, LOCK_UN;
print "Unlocked\n";
close $fh;
