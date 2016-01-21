use strict;
use warnings;
use Test::More;
use Test::Deep;
use Test::Fatal;

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
		like(exception { App::Nopaste::Service::Gist->_get_auth(); }, qr/Export GITHUB_OAUTH_TOKEN first. For example:/, 'User is warned that a GITHUB_OAUTH_TOKEN is required');
}

{
		local $ENV{GITHUB_PASSWORD} = 'user';
		like(exception { App::Nopaste::Service::Gist->_get_auth(); }, qr/Export GITHUB_OAUTH_TOKEN first. For example:/, 'User is warned that a GITHUB_OAUTH_TOKEN is required');
}

done_testing;
