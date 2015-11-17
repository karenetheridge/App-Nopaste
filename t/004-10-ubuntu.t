use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Ubuntu;

cmp_ok(App::Nopaste::Service::Ubuntu->uri, 'eq', 'http://paste.ubuntu.com/');

done_testing;
