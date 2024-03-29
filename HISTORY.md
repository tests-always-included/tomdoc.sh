History
=======

0.1.10 (2022-03-29)
-------------------

* Tracked changes in HISTORY.
*

0.1.9 (2021-11-15)
------------------

* Ignore `# shellcheck` directives.
* Added support for `declare` and `typeset`, then fixed patterns for Mac.
* Reformatted code, added lint checks, added config files for tooling to help with development.
* Added notes to watch out for issues when using Mac's built-in `sed`.

0.1.8 (2018-03-12)
------------------

* Bash functions may use most character, so the pattern to match function names
  was updated. See issue #8.
* Variable names are more restrictive than function names, so a separate
  pattern was made to match those instead of reusing the function name pattern.
* BSD `sed` will always add a newline, so add workarounds to remove that
  newline.
* Removed `safe_echo` and `safe_echo_n` and use `printf` instead.

0.1.7 (2016-08-22)
------------------

* Fixed a problem that happens when lines contain escape codes that the POSIX
  version of `echo` honors.

0.1.6 (2016-08-04)
------------------

* Transferred to the `tests-always-included` organization on GitHub.
* Improved the generated markdown

0.1.5 (2013-11-23)
------------------

* Update to Sharness v0.3.0.
* Let Travis only test master branch and pull requests.

0.1.4 (2012-04-08)
------------------

* Support TomDoc'd `export parameter` without assignment.
* Support TomDoc'd `: ${parameter:=value}` and `: ${parameter=value}`.
* Add dedicated parsing tests.

0.1.3 (2012-03-15)
------------------

* Allow to filter TomDoc'd functions and variables by access level (via
  `--access`). For example, with "--access Public" only TomDoc strings starting
  with "Public:" are processed.
* Let Travis CI use Erlang workers and run `prove(1)`.
* Update to Sharness v0.2.1.

0.1.2 (2012-02-27)
------------------

* Support TomDoc'd shell variables.
* Use `sed(1)` in a portable way.
* Allow to read from multiple files and standard input.
* Add Makefile to install or uninstall tomdoc.sh.
* Add Travis CI config.

0.1.1 (2012-02-16)
------------------

* Improve TomDoc and function name parsing. Support Bash's `function` keyword.
* Simplify doc generation.
* Add options `--help` and `--version`.
* Set shell option -e. Set -x when `TOMDOCSH_DEBUG` is defined in environment.
* Save test results to different files for debugging.

0.1.0 (2012-02-09)
------------------

* First version. Allows to generate documentation for TomDoc'd shell functions
  in (ugly) plain text or (ugly) markdown.
