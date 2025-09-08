# lib/Omniflex.pm
use v5.42;
use feature 'class';
no warnings 'experimental::class';

class Omniflex 0.01;

use Omniflex::Loop;
use Omniflex::Watcher;
use Omniflex::Timer;

field $loop :reader = Omniflex::Loop->new();

ADJUST{}

method run(){
  $loop->run();
}

method timer($interval, $cb){
  $loop->add(
      Omniflex::Timer->new(
        interval => $interval,
        callback => $cb,
      )
    );
}
