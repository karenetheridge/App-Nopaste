use strict;
use warnings;

use Test::More 0.88;
use Test::Deep;
use Test::Fatal;

use App::Nopaste::Service;

like(
    exception { App::Nopaste::Service->uri() },
    qr/App::Nopaste::Service must provide a 'uri' method/,
    'appropriate error when no URI is provided',
);

{
    package _MyTest::Service;
    use parent qw/App::Nopaste::Service/;

    sub uri {
        return 'http://not.valid/';
    }
}

like(
    exception { _MyTest::Service->nopaste() },
    qr/Can't connect to not.valid:80/,
    'appropriate error when remote URI is not available',
);

done_testing;
