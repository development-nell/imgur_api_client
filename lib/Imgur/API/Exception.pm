package Imgur::API::Exception;

use strict;

sub new {
	my ($class,%options) = @_;

	return bless {%options},$class;
}

sub is_success { 0; }

1;
__DATA__
