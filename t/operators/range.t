use v6-alpha;

use Test;

plan 48;

# 3..2 must *not* produce "3 2".  Use reverse to get a reversed range. -lwall

is ~(3..6), "3 4 5 6", "(..) works on numbers (1)";
is ~(3..3), "3",       "(..) works on numbers (2)";
is ~(3..2), "",        "(..) works on numbers (3)";
is ~(8..11), "8 9 10 11",   "(..) works on carried numbers (3)";

is ~("a".."c"), "a b c", "(..) works on chars (1)";
is ~("a".."a"), "a",     "(..) works on chars (2)";
is ~("b".."a"), "",      "(..) works on chars (3)";
is ~("Y".."AB"), "Y Z AA AB", "(..) works on carried chars (3)";

{
  skip 2, "Skipping hanging tests";
  # my @array = 3...;
  # is @array[0], 3, "(...) works (1)";
  # is @array[3], 6, "(...) works (2)";
}

is ~(3..9-3), "3 4 5 6", "(..) has correct precedence (1)";
is ~(2+1..6), "3 4 5 6", "(..) has correct precedence (2)";

# Test the three exclusive range operators:
# L<S03/"New operators" /range operator has variants/>
is [1^..9], [2..9],  "bottom-exclusive range (^..) works";
is [1 ..^9], [1..8], "top-exclusive range (..^) works";
is [1^..^9], [2..8], "double-exclusive range (^..^) works";
is [1^..^2], [], "double-exclusive range (^..^) can produce null range";

is ["a"^.."z"], ["b".."z"], "bottom-exclusive string range (^..) works";
is ["a"..^"z"], ["a".."y"], "top-exclusive string range (..^) works";
is ["a"^..^"z"], ["b".."y"], "double-exclusive string range (^..^) works";
is ['a'^..^'b'], [], "double-exclusive string range (^..^) can produce null range";

is 1.5 ~~ 1^..^2, Bool::True, "lazy evaluation of the range operator", :todo<bug>;

# Test the unary ^ operator
is ~(^5), "0 1 2 3 4", "unary ^num produces the range 0..^num";
is [^1], [0], "unary ^ on the boundary ^1 works";
is [^0], [], "unary ^0 produces null range";

# Test with floats
# 2006-12-05:
# 16:16 <TimToady> ~(1.9 ^..^ 4.9) should produce 2.9, 3.9
# 16:17 <pmichaud> and ~(1.9 ^..^ 4.5) would produce the same?
# 16:17 <TimToady> yes
is ~(1.1 .. 4) , "1.1 2.1 3.1", "range with float .min";
is ~(1.9 .. 4) , "1.9 2.9 3.9", "range with float .min";
is ~(1.1 ^.. 4), "2.1 3.1"    , "bottom exclusive range of float";
is ~(1.9 ^.. 4), "2.9 3.9"    , "bottom exclusive range of float";

is ~(1 .. 4.1) , "1 2 3 4", "range with float .max";
is ~(1 .. 4.9) , "1 2 3 4", "range with float .max";
is ~(1 ..^ 4.1), "1 2 3 4", "top exclusive range of float";
is ~(1 ..^ 4.9), "1 2 3 4", "top exclusive range of float";

is ~(1.1 .. 4.1), "1.1 2.1 3.1 4.1", "range with float .min/.max";
is ~(1.9 .. 4.1), "1.9 2.9 3.9"    , "range with float .min/.max";
is ~(1.1 .. 4.9), "1.1 2.1 3.1 4.1", "range with float .min/.max";
is ~(1.9 .. 4.9), "1.9 2.9 3.9 4.9", "range with float .min/.max";

is ~(1.1 ^..^ 4.1), "2.1 3.1"    , "both exclusive float range";
is ~(1.9 ^..^ 4.1), "2.9 3.9"    , "both exclusive float range";
is ~(1.1 ^..^ 4.9), "2.1 3.1 4.1", "both exclusive float range";
is ~(1.9 ^..^ 4.9), "2.9 3.9"    , "both exclusive float range";


# Test that the operands are forced to scalar context
{
    my @one   = (1,);
    my @three = (1, 1, 1);

    is ~(@one .. 3)     , "1 2 3", "lower inclusive limit is in scalar context";
    is ~(@one ^.. 3)    , "2 3"  , "lower exclusive limit is in scalar context";
    is ~(1 .. @three)   , "1 2 3", "upper inclusive limit is in scalar context";
    is ~(1 ..^ @three)  , "1 2"  , "upper exclusive limit is in scalar context";
    is ~(@one .. @three), "1 2 3", "both inclusive limits are in scalar context";
    is ~(@one ^..^ @three), "2"  , "both exclusive limits are in scalar context";
    is ~(@three .. @one), ""     , "null range produced with lists forced to scalar context";
}

# Test :by
{
    my $ret = eval ' 1 .. 5 :by(2) ';
    is $ret, "1 3 5", ":by works", :todo<feature>;
}
