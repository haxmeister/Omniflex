# lib/Omniflex/Loop.pm
use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Omniflex::Loop;

use Linux::Epoll;

field $epoll   :reader;
field $max     :param  :reader = 64;
field $timeout :param  :reader = undef;

ADJUST{
    $epoll = Linux::Epoll->new();
}


# add: expects object with ->fh, ->events, ->cb
method add (@watchers) {
    foreach my $watcher (@watchers){
        try{
            $epoll->add(
                $watcher->handle,
                $watcher->events,
                sub{
                    my $ref = shift; $watcher->callback($ref)
                }
            );
        }catch($error){
            die "could not add watcher: $error";
        }
    }
}

method modify ( $fh, $events, $cb ) {
    $epoll->modify($fh, $events, $cb)
}

method unwatch($fh){
    $epoll->delete($fh);
}

method run (){
    while (1) {
        $epoll->wait($max, $timeout);
    }
}

method tick(){
    $epoll->wait($max, $timeout);
}

1;
