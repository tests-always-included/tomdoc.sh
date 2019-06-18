#!/bin/sh
# vi: set ft=sh :

test_description="Parse shell variables"

. ./sharness.sh

cat >expect <<EOF
--------------------------------------------------------------------------------
param

Some variable.

EOF

parse() {
    cat >script <<EOF
# Some variable.
$1
EOF

    test_expect_success "Parse '$1'" "
        tomdoc.sh script >result &&
        test_cmp expect result
    "
}

parse 'param=value'
parse 'export param=value'
parse 'export param'
parse ': ${param=value}'
parse ': ${param:=value}'

parse '	param=value	foo=bar	'
parse 'export param=value foo=bar'
parse 'export param foo'
parse ': ${param=value} foo=bar'

parse 'declare param'
parse 'declare param=value'
parse 'declare -r param=value'
parse 'declare -ra param'
parse 'typeset -anythingGoesHere param'

rm expect
touch expect

parse() {
    cat >script <<EOF
# This should not be documented
$1
EOF

    test_expect_success "Parse '$1'" "
        tomdoc.sh script >result &&
        test_cmp expect result
    "
}

parse "sed -i 's/^[Unit\]/&\nWants=something/'"

test_done
