#ABSTRACT: some function base DBI
package SimpleDBI;
our $VERSION=0.02;
our $DEFAULT_SEP = ',';

sub new {
    my ( $self, %opt ) = @_;
    $opt{sep} ||= $DEFAULT_SEP;
    my $module = "SimpleDBI::$opt{type}";
    eval "require $module;";
    my $r = bless \%opt, $module;
    $r->{dbh} = $r->connect_db(%opt);
    return $r;
} ## end sub
1;
