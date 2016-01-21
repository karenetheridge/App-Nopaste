use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Pastie;

is(App::Nopaste::Service::Pastie->uri, 'http://pastie.org/');

done_testing;
