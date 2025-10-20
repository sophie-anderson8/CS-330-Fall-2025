#!/usr/bin/perl 

use strict; 
use warnings;
use feature "switch";
no warnings "experimental::smartmatch";

my $grade = "D";

given ($grade) {
    when ("A") {print "Excellent!!\n";}
    when ("B") {print "Good job!\n";}
    when ("C") {print "You passed.\n";}
    when ("D") {print "You passed? Kinda?\n";}
    default    {print "Try again.\n";}
}