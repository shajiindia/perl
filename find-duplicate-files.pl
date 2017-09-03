#!/usr/bin/perl

########################################################################
#This is free and unencumbered software released into the public domain.
########################################################################

use strict;
use warnings;

use File::Find::Rule;
use Digest::MD5;

#search the directory "E:/demo/shaji" or you can even get the directory as command line argument (@ARGV) if required
my $directory = "E:/demo/shaji";
my @all_files = File::Find::Rule->file()->name('*.*')->in($directory);
my %files;    # Hash of files indexed by size
my %md5;      # file name array hash
my @duplicates = ();    # List of array containing duplicate files
foreach (@all_files) {

	#Returns a 13-element list giving the status info for a file, either the file opened via
	#FILEHANDLE or DIRHANDLE, or named by EXPR. If EXPR is omitted, it stats $_ (not _ !).
	#Returns the empty list if stat fails
	#Typically used as follows
	#my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks) = stat($filename);

	#  0 dev      device number of filesystem
	#  1 ino      inode number
	#  2 mode     file mode  (type and permissions)
	#  3 nlink    number of (hard) links to the file
	#  4 uid      numeric user ID of file's owner
	#  5 gid      numeric group ID of file's owner
	#  6 rdev     the device identifier (special files only)
	#  7 size     total size of file, in bytes
	#  8 atime    last access time in seconds since the epoch
	#  9 mtime    last modify time in seconds since the epoch
	# 10 ctime    inode change time in seconds since the epoch (*)
	# 11 blksize  preferred I/O size in bytes for interacting with the
	#             file (may vary from file to file)
	# 12 blocks   actual number of system-specific blocks allocated
	#             on disk (often, but not always, 512 bytes each)

	push @{ $files{ ( stat(_) )[7] } }, $_ if -f; #only add if it is a plain file
}

print '*' x 50, "\n";
print "List of files of same size but may not be duplicates\n";
print '*' x 50, "\n";

foreach my $size ( keys %files ) {
	if ( $#{ $files{$size} } > 0 ) {
		print "File Size : $size\n";
		foreach ( @{ $files{$size} } ) {

			#print files of same size (even if the file size is same, the files may not contain same data)
			print "\t$_\n";
			open my $file, '<', $_ or next;
			binmode $file;

			#The Digest::MD5 module allows you to use the RSA Data Security Inc. The algorithm takes as input a
			#message of arbitrary length and produces as output a 128-bit "fingerprint" or "message digest" of the input.
			#Note that the MD5 algorithm is not as strong as it used to be. It has since 2005 been easy to
			#generate different messages that produce the same MD5 digest. It still seems hard to
			#generate messages that produce a given digest, but it is probably wise to move to stronger
			#algorithms for applications that depend on the digest to uniquely identify a file.
			push @{ $md5{ Digest::MD5->new->addfile(*$file)->hexdigest } }, $_;
			close $file;
		}
	}
}

# calculate duplicates in md5 hash
foreach my $hash ( keys %md5 ) {
	if ( $#{ $md5{$hash} } > 0 ) {
		push( @duplicates, [ @{ $md5{$hash} } ] );
	}
}

print '*' x 50, "\n";
print "List of duplicate files\n";
print '*' x 50, "\n";

foreach (@duplicates) {
	print "Duplicates\n";
	foreach my $duplicate_file (@$_) {
		#print duplicate files
		print "\t$duplicate_file\n";
	}
}
