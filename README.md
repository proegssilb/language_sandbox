
The Language Sandbox
--------------------

This is the Erlang portion of Droogans' Language Sandbox. Consider this repo an
excuse to get hands-on experience with Erlang before I do something significant
with it.

Contents
--------

### Rosalind ###
A collection of problems from http://rosalind.info/ . Most involve string
processing in some way, but many also involve other mathematical concepts
(such as graphs).

Conventions
----------

1. Trivial cases may not be runnable as a program. Many Erlang examples are
like this.

2. If I decide to make something runnable, it will be via the main() function.

3. If a module ends in "lib", it is intended as a library.

4. Erlang is not typically a fast language. The programs herein will not be
written for speed. They will either be written for comprehendability,
convenience, or to demonstrate a particular language feature.

5. Lists of characters are to be avoided in favor of either bitstrings or
a string library datatype.

6. If unit testing is included, it will be a "test" function containing a 
series of pattern-matching equalities, ie expectedRV = function(arg1, ...)

