use strict;
use warnings;
package App::Nopaste::Service::PastebinCom;

use base 'App::Nopaste::Service';
use Module::Runtime 'use_module';
use namespace::clean;

sub available {
    eval { use_module('WWW::Pastebin::PastebinCom::Create'); 1 }
}

sub run {
    my $self = shift;
    my %args = @_;

    use_module('WWW::Pastebin::PastebinCom::Create');

    $args{poster} = delete $args{nick} if defined $args{nick};
    $args{format} = delete $args{lang} if defined $args{lang};

    my $paster = WWW::Pastebin::PastebinCom::Create->new;
    my $ok = $paster->paste(
        expiry => 'm',
        %args,
    );

    return (0, $paster->error) unless $ok;
    return (1, $paster->paste_uri);
}

1;
__END__

=pod

=head1 NAME

App::Nopaste::Service::PastebinCom - http://pastebin.com/

=head1 SEE ALSO

L<WWW::Pastebin::PastebinCom::Create>

=cut
