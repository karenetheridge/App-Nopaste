use strict;
use warnings;
use Test::More;
use Test::Deep;
use Test::Trap;

use App::Nopaste::Service;

# Ensure we die if we don't have a uri provided
trap { App::Nopaste::Service->uri(); };
like($trap->die, qr/App::Nopaste::Service must provide a 'uri' method/);

{
    package _MyTest::Service;
    use parent qw/App::Nopaste::Service/;

    sub uri {
        return 'http://not.valid/';
    }
}

# ensure we die with a reasonable error when we cannot connect to the remote uri
trap { _MyTest::Service->nopaste(); };
like($trap->die, qr/Can't connect to not.valid:80/);

done_testing;
