`TOMDOCSH_VERSION`
------------------

Current version of tomdoc.sh.


`SPACE_RE`
----------

Regular expression matching whitespace.


`NOT_SPACE_RE`
--------------

The inverse of the above, must match at least one character


`NAME_RE`
---------

Regular expression matching shell function or variable name.


`safe_echo()`
-------------

Writes content to stdout.  This is replacing the POSIX shell's echo command with the one in the environment that supports flags and options.

* $@ - all arguments are passed to the echo command.

Returns nothing.


`safe_echo_n()`
---------------

Writes content to stdout.  Identical to safe_echo() except this also suppresses newlines.

* $@ - all arguments are passed to the echo command.

Returns nothing.


`uncomment()`
-------------

Strip leading whitespace and '#' from TomDoc strings.

Returns nothing.


`generate_text()`
-----------------

Generate the documentation for a shell function or variable in plain text format and write it to stdout.

* $1 - Function or variable name
* $2 - TomDoc string

Returns nothing.


`generate_markdown()`
---------------------

Generate the documentation for a shell function or variable in markdown format and write it to stdout.

* $1 - Function or variable name
* $2 - TomDoc string

Returns nothing.


`parse_code()`
--------------

Read lines from stdin, look for shell function or variable definition, and print function or variable name if found; otherwise, print nothing.

Returns nothing.


`parse_tomdoc()`
----------------

Read lines from stdin, look for TomDoc'd shell functions and variables, and pass them to a generator for formatting.

Returns nothing.


