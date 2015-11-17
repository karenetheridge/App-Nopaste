use strict;
use warnings;
use Test::More;

use App::Nopaste::Service::Mojopaste;

cmp_ok(App::Nopaste::Service::Mojopaste->uri, 'eq', 'https://ssl.thorsen.pm/paste');

done_testing;
