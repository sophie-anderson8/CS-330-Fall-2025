#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say'; #handy little import statement where 'say' works like print and adds a newline automatically!

###############################################
# BASIC FUNCTIONS!
###############################################
#1) MULTIPLY 2 NUMBERS AND RETURN RESULT
sub multiply {
    my ($a, $b) = @_; #@_ is a special array that stores ALL arguments passed to a function
    return $a * $b; #multiplies and returns the results
}

#2) RECURSIVE FACTORIAL FUNCTION
sub factorial {
    my ($n) = @_; 
    die "factorial: negative input not allowed\n" if defined $n && $n < 0; #negative factorials don't make sense in Perl, so we handle that manually
    return 1 if !defined $n || $n == 0; #base case: factorial(0) = 1
    return $n * factorial($n - 1); #recursive case: n * factorial($n - 1)
}

#3) FUNCTION THAT RETURNS 2 STRINGS
sub split_into_two {
    my ($s, $index) = @_; #first arg is the string, second is the index where we split
    $index //= int(length($s) / 2); #//= means set to the right hand side ONLY IF the variable is undefined; if no index is given, we default to splitting the string in the middle
    my $left = substr($s, 0, $index); #substr extracts part of a string
    my $right = substr($s, $index);

    return ($left, $right) #returns both strings - Perl returns lists naturally
}

###############################################################
# CALLING THE BASIC FUNCTIONS (MULTIPLY, FACTORIAL, 2 STRINGS)
###############################################################
my $prod = multiply(6,7);
say "6 * 7 = $prod";

my $fact5 = factorial(5);
say "5! = $fact5";

my ($first_half, $second_half) = split_into_two('abcdefgh', 3);
say "Split result: '$first_half' and '$second_half'";


###############################################
# PASS-BY-VALUE VS PASS-BY-REFERENCE
###############################################
sub try_modify_arg { #this function attempts to modify its argument

    #$_[0] means "the first argument passed to the function".
    #in Perl, @_ holds aliases, not copies - so rewriting  $_[0] can actually change the caller's variable
    $_[0] = "changed"; 
}

### CALLING THE FUNCTION ###
my $orig = "original"; #because Perl aliases @- to the caller's variables, calling this will usually change the value of $orig
try_modify_arg($orig);
say "\$orig after try_modify_arg(\$orig): $orig";


### WRITING THE FUNCTION THE "SAFER" WAY ###
sub safe_modify {
    
    #this copies the value instead of aliasing it - once copied, modifying $x will not affect the caller
    my ($x) = @_; 

    $x = "internal change";

    return $x;
}

### CALLING THE FUNCTION ###
my $orig2 = "original2";
my $returned = safe_modify($orig2);
say "\$orig2 after safe_modify(\$orig2): $orig2";
say "safe_modify returned: $returned";


####################################################
# EXPLICIT PASS-BY-REFERENCE USING SCALAR REFERENCES
####################################################
sub increment_ref {
    #$r_scalar is a reference to a scalar; a reference is like a pointer in Python or the address of a value
    my ($r_scalar) = @_; 

    #$$r_scalar means "the value that the reference points to"... so equivalent to *r_scalar += 1 in other languages
    $$r_scalar++; 
}

### CALLING THE FUNCTION ###
my $num = 0;
increment_ref(\$num);
say "num after increment_ref(\\\$num): $num"; 


=comment

OUTPUT should look like this: 
> 6 * 7 = 42
> 5! = 120
> Split result: 'abc' and 'defgh'
> $orig after try_modify_arg($orig): changed
> $orig2 after safe_modify($orig2): original2
> safe_modify returned: internal change
> num after increment_ref(\$num): 1

=cut