# Beginner Perl Project (PLP)
_CS 330 - Organization and Structure of Programming Languages_  
_Fall 2025_

This repository contains my work for a semester-long project focused on exploring programming languages: how they work, what they have in common, and how they differ. For this project, I chose to learn **Perl**, a language I am not familar with and have not programmed in before. My goal for this project is to create a beginner/intermediate level tutorial for students who are already proficient in at least one language and have acquired basic programming knowledge. 

------------------------

## Brief History of Perl

Perl was created by Larry Wall in 1987 to help make system administration and text processing easier. It started out as a Unix scripting tool, but it quickly grew in popularity for its powerful regular expression capabilities and flexibility. Throughout the 1990s and early 2000s, Perl became widely used for web development, network programming, and bioinformatics, which earned it the nickname [“the Swiss Army chainsaw"](https://en.wikipedia.org/wiki/Perl) of programming languages due to its versatility.

The release of Perl 5 in 1994 introduced features such as modules and references which solidified its place as a handy and robust language. Development of Perl 6 (now known as [Raku](https://raku.org/)) began in the early 2000s as a sister language, while Perl 5 continues to be maintained and widely used today.

### Popular Projects Using Perl

Many familiar names in tech/web development use Perl in their tech stack.[^1] 

**Craigslist** - Website with classified advertisements with sections devoted to jobs, housing, for sale, items wanted, services, community service, gigs, résumés, and discussion forums

**IMDb** - Online database of information related to films, television series, podcasts, home videos, video games, and streaming content online

**DuckDuckGo** - Privacy-focused search engine and web browser that offers an alternative to traditional search engines like Google

**TicketMaster** - World's largest ticket selling company

**Frozen Bubble** - Popular online game made in the 2000's, originally programmed in Perl

Honorable mention: [How Perl Saved the Human Genome Project](https://bioperl.org/articles/How_Perl_saved_human_genome.html)


[^1]: [Top 10 Startups using Perl](https://blog.back4app.com/startups-using-perl/)

------------------------

## Syntax

Perl has around 100 reserved words: `if, else, elsif, while, for, foreach, package, use, my, sub, return, next, last, redo, given, when, default, die, print`, and more. 

Run this code to check: 

`perl -e 'print join("\n", sort keys %Perl::Keywords::);'`

## Variable Naming

Perl variable names _must_ start with either a **letter** or an **underscore**. After, it can include **digits, letters, and underscores.** Variable names are case sensitive and always start with a sigil ($ for scalars, @ for arrays, % for hashes).

When using `use strict;`, variables must be declared with `my`, `our`, or `local`.

## Naming Conventions

While there are no stylistic enforcements in Perl, community conventions include using snake_case for variables/subroutines and ALL_CAPS for constants.  
## Types & Mutability

Perl is _dynamically_ and _weakly typed_, as well as _implicitly typed_. All variables are also mutable by default. 

## Operators

Numbers (int/float): `+ - * / % ** ++ –`

Strings: `. (concatenation), x (repeat), eq, ne, lt, gt, cmp`

Boolean: ``&& (and) ` ``

Arrays: `@array, $array[index], push, pop, shift, unshift, join, split, sort`

Hashes: `%hash, $hash{key}, keys, values, each, delete, exists`

Perl also allows for mixed type operations. It performs automatic type conversion based on context, meaning if it doesn’t make sense, Perl issues a warning but still tries to interpret the expression.[^2]

[^2]: [Perl basics](https://www.cs.unc.edu/~jbs/resources/perl/perl-basics.html)

## Binding

### Identifier Names:

Compile-time (Parsing): Basic identifier names for variables, subroutines, and packages are recognized and their associated symbol table entries are created or located during the parsing phase. The type prefix ($, @, %, & for subroutines) determines the type of the symbol.

Run-time (Symbolic Dereferencing): While most identifiers are bound at compile time, Perl allows for symbolic dereferencing, where the name of a variable or subroutine can be determined dynamically at run-time from a string. 

### Operator Symbols

Compile-time (Parsing and Precedence): Operator symbols (e.g., +, -, *, ==, eq, =~) are recognized during the parsing phase. Perl's parser uses its built-in operator precedence rules to determine the order of operations and how operands bind to operators.

Compile-time (Context): The context in which an operator is used (scalar, list, or void context) can also influence its behavior and, in some cases, how its operands are evaluated or what value it returns. This context is determined at compile time.

Run-time (Binding Operators): Operators like the binding operator =~ (and its inverse !~) explicitly bind a scalar expression (the left operand) to a regular expression operation (the right operand) at run-time. The actual pattern matching or substitution operation then occurs when the expression is evaluated.
