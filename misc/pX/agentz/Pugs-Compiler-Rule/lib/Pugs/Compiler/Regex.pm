package Pugs::Compiler::Regex;

# Version in Pugs::Compiler::Rule
# Documentation in the __END__
use 5.006;
use strict;
use warnings;

use Pugs::Grammar::Rule;
use Pugs::Compiler::RegexPerl5;

use Pugs::Emitter::Rule::Perl5;
use Pugs::Emitter::Rule::Perl5::Ratchet;

use Pugs::Runtime::Regex;

# complete the dependency circularity
push @Pugs::Grammar::Rule::ISA, 'Pugs::Grammar::Base';

use Carp 'croak';
use Data::Dumper;
use Symbol 'qualify_to_ref';
use Digest::MD5 'md5_hex';

our $NoCache = 0;

my $cache;
eval {
    require Cache::FileCache;
    $cache = new Cache::FileCache( { 'namespace' => 'v6-rules' } );
};

sub new { $_[0] }

sub compile {
    local $::_V6_MATCH_;  # avoid messing with global $/
    
    # $class->compile( $source )
    # $class->compile( $source, { p=>1 } )
    # $class->compile( $source, { signature => $sig } ) -- TODO

    my ( $class, $rule_source, $param ) = @_;

    return Pugs::Compiler::RegexPerl5->compile( $rule_source, $param )
        if exists $param->{P5} || exists $param->{Perl5};
    #warn length($rule_source);

    my $self = { source => $rule_source };

    #print Dumper @_;

    # XXX - should use user's lexical pad instead of an explicit grammar?
    $self->{grammar}  = delete $param->{grammar}  || 
                        'Pugs::Grammar::Base';
    $self->{ratchet}  = delete $param->{ratchet}  || 
                        0;
    $self->{p}        = delete $param->{pos}      ||
                        delete $param->{p};
                        # default = undef;
    delete $param->{p};
    $self->{sigspace} = delete $param->{sigspace} ||
                        delete $param->{s}        || 
                        0;
    $self->{continue} = delete $param->{continue} ||
                        delete $param->{c}        || 
                        0;
    $self->{ignorecase} = delete $param->{ignorecase} ||
                        delete $param->{i}        || 
                        0;
    delete $param->{s};

    warn "Error in rule: unknown parameter '$_'" 
        for keys %$param;

    my $digest = md5_hex(Dumper($self));
    my $cached;

    if (!$NoCache && $cache && ($cached = $cache->get($digest))) {
        #warn "USING CACHED RULE\n";
        $self->{perl5} = $cached;
    }
    else {
        #warn "COMPILING RULE\n";

        #print 'rule source: ', $self->{source}, "\n";
        #print "match: ", Dumper( Pugs::Grammar::Rule->rule( $self->{source} ) );
        my $ast = Pugs::Grammar::Rule->rule( 
            $self->{source} )->();
        
        # save the ast for debugging
        $self->{ast} = $ast;

        #print "ast: ",Dumper($ast),"\n";
        #die "Error in rule: '$rule_source' at: '$ast->tail'\n" if $ast->tail;
        #print 'rule ast: ', do{use Data::Dumper; Dumper($ast{capture})};

        #use Pugs::Emitter::Rule::Perl5::Preprocess;
        #my $ast2 = Pugs::Emitter::Rule::Perl5::Preprocess::emit( 
        #         $self->{grammar}, $ast, $self );

        if ( $self->{ratchet} ) {
            $self->{perl5} = Pugs::Emitter::Rule::Perl5::Ratchet::emit( 
                 $self->{grammar}, $ast, $self );
            #print "token: ", $self->{perl5};
        }
        else {
            $self->{perl5} = Pugs::Emitter::Rule::Perl5::emit( 
                $self->{grammar}, $ast, $self );
        }
        #print 'rule perl5: ', do{use Data::Dumper; Dumper($self->{perl5})};

        $cache->set($digest, $self->{perl5}, 'never') if $cache;
    }

    #our $evals++;

    local $@;
    $self->{code} = eval 
        # "\#line " . ($evals*1000) . "\n" .
        $self->{perl5};
    die "Error in evaluation: $@\nSource:\n$self->{perl5}\n" if $@;

    #my $code = $self->{code};
    #my $e = $evals;
    #my $c = $self->{perl5};
    #my $x = 1;
    #$c =~ s/\n/"\n".++$x.": "/seg;
    #$self->{code} = sub { print "calling #$e <<< $rule_source >>> compiles to <<< $c >>>\n"; $code->(@_); };

    bless $self, $class;
}

sub code { 
    my $rule = shift; 
    sub { 
        # XXX - inconsistent parameter order - could just use @_, or use named params
        my ( $grammar, $str, $flags, $state ) = @_; 
        $rule->match( $str, $grammar, $flags, $state ); 
    } 
}

