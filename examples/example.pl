#!/usr/bin/env perl

use v5.42;
use FindBin;
use lib "$FindBin::Bin/../lib";
use experimental qw(class);
no warnings 'experimental::class';

use Omniflex;

my $loop = Omniflex::Loop->new();


my $test = Omniflex::Timer->new(
    value    => 10,
    interval => 2,
    callback => sub{
        say "my timer was called back!";
    },
);

$loop->add($test);
$loop->run();

