package Imgur::API::Endpoint::Misc;

use strict;
use Mouse;
extends 'Imgur::API::Endpoint';

sub credits {
    my ($this,%p) = @_;

    return $this->dispatcher->request(
        $this->path("3/account",[],[],\%p),
        'get',
        \%p
    );
}

1;
__PACKAGE__->meta->make_immutable;

