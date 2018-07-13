use XML::Parser;

my $parser = XML::Parser->new;
my $xml = 'players.xml'; #Supply your XML file here

eval { $parser->parsefile($xml) };

if ($@) {  
  print "XML is not well formed.\n";
} else {  
  print "XML is well formed.\n";
}	
