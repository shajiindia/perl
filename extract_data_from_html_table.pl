use strict;
use warnings;
use HTML::TableExtract;

my $headers = [ 'Match Number', 'Place', 'Status', 'Result' ];

my $table_extract = HTML::TableExtract->new( headers => $headers );

$table_extract->parse_file('table.html');
my ($table) = $table_extract->tables;

for my $row ( $table->rows ) {
	print join( ",", @$row ), "\n";
}

__DATA__
#Sample Input HTML File (Shows the content of table.html)
<html>
<head>
<title>India - Australia Series</title>
</head>
<body>
<center>
<table border="1">
<caption><em>One Day International</em></caption>
<tr><th>Match Number</th><th>Place</th><th>Status</th><th>Result</th></tr>
<tr><td>1</td><td>Adelaide</td><td>Won</td><td>India won by 23 runs</td></tr>
<tr><td>2</td><td>Sydney</td><td>Lost</td><td>Australia won by 62 runs</td></tr>
<tr><td>3</td><td>Melbourne</td><td>Won</td><td>India won by 3 wickets</td></tr>
<tr><td>4</td><td>Brisbane</td><td>Won</td><td>India won by 76 runs</td></tr>
</table>
</center>
</body>
</html>
