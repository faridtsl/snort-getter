#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $hash_url = "https://www.snort.org/downloads/community/md5s";
my $file_path = "snort-rules-version.txt";
my $old_hash = "";
my $content = get($hash_url);
my $new_hash;
my $rules_url = "https://www.snort.org/downloads/community/community-rules.tar.gz";
my $rules_path = "community_rules.tar.gz";

if($content =~ m/([\w\d]+)/){
	$new_hash = "$1";
}

if (-e $file_path){
	open( inFile, $file_path );
	$old_hash = <inFile>;
	close(inFile);
}

if($old_hash eq "" or $old_hash ne $new_hash ){
	unlink $file_path;
	open( outFile, '>', $file_path );
	print outFile "$new_hash";
	close(outFile);
	if( -e $rules_path ){
		unlink $rules_path;
	}
	getstore($rules_url,$rules_path);
}

