tomdoc.sh
=========

tomdoc.sh will parse [TomDoc]'d shell scripts and generate pretty documentation
from it.

TomDoc for shell? - Absolutely. Even though TomDoc was originally specified to
document Ruby code, it turns out to be a good fit for shell scripts too. Proof:

```sh
# Public: Current API version in format "x.y.z".
export API_VERSION="1.2.3"

# Public: Execute commands in debug mode.
#
# Takes a single argument and evaluates it only when the test script is started
# with --debug. This is primarily meant for use during the development of test
# scripts.
#
# $1 - Commands to be executed.
#
# Examples
#
#   test_debug "cat some_log_file"
#
# Returns the exit code of the last command executed in debug mode or 0
#   otherwise.
test_debug() {
	test "$debug" = "" || eval "$1"
}
```

Passing the above to tomdoc.sh results in:

### API_VERSION

    Public: Current API version in format "x.y.z".

### test_debug()

    Public: Execute commands in debug mode.

    Takes a single argument and evaluates it only when the test script is started
    with --debug. This is primarily meant for use during the development of test
    scripts.

    $1 - Commands to be executed.

    Examples

      test_debug "cat some_log_file"

    Returns the exit code of the last command executed in debug mode or 0
      otherwise.

For maximum portability, tomdoc.sh was written in POSIX shell and only depends
on ubiquitous Unix tools like `sed(1)` and `grep(1)`.

The project was inspired by [tomdoc.rb].


Installation
------------

Installing tomdoc.sh is simple:

    $ git clone git://github.com/mlafeldt/tomdoc.sh.git
    $ cd tomdoc.sh
    $ make install

That will install tomdoc.sh to `$HOME/bin` by default. For a different target
directory, set `bindir` accordingly, e.g.

    # make install bindir=/usr/local/bin


Usage
-----

    Usage: tomdoc.sh [options] [--] [<shell-script>...]

        -h, --help               show help text
        --version                show version
        -t, --text               produce plain text (default format)
        -m, --markdown           produce markdown
        -a, --access <level>     filter by access level

For each TomDoc'd shell script you pass to tomdoc.sh, it will produce pretty
documentation in plain text (option `--text`, the default) or markdown format
(`--markdown`), writing the results to the standard output.

With `--access`, output can be limited to shell functions and variables
documented as "Public", "Internal", or "Deprecated".

The `<shell-script>` operands are processed in command-line order. If
`<shell-script>` is a single dash (-) or absent, tomdoc.sh reads from the
standard input.

For testing, you can run tomdoc.sh on itself:

    $ ./tomdoc.sh --text tomdoc.sh
    $ ./tomdoc.sh --markdown tomdoc.sh

The generated output can be seen [here][fixtures].


Tests
-----

The `test` folder contains some automated test scripts powered by [Sharness].

You can run the tests this way:

    $ make test


License
-------

* tomdoc.sh is licensed under the terms of the MIT License. See [LICENSE] file.
* [Sharness] and all tests are licensed under the terms of the GNU General
  Public License version 2 or higher. See file [COPYING] for full license text.


Contact
-------

* Web: <https://github.com/mlafeldt/tomdoc.sh>
* Mail: <mathias.lafeldt@gmail.com>
* Twitter: [@mlafeldt](https://twitter.com/mlafeldt)


[COPYING]: https://github.com/mlafeldt/tomdoc.sh/blob/master/test/COPYING
[LICENSE]: https://github.com/mlafeldt/tomdoc.sh/blob/master/LICENSE
[Sharness]: https://github.com/mlafeldt/Sharness
[TomDoc]: http://tomdoc.org
[fixtures]: https://github.com/mlafeldt/tomdoc.sh/tree/master/test/fixtures
[tomdoc.rb]: https://github.com/defunkt/tomdoc
