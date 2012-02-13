#!/bin/sh

test_description="Generate documentation"

. ./sharness.sh

FIXTURES="$TEST_DIRECTORY/fixtures"

test_expect_success "Generate plain text documentation" "
    tomdoc.sh --text '$BUILD_DIR/tomdoc.sh' >result.txt &&
    test_cmp '$FIXTURES/tomdoc.sh.txt' result.txt
"

test_expect_success "Generate markdown documentation" "
    tomdoc.sh --markdown '$BUILD_DIR/tomdoc.sh' >result.md &&
    test_cmp '$FIXTURES/tomdoc.sh.md' result.md
"

test_done
