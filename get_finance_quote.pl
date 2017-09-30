#!/usr/bin/perl

########################################################################
#This is free and unencumbered software released into the public domain.
########################################################################

use strict;
use warnings;

# Import module
use Finance::Quote;

# Get the quote engine
my $quote = Finance::Quote->new;

# Set the timeout
$quote->timeout(60);

# Define the symbol
my @company = qw/MSFT IBM GOOG WIT INFY/;

# Get the data
my %data = $quote->fetch( 'usa', @company );

# Loop through the data
foreach my $stock (@company) {
	my $price = $data{ $stock, "price" };

	unless ( defined($price) ) {
		print "No information on $stock\n";
		next;
	}

	my $company_name         = $data{ $stock, "name" };
	my $last_price           = $data{ $stock, "last" };
	my $day_range            = $data{ $stock, "day_range" };
	my $year_range           = $data{ $stock, "year_range" };
	my $highest_trade_today  = $data{ $stock, "high" };
	my $lowest_trade_today   = $data{ $stock, "low" };
	my $last_trade_date      = $data{ $stock, "date" };
	my $last_trade_time      = $data{ $stock, "time" };
	my $volume               = $data{ $stock, "volume" };
	my $average_daily_volume = $data{ $stock, "avg_vol" };
	my $bid                  = $data{ $stock, "bid" };
	my $ask                  = $data{ $stock, "ask" };
	my $close                = $data{ $stock, "close" };
	my $open                 = $data{ $stock, "open" };
	my $earnings_per_share   = $data{ $stock, "eps" };
	my $p_by_e_ratio         = $data{ $stock, "pe" };

	$company_name         = defined($company_name) ? $company_name : "--NA--";
	$last_price           = defined($last_price)   ? $last_price   : "--NA--";
	$day_range            = defined($day_range)    ? $day_range    : "--NA--";
	$year_range           = defined($year_range)   ? $year_range   : "--NA--";
	$highest_trade_today  = defined($highest_trade_today) ? $highest_trade_today : "--NA--";
	$lowest_trade_today   = defined($lowest_trade_today) ? $lowest_trade_today : "--NA--";
	$last_trade_date      = defined($last_trade_date) ? $last_trade_date : "--NA--";
	$last_trade_time      = defined($last_trade_time) ? $last_trade_time : "--NA--";
	$volume               = defined($volume)          ? $volume          : "--NA--";
	$average_daily_volume = defined($average_daily_volume) ? $average_daily_volume : "--NA--";
	$bid                  = defined($bid)   ? $bid   : "--NA--";
	$ask                  = defined($ask)   ? $ask   : "--NA--";
	$close                = defined($close) ? $close : "--NA--";
	$open                 = defined($open)  ? $open  : "--NA--";
	$earnings_per_share   = defined($earnings_per_share) ? $earnings_per_share : "--NA--";
	$p_by_e_ratio         = defined($p_by_e_ratio) ? $p_by_e_ratio : "--NA--";

	# Print the data
	print '*' x 40, "\n";
	print "Company Name : $company_name\n";
	print "Stock : $stock\n";
	print "Day Range: $day_range\n";
	print "Year Range: $year_range\n";
	print "Volume: $volume\n";
	print "Average Daily Volume: $average_daily_volume\n";
	print "Earnings Per Share: $earnings_per_share\n";
	print "Last Trade Date: $last_trade_date\n";
	print "Last Trade Time: $last_trade_time\n";
	print "Bid: $bid\n";
	print "Ask: $ask\n";
	print "Close: $close\n";
	print "P/E Ratio: $p_by_e_ratio\n";
	print '*' x 40, "\n";
}
