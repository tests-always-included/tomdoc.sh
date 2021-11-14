#!/bin/sh
# vi: set ft=sh :

test_description="Comment parsing and detection"

. ./sharness.sh

parse() {
    echo "$2" >script
    echo 'func() {}' >>script

    if test -n "$3"; then
        echo "--------------------------------------------------------------------------------
func()
" >expect
        echo "$3
" >>expect
    else
        rm expect
        touch expect
    fi

    test_expect_success "Comment parsing: $1" "
        tomdoc.sh script >result &&
        test_cmp expect result
    "
}

parse "Comment with space is valid" "# Test" "Test"

parse "Comment without space is not a comment" "#Test" ""

parse "Multiple lines of comments" "# Line 1
#
# Line 3" "Line 1

Line 3"

parse "Ignore shellcheck" "# Line 1
#
# shellcheck disable=" "Line 1"

test_done
