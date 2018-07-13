#Game of chance: One of the most popular games of chance is a dice game
#known as craps, which is played in casinos and back alleys throughout
#the world. The rules of the game are straightforward:

#A player rolls two dice. Each die has six faces. These faces contain
#one, two, three, four, five and six spots, respectively.
#After the dice have come to rest, the sum of the spots on the two upward faces
#is calcuated. If the sum is 7 or 11 on the first throw, the  player wins.
#If the sum is 2,3 or 12 on the first throw (called "craps"),
#the player loses (i.e the "house" wins). 
#If the sum is 4,5,6,8,9 or 10 on the first throw, that sum becomes
#the player's "point." To win, you must continue rolling the dice until
# you "make your point" (i.e roll your point value).
#You lose by rolling a 7 before making a point.

use strict;
use warnings;

#Constants used in the game

use constant TRUE  => 1;
use constant FALSE => 0;

#Variables used to test the state of the game
my $WON              = 0;
my $LOST             = 1;
my $CONTINUE_ROLLING = 2;

#Other variables used in the program
my $first_roll  = 1;                    #true if current roll is first
my $sum_of_dice = 0;                    #sum of the dice
my $my_point    = 0;                    #point if no win/loss on first roll
my $game_status = $CONTINUE_ROLLING;    #game not over yet

#process one roll of the dice
sub play {

	if ($first_roll) {  #First roll of the dice
		$sum_of_dice = roll_dice();

		if ( $sum_of_dice == 7 || $sum_of_dice == 11 ) {

			#Win on first roll
			$game_status = $WON;
		}
		elsif ( $sum_of_dice == 2 || $sum_of_dice == 3 || $sum_of_dice == 12 ) {

			#Lose on first roll
			$game_status = $LOST;
		}
		else {

			#Remember point
			$game_status = $CONTINUE_ROLLING;
			$my_point    = $sum_of_dice;
			$first_roll  = FALSE;
		}
	}
	else {
		$sum_of_dice = roll_dice();

		if ( $sum_of_dice == $my_point ) {

			#Win by making point
			$game_status = $WON;
		}
		elsif ( $sum_of_dice == 7 ) {

			#Lose by rolling 7
			$game_status = $LOST;
		}
	}

	if ( $game_status == $CONTINUE_ROLLING ) {
		print "Roll again\n";
	}
	else {
		if ( $game_status == $WON ) {
			print "Player wins.";
			exit 0;
		}
		else {
			print "Player loses.";
			exit 0;
		}

		$first_roll = TRUE;
	}
}    #End subroutine play

#Roll the dice

sub roll_dice {
	my $die1;
	my $die2;
	my $work_sum;

	$die1 = 1 + int rand 6;
	$die2 = 1 + int rand 6;

	$work_sum = $die1 + $die2;

	print "Die 1 : $die1\n";
	print "Die 2 : $die2\n";
	print "Work Sum : $work_sum\n";

	return $work_sum;
}

while (1) {
	play();
}		
