use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Debian;

cmp_ok(App::Nopaste::Service::Debian->uri, 'eq', 'http://paste.debian.net/');

done_testing;
