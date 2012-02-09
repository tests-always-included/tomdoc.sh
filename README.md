tomdoc.sh
=========

tomdoc.sh will parse [TomDoc]'d shell scripts and generate pretty documentation
from it. Eventually.

Inspired by [tomdoc.rb].


Usage
-----

Generate plain text:

    $ tomdoc.sh some_script.sh

Generate markdown:

    $ tomdoc.sh --markdown some_script.sh

For testing, you can run tomdoc.sh on itself:

    $ ./tomdoc.sh tomdoc.sh


License
-------

tomdoc.sh is licensed under the terms of the MIT License. See [LICENSE] file.


Contact
-------

* Web: <https://github.com/mlafeldt/tomdoc.sh>
* Mail: <mathias.lafeldt@gmail.com>
* Twitter: [@mlafeldt](https://twitter.com/mlafeldt)


[LICENSE]: https://github.com/mlafeldt/tomdoc.sh/blob/master/LICENSE
[TomDoc]: http://tomdoc.org
[tomdoc.rb]: https://github.com/defunkt/tomdoc
