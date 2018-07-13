use 5.010;
use strict;
use warnings;

my $players = [
                {
                    name => "tendulkar",
                    country => "india",
                    style => "batsman"
                },
                {
                    name => "richards",
                    country => "wi",
                    style => "batsman"
                },
                {
                    name => "border",
                    country => "australia",
                    style => "batsman"
                }
              ];

push @$players, {name => "imran", country => "pakistan", style => "allrounder"};			  

#Note that each item stored in control variable (i.e $player is an anonymous hash)
foreach my $player (@$players) {
	foreach my $key(sort keys %$player) {
        say "$key : $player->{$key}";
    }
    say "";
}
