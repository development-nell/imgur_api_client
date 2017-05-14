package Imgur::API::Stats;

use strict;
use Mouse;
use DateTime;

has user_limit=>(is=>'rw',default=>sub {0;});
has user_remaining=>(is=>'rw',default=>sub{0;});
has user_reset=>(is=>'rw',default=>sub{0;});

has client_limit=>(is=>'rw',default=>sub{0;});
has client_remaining=>(is=>'rw',default=>sub {0;});

has post_limit=>(is=>'rw',default=>sub{0;});
has post_remaining=>(is=>'rw',default=>sub{0;});
has post_reset=>(is=>'rw',default=>sub{0;});

sub update {
	my ($self,$response) = @_;
	
	$self->user_limit($response->header("x-ratelimit-userlimit"));
	$self->user_remaining($response->header("x-ratelimit-userremaining"));
	$self->user_reset($response->header("x-ratelimit-userreset"));

	$self->client_limit($response->header("x-ratelimit-clientlimit"));
	$self->client_remaining($response->header("x-ratelimit-clientlimit"));

	if ($response->header("x-post-rate-limit-remaining")) {
		$self->post_limit($response->header("x-post-rate-limit-limit"));
    	$self->post_remaining($response->header("x-post-rate-limit-remaining"));
		$self->post_limit($response->header("x-ratelimit-clientlimit"));
	}
}

1;
	
		
