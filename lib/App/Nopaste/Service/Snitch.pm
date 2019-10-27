use strict;
use warnings;
package App::Nopaste::Service::Snitch;
# ABSTRACT: (DEPRECATED) Service provider for Snitch - http://nopaste.snit.ch/

our $VERSION = '1.014';

use parent 'App::Nopaste::Service';

warnings::warnif('deprecated', 'nopaste.snit.ch is offline, so this service no longer works');

sub available {
    my $self = shift;
    my %args = @_;
    return !(exists($args{private}) && $args{private});
}

sub uri { "http://nopaste.snit.ch" }

1;
__END__

=pod

=head1 DEPRECATION NOTICE

L<http://nopaste.snit.ch/> is now offline, so this service no longer works.

=cut
