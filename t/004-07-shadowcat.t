use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Shadowcat;

cmp_ok(App::Nopaste::Service::Shadowcat->uri, 'eq', 'http://paste.scsys.co.uk');

done_testing;
