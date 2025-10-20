#!/usr/bin/perl 

use strict; 
use warnings;

#single conditions (if - else)
my $age = 20;

if ($age >= 18) {
    print "You are old enough to vote.\n";
} else {
    print "You are not old enough to vote yet.\n";
}

#multiple conditions (if - elsif - else)
my $grade = 30;

if ($grade >= 90) {
    print "You got an A.\n";
} elsif ($grade >= 80) {
    print "You got a B.\n";
} elsif ($grade >= 70) {
    print "You got a C.\n";
} elsif ($grade >= 60) {
    print "You got a D.\n";
} else {
    print "You failed...\n";
}

#what about chaining within statement? no! use && 
my $age2 = 21;

if ($age2 >= 13 && $age2 <= 19) {
    print "You are a teenager. \n";
} else {
    print "You are not a teenager. \n";
}

#short circuit logic (&&)
my $x = 0;
my $y = 5;

if ($x != 0 && $y / $x > 1) {
    print "Error";
}

#short circuit logic (||)
print "Enter your favorite color: ";
chomp(my $color = <STDIN>);

$color = $color || "blue";  

print "Your color is $color!\n";