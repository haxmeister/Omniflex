# lib/Omniflex/Handle.pm
use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Omniflex::Watcher;

field $handle   :reader :writer :param = "";
field $events   :reader :writer :param = [];

ADJUST{

}

method callback($ref){
    say "callback";
    $self->on_read if $ref->{in};
}

method on_read(){

}
