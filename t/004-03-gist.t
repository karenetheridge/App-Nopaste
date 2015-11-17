use strict;
use warnings;
use Test::More;
use Test::Deep;
use Test::Trap;

use App::Nopaste::Service::Gist;

ok(App::Nopaste::Service::Gist->available);
ok(!App::Nopaste::Service::Gist->forbid_in_default);

{
		local $ENV{GITHUB_OAUTH_TOKEN} = 'foo';
		cmp_deeply(
				[ App::Nopaste::Service::Gist->_get_auth() ],
				[ oauth_token => 'foo' ]
		);
}

{
		local $ENV{GITHUB_USER}     = 'perl';
		local $ENV{GITHUB_PASSWORD} = 'user';

		cmp_deeply(
				[ App::Nopaste::Service::Gist->_get_auth() ],
				[ username => 'perl', password => 'user' ],
		);
}

{
		local $ENV{GITHUB_USER}     = 'perl';
		trap { App::Nopaste::Service::Gist->_get_auth(); };
		like($trap->die, qr/Export GITHUB_OAUTH_TOKEN first. For example:/);
}

{
		local $ENV{GITHUB_PASSWORD} = 'user';
		trap { App::Nopaste::Service::Gist->_get_auth(); };
		like($trap->die, qr/Export GITHUB_OAUTH_TOKEN first. For example:/);
}

done_testing;
