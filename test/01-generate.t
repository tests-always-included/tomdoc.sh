#!/bin/sh
# vi: set ft=sh :

test_description="Generate documentation"

. ./sharness.sh

FIXTURES="$SHARNESS_TEST_DIRECTORY/fixtures"

test_expect_success "Generate plain text documentation" "
    tomdoc.sh --text '$SHARNESS_BUILD_DIRECTORY/tomdoc.sh' >result.txt &&
    test_cmp '$FIXTURES/tomdoc.sh.txt' result.txt
"

test_expect_success "Generate markdown documentation" "
    tomdoc.sh --markdown '$SHARNESS_BUILD_DIRECTORY/tomdoc.sh' >result.md &&
    test_cmp '$FIXTURES/tomdoc.sh.md' result.md
"

test_done
