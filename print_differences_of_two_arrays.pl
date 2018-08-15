use Array::Utils qw(:all);

my @a = qw( apple orange mango guava cherry banana watermelon );
my @b = qw( mango guava raspberry strawberry);

# symmetric difference
my @diff = array_diff( @a, @b );

# intersection
my @isect = intersect( @a, @b );

# unique union
my @unique = unique( @a, @b );

# check if arrays contain same members
my $flag = 0;
if ( !array_diff( @a, @b ) ) {
	$flag = 1;
}

# get items from array @a that are not in array @b
my @minus = array_minus( @a, @b );

print '*' x 30, "\n";
print "Symmetric Difference - [@diff]\n";
print "Intersection - [@isect]\n";
print "Unique - [@unique]\n";
print "Array Minus - [@minus]\n";
my $str = ($flag) ? "Arrays are equal\n" : "Arrays are unequal\n";
print $str;
print '*' x 30, "\n";
