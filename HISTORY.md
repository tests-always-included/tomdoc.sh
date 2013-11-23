History
=======

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
