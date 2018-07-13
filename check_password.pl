use 5.010;
use strict;
use warnings;
use Term::ReadKey;

say "Please enter your password: ";
ReadMode 'noecho';
chomp(my $password = ReadLine 0);
ReadMode 'normal';
say "";
my ($username, $encrypted) = ( getpwuid $< )[0,1];
(crypt($password, $encrypted) eq $encrypted)? say "Welcome to the programming world" : die "Sorry invalid password, please try again!";	
