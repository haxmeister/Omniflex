use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Omniflex::Timer :isa(Omniflex::Watcher);
use Linux::FD::Timer;

field $value    :param = 10;
field $interval :param;
field $callback :param;

ADJUST{
    $self->set_events(['in']);
    my $fh = Linux::FD::Timer->new('monotonic', 'non-blocking');

    $self->set_handle( Linux::FD::Timer->new('monotonic', 'non-blocking') );
    $self->handle->set_timeout($value, $interval);
}

method on_read(){
    say "on_read";
    my $handle = $self->handle;
    my @msg = <$handle>;
    $callback->();
}
