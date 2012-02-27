History
=======

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
