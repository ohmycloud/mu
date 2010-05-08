package VAST::Tight_and;
use utf8;
use strict;
use warnings;
use AST::Helpers;

sub emit_m0ld {
    my $m = shift;
    let $m->{list}[0]->emit_m0ld,sub {
       my $left = shift; 
       AST::If->new(cond => $left,then => $m->{list}[1]->emit_m0ld,else => $left);
    };
}

1;