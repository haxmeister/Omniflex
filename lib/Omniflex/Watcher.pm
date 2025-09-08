# lib/Omniflex/Handle.pm
use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Omniflex::Watcher;

field $handle   :reader :writer :param = "";
field $events   :reader :writer :param = [];


method callback($ref){
    say "callback";
    $self->on_read  if $ref->{in};
    $self->on_write if $ref->{out};
    $self->on_error if $ref->{error};
    $self->on_prio  if $ref->{prio};
    $self->on_hup   if $ref->{hup};
    $self->on_rdhup if $ref->{rdhup};
}

method on_read(){
    return 0;
}

method on_write(){}
method on_error(){}
method on_prio(){}
method on_hup(){}
method on_rdhup(){}

