use strict;
use warnings;
use Test::More;
use Test::Deep;
use Test::Trap;

use App::Nopaste::Command;

my $cmd = App::Nopaste::Command->new();
isa_ok($cmd, 'App::Nopaste::Command');

cmp_ok(App::Nopaste::Command->new({ desc     => 'My Test Description' })->desc, 'eq', 'My Test Description');
cmp_ok(App::Nopaste::Command->new({ nick     => 'My Service' })->nick,          'eq',          'My Service');
cmp_ok(App::Nopaste::Command->new({ lang     => 'Python' })->lang,              'eq',              'Python');
cmp_ok(App::Nopaste::Command->new({ chan     => 'perl' })->chan,                'eq',                'perl');
cmp_deeply(App::Nopaste::Command->new({ services => [ 'a', 'b' ] })->services,       [ 'a', 'b' ]);

ok(App::Nopaste::Command->new({ copy     => 1 })->copy);
ok(App::Nopaste::Command->new({ paste    => 1 })->paste);
ok(App::Nopaste::Command->new({ open_url => 1 })->open_url);
ok(App::Nopaste::Command->new({ quiet    => 1 })->quiet);
ok(App::Nopaste::Command->new({ private  => 1 })->private);

# Ensure filename() works as expected, always returns the first filename provided
cmp_ok(App::Nopaste::Command->new({ extra_argv => [ 'blah.dat' ] })->filename(),               'eq',  'blah.dat');
cmp_ok(App::Nopaste::Command->new({ extra_argv => [ 'blah1.dat', 'blah2.dat' ] })->filename(), 'eq', 'blah1.dat');

# Run exists without a valid service
ok(!trap { App::Nopaste::Command->new()->run });

# read_text dies if you pass both paste and files
trap { App::Nopaste::Command->new({paste => 1, extra_argv => [ 'blah.dat' ]})->read_text(); };
cmp_ok($trap->die, 'eq', "You may not specify --paste and files simultaneously.\n");

done_testing;
