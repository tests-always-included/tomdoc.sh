#!/bin/sh

test_description="Generate documentation"

. ./sharness.sh

FIXTURES="$TEST_DIRECTORY/fixtures"

test_expect_success "Generate plain text documentation" "
    tomdoc.sh --text '$BUILD_DIR/tomdoc.sh' >result &&
    test_cmp '$FIXTURES/tomdoc.sh.txt' result
"

test_expect_success "Generate markdown documentation" "
    tomdoc.sh --markdown '$BUILD_DIR/tomdoc.sh' >result &&
    test_cmp '$FIXTURES/tomdoc.sh.md' result
"

test_done
