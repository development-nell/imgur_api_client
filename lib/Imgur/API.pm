package Imgur::API;

use strict;
our $VERSION = "0.0.1";
our $ABSTRACT = "Perl Interface to Imgur API";
use feature qw(say);
use Imgur::API::Endpoint;
use Imgur::API::Exception;
use Imgur::API::Content;
use Imgur::API::Response;
use Data::Dumper;
use LWP::UserAgent;
use HTTP::Message;
use HTTP::Request;
use JSON::XS;
use URI::Escape;

use Moo;

has api_secret=>(is=>'ro');
has api_key=>(is=>'ro');
has auth_token=>(is=>'rw');
has ua=>(is=>'ro',default=>sub { LWP::UserAgent->new(); });

sub request {
	my ($this,$path,$method,$params) = @_;

	$params->{_format}="json";

	$this->ua->agent("Imgur::API/0.0,1");

	my $request = HTTP::Request->new($method=>"https://api.imgur.com/$path");
	$request->header('Authorization'=>"Client-ID ".$this->api_key);

	#$request->content(join("&",map {($_=>$params->{$_})} keys %$params));#"title=wat&image=".uri_escape("http://fi.somethingawful.com/safs/titles/9b/7f/00142877.0002.png"));
	my $response;
	if ($method=~/(?:post|put)/) {	
		$response = $this->ua->$method("https://api.imgur.com/$path",$params,'Authorization'=>"Client-ID ".$this->api_key);
	} else {
		$response = $this->ua->$method("https://api.imgur.com/$path",'Authorization'=>"Client-ID ".$this->api_key);
	}
	if ($response->is_success) {
		my $json = JSON::XS::decode_json($response->decoded_content);
		if  (!$json->{success}) {
			return Imgur::API::Exception->new(code=>$json->{status},message=>$json->{data}->{error});
		}
		return Imgur::API::Response->new($json);
	} else {
		return Imgur::API::Exception->new(code=>$response->code,message=>$response->status_line);
	}
}

sub content {
	my ($self,$what) = @_;

	if ($what=~/^http/i) {
		return $what;
	} elsif (-f $what) {
		return Imgur::API::Content->encode($what);
	}
}

sub account {
	my ($this) = shift;

	return Imgur::API::Endpoint::Account->new(dispatcher=>$this);
}
sub album {
	my ($this) = shift;

	return Imgur::API::Endpoint::Album->new(dispatcher=>$this);
}
sub comment {
	my ($this) = shift;

	return Imgur::API::Endpoint::Comment->new(dispatcher=>$this);
}
sub conversation {
	my ($this) = shift;

	return Imgur::API::Endpoint::Conversation->new(dispatcher=>$this);
}
sub custom_gallery {
	my ($this) = shift;

	return Imgur::API::Endpoint::Custom_gallery->new(dispatcher=>$this);
}
sub gallery {
	my ($this) = shift;

	return Imgur::API::Endpoint::Gallery->new(dispatcher=>$this);
}
sub image {
	my ($this) = shift;

	return Imgur::API::Endpoint::Image->new(dispatcher=>$this);
}
sub memegen {
	my ($this) = shift;

	return Imgur::API::Endpoint::Memegen->new(dispatcher=>$this);
}
sub notification {
	my ($this) = shift;

	return Imgur::API::Endpoint::Notification->new(dispatcher=>$this);
}
sub topic {
	my ($this) = shift;

	return Imgur::API::Endpoint::Topic->new(dispatcher=>$this);
}


1;
