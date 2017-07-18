#!/usr/bin/env perl

use strict;
use lib("./lib");
use Imgur::API;
use feature qw(say);
use Term::ReadLine;
use Data::Dumper;
use Getopt::Long
use Modern::Perl;

my %opt;
GetOptions(\%opt,"client_id=s","client_secret=s","title=s","description=s");
$opt{title}||="Untitled";
my @files = @ARGV;

die "No files to upload." if ($#files<0);

my $imgur = Imgur::API->new(client_id=>$opt{client_id},client_secret=>$opt{client_secret});
my $term = Term::ReadLine->new();
my $url = $imgur->oauth->auth_url(grant_type=>"pin",state=>"login");
system("xdg-open '$url'");
my $pin = $term->readline("Enter PIN: ");

my $index=0;

my $res = $imgur->oauth->token(grant_type=>"pin",pin=>$pin);
if ($res->{access_token}) {
		$imgur->access_token($res->{access_token});
		my $album = $imgur->album->upload(title=>$opt{title},description=>$opt{description});
		say "Uploading to album '$album->{data}->{id}'";
		
		foreach my $file (@files) {
			my $title = sprintf("%s: %d",$opt{title},++$index);
			my $r = $imgur->image->upload(image=>$imgur->content($file),title=>$title,album=>"$album->{data}->{id}");

			#rate limiting for non-business accounts is STRICT.
			sleep(2);
		}
}




