#!/usr/bin/pugs

use v6;
use Test;

plan 14;

class Foo {
    has $.bar is rw;
    method baz { return 'Foo::baz' }
    method getme($self:) returns Foo { return $self }
}

class Foo::Bar is Foo {
    has $.bar2 is rw;
    method baz { return 'Foo::Bar::baz' }
    method fud { return 'Foo::Bar::fud' }
    method super_baz ($self:) { return $self.Foo::baz() }
}

my $foo_bar = Foo::Bar.new();
isa_ok($foo_bar, 'Foo::Bar');

is($foo_bar.bar2(), undef, '... we have our autogenerated accessor');
is($foo_bar.bar(), undef, '... we inherited the superclass autogenerated accessor');

lives_ok {
    $foo_bar.bar = 'BAR';
}, '... our inherited the superclass autogenerated accessor is rw';
is($foo_bar.bar(), 'BAR', '... our inherited the superclass autogenerated accessor is rw');

lives_ok {
    $foo_bar.bar2 = 'BAR2';
}, '... our autogenerated accessor is rw';
is($foo_bar.bar2(), 'BAR2', '... our autogenerated accessor is rw');

is($foo_bar.baz(), 'Foo::Bar::baz', '... our subclass overrides the superclass method');
is($foo_bar.super_baz(), 'Foo::baz', '... our subclass can still access the superclass method through Foo::');

is($foo_bar.fud(), 'Foo::Bar::fud', '... sanity check on uninherited method');

is($foo_bar.getme, $foo_bar, 'can call inherited methods');
is($foo_bar.getme.baz, "Foo::Bar::baz", 'chained method dispatch on altered method', :todo<bug>);
my $fud;

lives_ok {
    $fud = $foo_bar.getme.fud;
}, 'chained method dispatch on altered method', :todo<bug>;
is($fud, "Foo::Bar::fud", "returned value is correct", :todo<bug>);
