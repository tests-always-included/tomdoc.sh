tomdoc.sh
=========

tomdoc.sh will parse [TomDoc]'d shell scripts and generate pretty documentation
from it. Eventually.

Inspired by [tomdoc.rb].


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

Generate plain text:

    $ tomdoc.sh <shell-script>

Generate markdown:

    $ tomdoc.sh --markdown <shell-script>

For testing, you can run tomdoc.sh on itself:

    $ ./tomdoc.sh tomdoc.sh

The generated output can be seen [here][fixtures].


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
