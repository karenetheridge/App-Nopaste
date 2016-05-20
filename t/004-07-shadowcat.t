use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Shadowcat;

is(App::Nopaste::Service::Shadowcat->uri, 'http://paste.scsys.co.uk');

done_testing;
