use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Snitch;

is(App::Nopaste::Service::Snitch->uri, 'http://nopaste.snit.ch');

done_testing;
