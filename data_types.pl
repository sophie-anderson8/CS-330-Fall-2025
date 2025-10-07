#!/usr/bin/perl 

use strict; #forces you to declare variables before using them - helps catch typos
use warnings; #makes debugging easier by giving warning messages

my $int_value = 10;
my $float_value = 3.5;
my $string_value = "20";
my $true_value = 1;
my $false_value = 0;

my @friends = ("Madd", "Ash", "Chase");

my %person_info = (first_name => "Sophie",
			last_name => "Anderson",
			age => 21);		

my $hash_ref = \%person_info;
#accessing/dereferencing
print "Persons first name: $hash_ref->{first_name}\n";

my $sum_int = $int_value + 5;
print "$sum_int\n"; #will print 15

my $sum_mix = $int_value + $float_value;
print "$sum_mix\n"; #will print 13.5 -> perl goes to float automatically

my $division = $int_value / 4;
print "$division\n"; #will print 2.5 -> promotes to float

my $string_sum = $string_value + $int_value;
print "$string_sum\n"; #will print 30 -> Perl coerces "20" to 20

#concatenation
my $concat = $string_value . $int_value;
print "$concat\n"; #will print 2010 -> concat using dot op (.)

#arrays can hold mixed types
my @array_mix = (40, "hello", 78.4, 0);
print "@array_mix\n";