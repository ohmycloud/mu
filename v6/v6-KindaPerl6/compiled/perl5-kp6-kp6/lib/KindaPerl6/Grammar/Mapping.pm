{

    package KindaPerl6::Grammar;

    # Do not edit this file - Perl 5 generated by KindaPerl6
    # AUTHORS, COPYRIGHT: Please look at the source file.
    use v5;
    use strict;
    no strict "vars";
    use constant KP6_DISABLE_INSECURE_CODE => 0;
    use KindaPerl6::Runtime::Perl5::Runtime;
    my $_MODIFIED;
    INIT { $_MODIFIED = {} }
    INIT {
        $_ =
          ::DISPATCH( $::Scalar, "new",
            { modified => $_MODIFIED, name => "$_" } );
    }
    do {
        do {
            if (
                ::DISPATCH(
                    ::DISPATCH(
                        ::DISPATCH(
                            (
                                $GLOBAL::Code_VAR_defined =
                                  $GLOBAL::Code_VAR_defined
                                  || ::DISPATCH( $::Routine, "new", )
                            ),
                            'APPLY',
                            $::KindaPerl6::Grammar
                        ),
                        "true"
                    ),
                    "p5landish"
                )
              )
            {
            }
            else {
                do {
                    do {
                        ::MODIFIED($::KindaPerl6::Grammar);
                        $::KindaPerl6::Grammar = ::DISPATCH(
                            ::DISPATCH(
                                $::Class, 'new',
                                ::DISPATCH(
                                    $::Str, 'new', 'KindaPerl6::Grammar'
                                )
                            ),
                            'PROTOTYPE',
                        );
                      }
                  }
            }
        };
        do {
            use vars qw($_rule_pair);
            INIT {
                $_rule_pair = qr (?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; 
        $GLOBAL::_M2 = $GLOBAL::_M; 
    })
    (?:(?:(?:(??{ eval '$_rule_ident' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "ident" ]; }))(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))=>(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))(?:(??{ eval '$_rule_exp' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "exp" ]; }))(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
             )
             )
            ,  } ),  )
            , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp' )
             )
             )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     }))|(?:(?:(??{ eval '$_rule_exp2' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "exp2" ]; }))(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))=>(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))(?:(??{ eval '$_rule_exp' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "exp" ]; }))(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp2' )
             )
             )
            , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp' )
             )
             )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     }))|(?:\:(?:(??{ eval '$_rule_ident' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "ident" ]; }))\<(?:(??{ eval '$_rule_angle_quoted' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "angle_quoted" ]; }))\>(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
             )
             )
            ,  } ),  )
            , ::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'angle_quoted' )
             )
             )
            ,  } ),  )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     }))|(?:\:(?:(??{ eval '$_rule_ident' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "ident" ]; }))\((?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))(?:(??{ eval '$_rule_exp' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "exp" ]; }))(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))\)(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
             )
             )
            ,  } ),  )
            , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp' )
             )
             )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     }))|(?:\:(?:(??{ eval '$_rule_ident' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "ident" ]; }))(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
             )
             )
            ,  } ),  )
            , ::DISPATCH( $::Val::Bit, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'bit' )
            , value           => ::DISPATCH( $::Int, 'new', 1 )
            ,  } ),  )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     }))|(?:\:(?:(??{ eval '$_rule_sigil' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "sigil" ]; }))(?:(??{ eval '$_rule_ident' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "ident" ]; }))(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'buf' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
             )
             )
            ,  } ),  )
            , ::DISPATCH( $::Var, 'new', ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'sigil' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__126__62_ = $GLOBAL::Code_prefix_58__60__126__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'sigil' )
             )
             )
             )
            ,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'twigil' )
            , value           => ::DISPATCH( $::Str, 'new', '' )
            ,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'name' )
            , value           => ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'ident' )
             )
             )
            ,  } ), ::DISPATCH( $::NamedArgument, "new", { _argument_name_ => ::DISPATCH( $::Str, 'new', 'namespace' )
            , value           => ::DISPATCH( $::Array, 'new', { _array => [] }
             )
            ,  } ),  )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     })))
    (?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; 
        $GLOBAL::_M2 = $GLOBAL::_M; 
    })
     x;
            }
            ::DISPATCH(
                ::DISPATCH( $::KindaPerl6::Grammar, "HOW" ),
                "add_method",
                ::DISPATCH( $::Str, "new", "pair" ),
                ::DISPATCH(
                    $::Method,
                    "new",
                    {
                        code => sub {
                            local $GLOBAL::_Class = shift;
                            undef $GLOBAL::_M2;
                            ( ref($_) ? ::DISPATCH( $_, "Str" )->{_value} : $_ )
                              =~ /$_rule_pair/;
                            if ( $GLOBAL::_M2->[1] eq 'to' ) {
                                Match::from_global_data($GLOBAL::_M2);
                                $MATCH = $GLOBAL::MATCH = pop @Match::Matches;
                            }
                            else { $MATCH = $GLOBAL::MATCH = Match->new(); }
                            @Match::Matches = ();
                            return $MATCH;
                          }
                    }
                ),
            );
        };
        do {
            use vars qw($_rule_exp_mapping);
            INIT {
                $_rule_exp_mapping = qr (?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, 'create', pos(), \$_ ]; 
        $GLOBAL::_M2 = $GLOBAL::_M; 
    })
    (?:(?:(?:(??{ eval '$_rule_pair' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "pair" ]; }))(?:(?:(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))\,(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))(?:(??{ eval '$_rule_exp_mapping' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "named_capture", "exp_mapping" ]; }))(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'pair' )
             )
             )
            , ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__64__62_ = $GLOBAL::Code_prefix_58__60__64__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'exp_mapping' )
             )
             )
             )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     }))|(?:(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; }))(?:(?:\,(?:(??{ eval '$_rule_opt_ws' })(?{ local $GLOBAL::_M = [ $GLOBAL::_M, "discard_capture" ]; })))|(?:))(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [::DISPATCH(  ( $GLOBAL::Code_prefix_58__60__36__62_ = $GLOBAL::Code_prefix_58__60__36__62_ || ::DISPATCH( $::Routine, "new", )  ) 
            , 'APPLY', ::DISPATCH( $MATCH, 'LOOKUP', ::DISPATCH( $::Str, 'new', 'pair' )
             )
             )
            ] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     }))))|(?:(?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, "to", pos() ]; 
        Match::from_global_data( $GLOBAL::_M ); 
        $MATCH = $GLOBAL::MATCH = pop @Match::Matches; 
        @Match::Matches = (); 
        my $ret = ( sub {
            do {return(::DISPATCH( $::Array, 'new', { _array => [] }
             )
            )
            }; "974^213" 
        } )->();
        if ( $ret ne "974^213" ) {$GLOBAL::_M = [ [ @$GLOBAL::_M ], "result", $ret ]; };
     })))
    (?{ 
        local $GLOBAL::_M = [ $GLOBAL::_M, 'to', pos() ]; 
        $GLOBAL::_M2 = $GLOBAL::_M; 
    })
     x;
            }
            ::DISPATCH(
                ::DISPATCH( $::KindaPerl6::Grammar, "HOW" ),
                "add_method",
                ::DISPATCH( $::Str, "new", "exp_mapping" ),
                ::DISPATCH(
                    $::Method,
                    "new",
                    {
                        code => sub {
                            local $GLOBAL::_Class = shift;
                            undef $GLOBAL::_M2;
                            ( ref($_) ? ::DISPATCH( $_, "Str" )->{_value} : $_ )
                              =~ /$_rule_exp_mapping/;
                            if ( $GLOBAL::_M2->[1] eq 'to' ) {
                                Match::from_global_data($GLOBAL::_M2);
                                $MATCH = $GLOBAL::MATCH = pop @Match::Matches;
                            }
                            else { $MATCH = $GLOBAL::MATCH = Match->new(); }
                            @Match::Matches = ();
                            return $MATCH;
                          }
                    }
                ),
            );
          }
    };
    1
}
