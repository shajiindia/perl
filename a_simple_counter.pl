use 5.010;
use warnings;
use autodie;

my $counter_file = "counter.dat";

my $counter = 0;

if(-f $counter_file) {
    open $fin, '<', $counter_file;
    $counter = <$fin>;
    chomp $counter;
    close $fin;
}

++$counter;

if($counter == 1) {
    say "Welcome, You are running this file for the first time";
}else{
    say "Welcome back, You are running this file $counter times";
}

open $fout, '>', $counter_file;
print $fout $counter;
close $fout;
