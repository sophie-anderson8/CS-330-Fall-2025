# Beginner Perl Project (PLP)
_CS 330 - Organization and Structure of Programming Languages_  
_Fall 2025_

This repository contains my work for a semester-long project focused on exploring programming languages: how they work, what they have in common, and how they differ. For this project, I chose to learn **Perl**, a language I am not familar with and have not programmed in before. My goal for this project is to create a beginner/intermediate level tutorial for students who are already proficient in at least one language and have acquired basic programming knowledge. 

---

## Table of Contents

### INTRO
[Brief History of Perl](#brief-history-of-perl)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Popular Projects Using Perl](#popular-projects-using-perl)

### I.
[Syntax](#syntax)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Variable Naming](#variable-naming) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Naming Conventions](#naming-conventions) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Types & Mutability](#types--mutability) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Operators](#operators)

### II. 
[Binding](#binding) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Identifier Names](#identifier-names) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Operator Symbols](#operator-symbols)

### III. 
[IF/ELSE, LOOPS, SWITCH, LOGICAL OPERATORS](#ifelse-loops-switch-logical-operators-plp-3)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[IF/ELSE](#ifelse) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Beyond IF/ELSE](#beyond-ifelse) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Dangling Else Problem](#dangling-else-problem) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Short Circuit Logic](#short-circuit-logic)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[AND (&&)](#and-)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OR (||)](#or-)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Switch Cases](#what-about-switch-cases)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean Values](#boolean-values)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delimiting Code Blocks](#delimiting-code-blocks)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Loops in Perl](#loops-in-perl)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Scope of Loop vs Function Variables](#scope-of-loop-vs-function-variables)


### IV. 
[Functions and Subprograms (PLP-4)](#functions-and-subprograms-plp-4) <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Declaring a Function](#declaring-a-function-in-perl)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Where Functions Must Appear](#where-do-functions-have-to-be-in-the-file)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Passing Arguments](#passing-arguments-into-functions)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Returning Values](#returning-values)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Recursive Functions](#recursive-functions)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Returning Multiple Values](#returning-multiple-values)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Pass-by-value vs Pass-by-reference](#pass-by-value-pass-by-reference)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Preventing Modification](#how-to-prevent-accidental-modification)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Explicit References](#explicit-pass-by-reference-with-backslashes)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Where Variables Are Stored](#where-are-variables-stored)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Scoping Rules](#scoping-rules)  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Side Effects](#side-effects)

---


# Brief History of Perl

Perl was created by Larry Wall in 1987 to help make system administration and text processing easier. It started out as a Unix scripting tool, but it quickly grew in popularity for its powerful regular expression capabilities and flexibility. Throughout the 1990s and early 2000s, Perl became widely used for web development, network programming, and bioinformatics, which earned it the nickname [“the Swiss Army chainsaw"](https://en.wikipedia.org/wiki/Perl) of programming languages due to its versatility.

The release of Perl 5 in 1994 introduced features such as modules and references which solidified its place as a handy and robust language. Development of Perl 6 (now known as [Raku](https://raku.org/)) began in the early 2000s as a sister language, while Perl 5 continues to be maintained and widely used today.

## Popular Projects Using Perl

Many familiar names in tech/web development use Perl in their tech stack.[^1] 

**Craigslist** - Website with classified advertisements with sections devoted to jobs, housing, for sale, items wanted, services, community service, gigs, résumés, and discussion forums

**IMDb** - Online database of information related to films, television series, podcasts, home videos, video games, and streaming content online

**DuckDuckGo** - Privacy-focused search engine and web browser that offers an alternative to traditional search engines like Google

**TicketMaster** - World's largest ticket selling company

**Frozen Bubble** - Popular online game made in the 2000's, originally programmed in Perl

Honorable mention: [How Perl Saved the Human Genome Project](https://bioperl.org/articles/How_Perl_saved_human_genome.html)


[^1]: [Top 10 Startups using Perl](https://blog.back4app.com/startups-using-perl/)


---

# Syntax

Perl has around 100 reserved words: `if, else, elsif, while, for, foreach, package, use, my, sub, return, next, last, redo, given, when, default, die, print`, and more. 

If you are interested in the full list, type this code into the terminal: 

`perl -e 'print join("\n", sort keys %Perl::Keywords::);'`

# Variable Naming

Perl variable names _must_ start with either a **letter** or an **underscore**. After, it can include **digits, letters, and underscores.** Variable names are case sensitive and always start with a sigil ($ for scalars, @ for arrays, % for hashes).

When using `use strict;`, variables must be declared with `my`, `our`, or `local`.

# Naming Conventions

While there are no stylistic enforcements in Perl, community conventions include using snake_case for variables/subroutines and ALL_CAPS for constants.  

# Types & Mutability

Perl is _dynamically_ and _weakly typed_, as well as _implicitly typed_. All variables are also mutable by default. 

# Operators

Numbers (int/float): `+ - * / % ** ++ –`

Strings: `. (concatenation), x (repeat), eq, ne, lt, gt, cmp`

Boolean: ``&& (and) ` ``

Arrays: `@array, $array[index], push, pop, shift, unshift, join, split, sort`

Hashes: `%hash, $hash{key}, keys, values, each, delete, exists`

Perl also allows for mixed type operations. It performs automatic type conversion based on context, meaning if it doesn’t make sense, Perl issues a warning but still tries to interpret the expression.[^2]

[^2]: [Perl basics](https://www.cs.unc.edu/~jbs/resources/perl/perl-basics.html)

---

# Binding

## Identifier Names:

Compile-time (Parsing): Basic identifier names for variables, subroutines, and packages are recognized and their associated symbol table entries are created or located during the parsing phase. The type prefix ($, @, %, & for subroutines) determines the type of the symbol.

Run-time (Symbolic Dereferencing): While most identifiers are bound at compile time, Perl allows for symbolic dereferencing, where the name of a variable or subroutine can be determined dynamically at run-time from a string. 

## Operator Symbols

Compile-time (Parsing and Precedence): Operator symbols (e.g., +, -, *, ==, eq, =~) are recognized during the parsing phase. Perl's parser uses its built-in operator precedence rules to determine the order of operations and how operands bind to operators.

Compile-time (Context): The context in which an operator is used (scalar, list, or void context) can also influence its behavior and, in some cases, how its operands are evaluated or what value it returns. This context is determined at compile time.

Run-time (Binding Operators): Operators like the binding operator =~ (and its inverse !~) explicitly bind a scalar expression (the left operand) to a regular expression operation (the right operand) at run-time. The actual pattern matching or substitution operation then occurs when the expression is evaluated.

---

# IF/ELSE, LOOPS, SWITCH, LOGICAL OPERATORS (PLP-3)
*All code shown in the PLP-3 section is available to run in the `plp3_examples.pl` file!*


## IF/ELSE

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

-----

## Beyond IF/ELSE

Perl has multiple types of conditional statements beyond simple `if`. They include:

| Type | Syntax | Description |
|------|--------|-------------|
| `if` | `if (cond) { ... }` | Run code if condition is true |
| `if/else` | `if (...) { ... } else { ... }` | Add an alternative branch |
| `if/elsif/else` | Chain multiple | Multiple possible branches |
| `unless` | `unless (cond) { ... }` | Opposite of `if` (runs when condition is false) |
| Postfix | `print "ok" if $x;` | Short one-line form of `if` |
| `given/when` | `given ($x) { when (...) { ... } }` | Switch-style branching (experimental) |
| Ternary | `cond ? A : B` | Inline conditional expression |


---

## Dangling Else Problem
Perl follows the standard rule from C: an `else` is paired with the closest preceding unmatched `if`. Use curly braces `{ }` for all blocks to avoid ambiguity.

---


## Short Circuit Logic
Short-circuit means that an expression returns a value before evaluating all the parts in the expression. Perl executes complex boolean expressions according to the [Operator Precedence and Associativity](https://metacpan.org/dist/perl/view/pod/perlop.pod#Operator-Precedence-and-Associativity). If it finds the final answer before it calculated the whole expression, it will return it immediately.[^4]

[^4]: [Perl short-circuit guide + examples](https://perlmaven.com/short-circuit)

This applies to logical AND (&&) and logical OR (||) operators. If the first condition determines the result, the second condition is not evaluated.

---


### AND (&&)

```
my $x = 0;
my $y = 5;

if ($x != 0 && $y / $x > 1) {
    print "Error";
}
```

Perl never evaluates $y / $x because $x != 0 is false, so it skips the division (which would cause an error because you are attempting to divide by 0). 

In layman's terms: Perl will evaluate `Condition A` first. If `Condition A` is false, it won't bother checking `Condition B` because the entire expression is now false. If `Condition A` is true, Perl will then evaluate `Condition B`.

---

### OR (||)

```
print "Enter your favorite color: ";
chomp(my $color = <STDIN>);

$color = $color || "blue";  

print "Your color is $color!\n";
```

When looking at this code, you can see that if the user presses Enter (chooses to put no input), Perl will short-circuit and use the color "blue".

Again, in layman's terms: Perl will first check `Condition A`. If `Condition A` is true, Perl won't check `Condition B` because the expression is already true. If `Condition A` is false, Perl will check `Condition B`. 

---

**Some notes about this code (which introduces some unfamilar Perl functions):**

`<STDIN>` stands for Standard Input and is one of Perl’s built-in “filehandles”. This tells Perl to pause the program, wait for user input, and then store that text (including the newline character at the end `\n`).

`chomp()` will get rid of the automatic newline character that is automatically put after user input. This is simply for cleaner and better looking code. It is safe — it only removes a newline _if_ one exists. You are able to use it on scalars ($name) or arrays (@lines) (in arrays it removes the newlines from each item/element).

---

## What About Switch Cases?

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

---

## Boolean Values
Perl doesn’t have a special true or false data type - it decides truth and falsity based on context. Any scalar value (a number, string, or reference) can act as a boolean. Perl automatically converts that value to true or false depending on its content.

There are only five values that Perl considers false:

| Value    | Meaning | 
|----------|---------|
| 0        | the number zero |
| "0"     | the string zero |
| ""      | an empty string |
| undef    | an undefined value |
| ()       | an empty list |

Everything else is true. That includes:

| Valid "true" | Examples | 
|---------------|---------|
| Nonzero numbers | 1, -1, 3.14, etc. |
| Nonempty strings | "yes", "no", "true", "false" |
| References | arrays, hashes, etc. |
| Objects | n/a |

---

## Delimiting Code Blocks
Perl uses curly braces `{ }` to delimit code blocks for all conditional and selection statements.

---

## Loops in Perl
Perl provides multiple types of loops:

| Loop Type        | Condition Checked    | Use Case                               | Example |
|-----------------|-------------------|---------------------------------------|---------|
| `while`         | Before iteration   | Repeat until a condition becomes false | `my $i=0; while($i<5){ print "$i\n"; $i++; }` |
| `do/while`      | After iteration    | Run **at least once**, then repeat while true | `my $i=0; do { print "$i\n"; $i++; } while($i<5);` |
| `for` (C-style) | Before iteration   | Counted loop with initialization, condition, increment | `for(my $i=0;$i<5;$i++){ print "$i\n"; }` |
| `foreach` / `for` (Perl list) | Implicit | Iterate over arrays, lists, or ranges | `my @colors = ("red","green"); foreach my $c (@colors){ print "$c\n"; }` |
| Postfix loops   | Implicit           | Concise form for single statements    | `print "$_\n" foreach @colors;` |

---

## Scope of Loop vs Function Variables
Variables declared inside loop blocks and function blocks can behave differently.

| Aspect | Loop block variable | Function block variable |
|--------|-------------------|-----------------------|
| Scope | Exists only inside loop iteration/block | Exists only inside function call |
| Lifetime | Recreated on each iteration (if declared with `my`) | Recreated on each function call |
| Defaults | Special variable `$_` in `foreach` | No default; must declare explicitly |
| Global variables | Can be used; persist across iterations | Can be used; persist across calls |

---

# Functions and Subprograms (PLP-4)
*All code shown in the PLP-4 section is available to run in the `function_examples.pl` file!*

In Perl, functions are created using the keyword sub. Functions can accept parameters, return values, call themselves recursively, and even modify variables in the calling scope (depending on how the arguments are passed - more on this later...).

This section walks through how Perl handles functions: how to declare them, how arguments work, how return values work, and what it means that Perl uses “aliasing” instead of simple pass-by-value.

---

## Declaring a Function in Perl

You declare a function using the keyword `sub`, followed by the function name and a code block:

```
sub greet {
    print "Hello World!\n";
}
```

To call the function, write its name followed by parantheses:
```
greet();
```

---

## Where Do Functions Have to Be in the File?

In Perl, functions must be declared before they are called, UNLESS you:
- add the line `use subs qw(function_name);`, or
- place your functions above the main script (most common practice).

To keep things clean and predictable, the `function_examples.pl` file places all function definitions before the call.

---

## Passing Arguments into Functions

Perl does not automatically name function parameters (unlike Python). Instead, all arguments are stored in a special built-in array: `@_`.

For example:
```
sub multiply {
    my ($a, $b) = @_;   # @_ contains all arguments
    return $a * $b;
}

my $result = multiply(6, 7);
print "$result\n";
```

Output:
```
42
```

Let's break down what's happening:

- `@_` is the list of parameters passed to the function
- `my ($a, $b) = @_` copies those values into local variables
- the function returns `$a * $b`

The use of `@_` is one of the biggest "Perl-isms" that beginner Perl programmers must learn.

---

## Returning Values

In Perl, the value returned is simply the value produced by return:

```
return $value;
```

Perl can also return multiple values at once (more on that below)...

---

## A Function That Multiplies Two Numbers

```
sub multiply {
    my ($x, $y) = @_;     # Take two arguments from @_
    return $x * $y;       # Return the product
}

my $product = multiply(4, 5);
print "4 * 5 = $product\n";
```

Output:
```
4 * 5 = 20
```

---

## Recursive Functions 

Perl fully supports recursion:

```
sub factorial {
    my ($n) = @_;            

    die "Negative input!\n" if $n < 0;  # Error handling

    return 1 if $n == 0;               # Base case

    return $n * factorial($n - 1);     # Recursive call
}

my $fact5 = factorial(5);
print "5! = $fact5\n";
```

Output:
```
5! = 120
```

As with Python or R, recursion continues until the base case is reached. 

---

## Returning Multiple Values

A Perl function can return a list, which can be captured in separate variables:

```
sub split_into_two {
    my ($word, $index) = @_;

    my $left  = substr($word, 0, $index);
    my $right = substr($word, $index);

    return ($left, $right);     # Return TWO values
}

my ($w1, $w2) = split_into_two("abcdef", 3);

print "$w1 | $w2\n";
```

Output:
```
abc | def
```

Perl does not require tuples; returninh lists is built-in.

---

## Pass-by-value? Pass-by-reference?

This is where Perl gets a bit tricky... Perl passes arguments by **alias**, which means:
- `@_` does not contain copies of the arguments
- Instead, `@_` contains aliases to the caller’s variables
- Modifying `$_[0]` will modify the original variable in the caller

For example:
```
sub try_modify {
    $_[0] = "changed";     # changes variable in the caller!
}

my $word = "original";
try_modify($word);

print "$word\n";
```

Output:
```
changed
```

Because Perl aliases arguments internally, the language behaves like pass-by-reference unless you copy the values yourself. 

---

## How to Prevent Accidental Modification

To make parameters local copies, assign them to lexical variables:

```
sub safe_modify {
    my ($x) = @_;      # This copies the value
    $x = "new value";  # Changes local copy only
    return $x;
}

my $val = "hello";
safe_modify($val);

print "$val\n";
```

Output:
```
hello
```

This is considered the "safe" way to write functions.

---

## Explicit Pass-by-reference With Backslashes

You can intentionally pass references (like pointers):

```
sub increment {
    my ($ref) = @_;
    $$ref++;         # $$ref dereferences the scalar reference
}

my $num = 10;
increment(\$num);

print "$num\n";
```

Output:
```
11
```

Perl references look like C pointers or Python objects, but must be dereferenced explicitly `($$ref)`.

---

## Where Are Variables Stored?

**Scalars, arrays, and hashes declared with `my` live on the stack.**

If you take a reference to something, Perl may store referenced data on the heap behind the scenes.

Very simple version for beginners:
- Local variables (`my`) -> stored on the stack
- Referenced data -> stored on the heap
- Arguments -> aliases to caller's variables (stack locations)

---

## Scoping Rules

Perl uses lexical scoping when `my` is used:
```
my $x = 10;
```

A variable declared with `my`:
- is visible only inside the block of function where it is declared
- is destroyed once it goes out of scope
- does not leak into the rest of the file

This is similar to Python block/function scope.

Perl also has `local`, which temporarily changes global variables, but `my` is more commonly used.

---

## Side Effects

Side effects *are possible* because:
- modifying `$_[0]` changes caller's variables
- modifying global variables affects entire program
- references allow indirect modification of data structures

No built-in "guard rails" exist beyond:
-  `use strict;` (forces variable declarations)
-  copying values from `@_` (`my ($x) = @_`)

---



