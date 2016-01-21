use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Debian;

is(App::Nopaste::Service::Debian->uri, 'http://paste.debian.net/');

done_testing;
