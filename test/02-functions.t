#!/bin/sh
# vi: set ft=sh :

test_description="Parse shell functions"

. ./sharness.sh

cat >expect <<EOF
--------------------------------------------------------------------------------
func()

Some function.

EOF

parse() {
    cat >script <<EOF
# Some function.
$1
EOF

    test_expect_success "Parse '$1'" "
        tomdoc.sh script >result &&
        test_cmp expect result
    "
}

parse 'func()'
parse 'func() {}'
parse 'function func()'
parse '	function	func	()	'

test_done
