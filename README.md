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

If you are interested in the full list, type this code into the terminal: 

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

------------------------

## IF/ELSE, LOOPS, SWITCH, LOGICAL OPERATORS (PLP-3)
*All code shown in the PLP-3 section is available to run in the `plp3_examples.pl` file!*


### IF/ELSE

For a basic if/else statement, Perl will evaluate the `if` statement first; if it is true, the code block will be executed. If the statement is false, Perl will execute the `else` statement.[^3]

[^3]: [Perl if/elsif/else](https://www.tutorialspoint.com/perl/perl_if_elsif_statement.htm)

For example:

```
my $age = 40;

if ($age >= 18) {
    print "You are old enough to buy lottery tickets! \n";
} else {
    print "You are not old enough to buy lottery tickets:( \n";
}
```

Output:
```
You are old enough to buy lottery tickets!
```

For multiple conditions, the `elsif` (note the spelling!) can be used to check other conditions after `if` and before `else`. 

```
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
```

Output:
```
You failed...
```

Note: In Perl, unlike Python, you can’t chain comparison operators (i.e. 70 <= $grade <= 79). Anytime you want to say “between X and Y,” you must check **both** conditions with && (“and”). 

For example:
```
my $age = 16;

if ($age >= 13 && $age <= 19) {
    print "You are a teenager. \n";
} else {
    print "You are not a teenager. \n";
}
```

Output:
```
You are a teenager.
```

### Short Circuit Logic
Short-circuit means that an expression returns a value before evaluating all the parts in the expression. Perl executes complex boolean expressions according to the [Operator Precedence and Associativity](https://metacpan.org/dist/perl/view/pod/perlop.pod#Operator-Precedence-and-Associativity). If it finds the final answer before it calculated the whole expression, it will return it immediately.[^4]

[^4]: [Perl short-circuit guide + examples](https://perlmaven.com/short-circuit)

This applies to logical AND (&&) and logical OR (||) operators. 

--------------------

#### AND (&&)

```
my $x = 0;
my $y = 5;

if ($x != 0 && $y / $x > 1) {
    print "Error";
}
```

Perl never evaluates $y / $x because $x != 0 is false, so it skips the division (which would cause an error because you are attempting to divide by 0). 

In layman's terms: Perl will evaluate `Condition A` first. If `Condition A` is false, it won't bother checking `Condition B` because the entire expression is now false. If `Condition A` is true, Perl will then evaluate `Condition B`.

----------

#### OR (||)

```
print "Enter your favorite color: ";
chomp(my $color = <STDIN>);

$color = $color || "blue";  

print "Your color is $color!\n";
```

When looking at this code, you can see that if the user presses Enter (chooses to put no input), Perl will short-circuit and use the color "blue".

Again, in layman's terms: Perl will first check `Condition A`. If `Condition A` is true, Perl won't check `Condition B` because the expression is already true. If `Condition A` is false, Perl will check `Condition B`. 

----------

**Some notes about this code (which introduces some unfamilar Perl functions):**

`<STDIN>` stands for Standard Input and is one of Perl’s built-in “filehandles”. This tells Perl to pause the program, wait for user input, and then store that text (including the newline character at the end `\n`).

`chomp()` will get rid of the automatic newline character that is automatically put after user input. This is simply for cleaner and better looking code. It is safe — it only removes a newline _if_ one exists. You are able to use it on scalars ($name) or arrays (@lines) (in arrays it removes the newlines from each item/element).

----------

### What About Switch Cases?

Yes, while Perl can do switch-like behavior, it depends on the version of Perl and how you write it.

Starting in Perl 5.10, a feature called “smart matching” was added, which lets you write switch-like code using `given`, `when`, and `~~`.[^5] You have to enable it explicitly with the line: `use feature "switch";`

In newer versions of Perl (5.18+), `given`/`when`/`~~` are considered experimental. You will get a warning unless you suppress it: `no warnings "experimental::smartmatch";` 

It is not widely used because the smart match operator (~~) can behave differently depending on data types. From my research, most Perl programmers will only use `if`, `elsif`, and `else`, since they’re simpler and easier to use. 

I recommened reading more [here.](https://perlmaven.com/smart-matching-in-perl-5.10)

Here is an example:
```
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
```

Output:
```
You passed? Kinda?
```
_This code can be found in a separate file `plp3_switch_case.pl`._

[^5]:[Smart matching in Perl](https://perlmaven.com/smart-matching-in-perl-5.10)

----------

### PLP-3 Q&A

#### 1. What are the boolean values in Perl? 
Perl doesn’t have a special true or false data type - it decides truth and falsity based on context. Any scalar value (a number, string, or reference) can act as a boolean. Perl automatically converts that value to true or false depending on its content. 

There are only five values that Perl considers false:

| Value    | Meaning | 
|----------|-----|
| 0 | the number zero |
| "0" | the string zero |
| ""  | an empty string |
| undef | an undefined value |
| () | an empty list |

Everything else is true. That includes:

| Valid "true" | Examples | 
|----------|-----|
| Nonzero numbers | 1, -1, 3.14, etc. |
| Nonempty strings | "yes", "no", "true", "false" |
| References | arrays, hashes, etc. |
| Objects | n/a |

#### 2. What types of conditional statements are available Perl? Does it allow for statements other than “if”? 

Yes, Perl has quite a few conditional statements. Here they are summarized:

| Type | Syntax | Description |
|------|---------|-------------|
| `if` | `if (cond) { ... }` | Run code if condition is true |
| `if/else` | `if (...) { ... } else { ... }` | Add an alternative branch |
| `if/elsif/else` | Chain multiple | Multiple possible branches |
| `unless` | `unless (cond) { ... }` | Opposite of `if` (runs when condition is false) |
| Postfix | `print "ok" if $x;` | Short one-line form of `if` |
| `given/when` | `given ($x) { when (...) { ... } }` | Switch-style branching (experimental) |
| Ternary | `cond ? A : B` | Inline conditional expression |


#### 3. How does Perl delimit code blocks under each condition in selection control statements?

Code blocks in selection control statements are delimited using curly braces { }.

#### 4. Does Perl use short-circuit evaluation?
Yes, as shown above in the short-circuit section, Perl does use short-circuit evaluation for its logical operators && (and) and || (or). 

For an example, see above. 

#### 5. How does your programming language deal with the “dangling else” problem?

Perl follows the standard rule from C: An `else` is always paired with the closest preceding unmatched `if`. The best way to avoid this problem is to use braces { } for all blocks, even for single statements. 

#### 6. Does Perl include multiple types of loops (while, do/while, for, foreach)? If so, what are they and how do they differ from each other?

Yes, Perl includes multiple types of loops. Here is a summarized table: 

| Loop Type        | Condition Checked    | Use Case                               | Example |
|-----------------|-------------------|---------------------------------------|---------|
| `while`         | Before iteration   | Repeat until a condition becomes false | `my $i=0; while($i<5){ print "$i\n"; $i++; }` |
| `do/while`      | After iteration    | Run **at least once**, then repeat while true | `my $i=0; do { print "$i\n"; $i++; } while($i<5);` |
| `for` (C-style) | Before iteration   | Counted loop with initialization, condition, increment | `for(my $i=0;$i<5;$i++){ print "$i\n"; }` |
| `foreach` / `for` (Perl list) | Implicit | Iterate over arrays, lists, or ranges | `my @colors = ("red","green"); foreach my $c (@colors){ print "$c\n"; }` |
| Postfix loops   | Implicit           | Concise form for single statements    | `print "$_\n" foreach @colors;` |


#### 8. Are loop code block variables treated differently than function code blocks?

Yes, in Perl, variables declared inside loop code blocks and function (subroutine) code blocks can behave differently depending on scope. 

| Aspect | Loop block variable | Function block variable |
|--------|-------------------|-----------------------|
| Scope | Exists only inside loop iteration/block | Exists only inside function call |
| Lifetime | Recreated on each iteration (if declared with `my`) | Recreated on each function call |
| Defaults | Special variable `$_` in `foreach` | No default; must declare explicitly |
| Global variables | Can be used; persist across iterations | Can be used; persist across calls |

----------














