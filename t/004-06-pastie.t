use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Pastie;

cmp_ok(App::Nopaste::Service::Pastie->uri, 'eq', 'http://pastie.org/');

done_testing;
