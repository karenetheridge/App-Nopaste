use strict;
use warnings;
package App::Nopaste::Service::Snitch;
# ABSTRACT: Service provider for Snitch - http://nopaste.snit.ch/

our $VERSION = '1.012';

use parent 'App::Nopaste::Service';

sub available {
    my $self = shift;
    my %args = @_;
    return !(exists($args{private}) && $args{private});
}

sub uri { "http://nopaste.snit.ch" }

1;
