package dokuwiki;

use Mojo::Base -base;
use Mojo::UserAgent;
use Mojo::DOM;

has ua => sub { Mojo::UserAgent->new };

sub get_download_page {
    my $self = shift;
    return $self->ua->get('https://download.dokuwiki.org' => {Accept => '*/*'})->res->body;
}

sub get_stable_version {
    my $self = shift;
    my $dom  = Mojo::DOM->new($self->get_download_page);
    my @urls = $dom->find('a')->map('attr')->each;

    # Process each hash
    foreach my $url (@urls) {
        say $url->{href};
    }
}

1;
