#!/bin/sh

test_description="Match access level"

. ./sharness.sh

cat >script.sh <<EOF
# Some variable w/o access level.
VAR=0

# Public: Some public variable.
PUBLIC_VAR=1

# Internal: Some internal variable.
INTERNAL_VAR=2

# Deprecated: Some deprecated variable.
DEPRECATED_VAR=3
EOF

cat >expect <<EOF
--------------------------------------------------------------------------------
VAR

Some variable w/o access level.

--------------------------------------------------------------------------------
PUBLIC_VAR

Public: Some public variable.

--------------------------------------------------------------------------------
INTERNAL_VAR

Internal: Some internal variable.

--------------------------------------------------------------------------------
DEPRECATED_VAR

Deprecated: Some deprecated variable.

EOF

test_expect_success "Match everything" "
    tomdoc.sh --text script.sh >result &&
    test_cmp expect result
"

cat >expect <<EOF
--------------------------------------------------------------------------------
PUBLIC_VAR

Public: Some public variable.

EOF

test_expect_success "Match Public" "
    tomdoc.sh --text --access Public script.sh >result &&
    test_cmp expect result
"

cat >expect <<EOF
--------------------------------------------------------------------------------
INTERNAL_VAR

Internal: Some internal variable.

EOF

test_expect_success "Match Internal" "
    tomdoc.sh --text --access Internal script.sh >result &&
    test_cmp expect result
"

cat >expect <<EOF
--------------------------------------------------------------------------------
DEPRECATED_VAR

Deprecated: Some deprecated variable.

EOF

test_expect_success "Match Deprecated" "
    tomdoc.sh --text --access Deprecated script.sh >result &&
    test_cmp expect result
"

test_done
