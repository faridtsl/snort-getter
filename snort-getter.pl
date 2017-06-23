#!/usr/bin/perl
use strict;
use warnings;

use LWP::Simple;
my $url = "https://www.snort.org/downloads/community/md5s";
my $file_path = "snort-rules-version.txt";
my $old_hash = "tkhrbi9a";
my $content = get($url);


if($content =~ m/([\w\d]+)/){
	my $new_hash = "$1";
}

if (-e $file_path){
	open( inFile, $file_path );
	$old_hash = <inFile>;
	close(inFile);
}

if( $old_hash != $new_hash ){
	unlink $file_path;
	open( outFile, '>', $file_path );
	print filehandle "$new_hash";
}