sub match {
    my ( $rule, $str, $grammar, $flags, $state ) = @_; 

    #print "match: ",Dumper($rule);
    #print "match: ",Dumper(\@_);
    #print "PCR::match: ",Dumper($_[2]);
    
    return Pugs::Runtime::Match->new( { bool => \0 } )
        unless defined $str;   # XXX - fix?
        
    if ( ref $grammar eq 'HASH' ) {
        # backwards compatibility - grammar can now be specified in $flags
        $state = $flags;
        $flags = $grammar;
        $grammar = $flags->{grammar};
    }

    $grammar ||= $rule->{grammar};
    #print "match: grammar $rule->{grammar}, $_[0], $flags\n";
    #print "match: Variables: ", Dumper ( $flags->{args} ) if defined $flags->{args};
    #print "match: Flags: ", Dumper ( $flags ) if defined $flags;

    my $p = defined $flags->{p} 
            ? $flags->{p} 
            : defined $flags->{pos} 
            ? $flags->{pos} 
            : $rule->{p};

    my $continue = defined $flags->{c} 
            ? $flags->{c} 
            : defined $flags->{continue} 
            ? $flags->{continue} 
            : $rule->{continue};

    my $ignorecase = defined $flags->{i} 
            ? $flags->{i} 
            : defined $flags->{ignorecase} 
            ? $flags->{ignorecase} 
            : $rule->{ignorecase};

        #print "flag p";
        #print "match: grammar $rule->{grammar}, $str, %$flags\n";
        #print $rule->{code};

        # XXX BUG! - $rule->{code} disappeared - in t/08-hash.t ???
        unless ( defined $rule->{code} ) {
            local $@;
            $rule->{code} = eval 
                $rule->{perl5};
            die "Error in evaluation: $@\nSource:\n$rule->{perl5}\n" if $@;
        }
        
        my %args;
        %args = %{$flags->{args}} if defined $flags && defined $flags->{args};
        $args{p} = $p;
        $args{continue} = $continue;
        $args{ignorecase} = $ignorecase;
        
        #print "calling code with ",Dumper([ $grammar,$str, $state,\%args ] );
        my $match = $rule->{code}( 
            $grammar,
            $str, 
            $state,
            \%args,
        );
        #print __PACKAGE__ . ": match result: ", $match->perl;
        return $match;  
}

sub reinstall {
  my($class, $name, @etc) = @_;

  ## XXX - code duplication with "install" below
  ## If we have a fully qualified name, use that, otherwise extrapolate.
  my $rule = index($name, '::') > -1 ? $name : scalar(caller)."::$name";
  my $slot = qualify_to_ref($rule);

  eval {
      no warnings 'redefine';
      *$slot = $class->compile(@etc)->code;
  }; warn $@ if $@;
}

sub install {
  my($class, $name, @etc) = @_;

  ## If we have a fully qualified name, use that, otherwise extrapolate.
  my $rule = index($name, '::') > -1 ? $name : scalar(caller)."::$name";
  my $slot = qualify_to_ref($rule);

  croak "Can't install regex '$name' as '$rule' already exists"
    if *$slot{CODE};

  *$slot = $class->compile(@etc)->code;
}

sub _str { defined $_[0] ? $_[0] : 'undef' }
sub _quot { 
    my $s = $_[0];
    $s =~ s/\\/\\\\/sg;
    return $s;
}

sub perl5 {
    my $self = shift;
    return "bless {\n" . 
        "  grammar "  .  "=> q(" . _str( $self->{grammar} )  . "),\n" . 
        "  ratchet "  .  "=> q(" . _str( $self->{ratchet} )  . "),\n" . 
        "  p "        .  "=> " . _str( $self->{p} )        . ",\n" . 
        "  sigspace " .  "=> q(" . _str( $self->{sigspace} ) . "),\n" . 
        "  ignorecase ". "=> q(" . _str( $self->{ignorecase} )."),\n" . 
        "  code "     .  "=> "   . $self->{perl5}    . ",\n" . 
        "  perl5 "    .  "=> q(" . _quot( $self->{perl5} )  . "), }, " . 
        "q(" . ref($self) . ")";
}

sub perl { perl5(@_) }

1;

__END__

=head1 NAME 

Pugs::Compiler::Regex - Compiler for Perl 6 Regex

=head1 DESCRIPTION

This module provides an implementation for Perl 6 Regex.
See L<Pugs::Compiler::Rule> for documentation.

=head1 AUTHORS

The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 SEE ALSO

The Perl 6 Rules Spec: L<http://dev.perl.org/perl6/doc/design/syn/S05.html>

=head1 COPYRIGHT

Copyright 2006 by Flavio Soibelmann Glock and others.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
