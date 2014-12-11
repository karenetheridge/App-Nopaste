use strict;
use warnings;
package App::Nopaste::Service::Mojopaste;

use base 'App::Nopaste::Service';

sub uri { $ENV{NOPASTE_MOJOPASTE_WEBPATH} || 'https://ssl.thorsen.pm/paste' }

sub fill_form {
    my $self = shift;
    my $mech = shift;
    my %args = @_;

    $mech->submit_form(
        fields        => {
            p       => 1,
            content => $args{text},
        },
    );

}

sub return {
    my $self = shift;
    my $mech = shift;

    my $link = $mech->uri();

    return (1, $link);
}


1;
__END__

=pod

=head1 NAME

App::Nopaste::Service::Mojopaste - A mojopaste instance

=head1 USAGE

By default the mojopaste installed at http://p.thorsen.pm/ is used.

Point to your local App::mojopaste instance by setting the
NOPASTE_MOJOPASTE_WEBPATH env variable

For example:

  # export NOPASTE_MOJOPASTE_WEBPATH=http://paste.local
  # cat /proc/cpuinfo | nopaste -s Mojopaste

=head1 AUTHOR

Dean Hamstead, C<< <dean@bytefoundry.com.au> >>

=cut
