use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Snitch;

cmp_ok(App::Nopaste::Service::Snitch->uri, 'eq', 'http://nopaste.snit.ch');

done_testing;
