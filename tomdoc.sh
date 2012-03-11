#!/bin/sh
#/ Usage: tomdoc.sh [--text | --markdown] [--access <level>] [<shell-script>...]
#/
#/ Parse TomDoc'd shell scripts and generate pretty documentation from it.
#
# Written by Mathias Lafeldt <mathias.lafeldt@gmail.com>

set -e
test -n "$TOMDOCSH_DEBUG" && set -x

# Current version of tomdoc.sh.
TOMDOCSH_VERSION="0.1.2"

generate=generate_text
access=

while test "$#" -ne 0; do
    case "$1" in
    -h|--h|--he|--hel|--help)
        grep '^#/' <"$0" | cut -c4-; exit 0 ;;
    --version)
        echo "tomdoc.sh version $TOMDOCSH_VERSION"; exit 0 ;;
    -t|--t|--te|--tex|--text)
        generate=generate_text; shift ;;
    -m|--m|--ma|--mar|--mark|--markd|--markdo|--markdow|--markdown)
        generate=generate_markdown; shift ;;
    -a|--a|--ac|--acc|--acce|--acces|--access)
        test "$#" -ge 2 || { echo >&2 "error: $1 requires an argument"; exit 1; }
        access="$2"; shift 2 ;;
    --)
        shift; break ;;
    -|[!-]*)
        break ;;
    -*)
        echo >&2 "error: invalid option '$1'"; exit 1 ;;
    esac
done


# Regular expression matching whitespace.
SPACE_RE='[[:space:]]*'
# Regular expression matching shell function or variable name.
NAME_RE='[a-zA-Z_][a-zA-Z0-9_]*'

# Strip leading whitespace and '#' from TomDoc strings.
#
# Returns nothing.
uncomment() {
    sed -e "s/^$SPACE_RE# \{0,1\}//"
}

# Generate the documentation for a shell function or variable in plain text
# format and write it to stdout.
#
# $1 - Function or variable name
# $2 - TomDoc string
#
# Returns nothing.
generate_text() {
    cat <<EOF
--------------------------------------------------------------------------------
$1

$(echo "$2" | uncomment)

EOF
}

# Generate the documentation for a shell function or variable in markdown format
# and write it to stdout.
#
# $1 - Function or variable name
# $2 - TomDoc string
#
# Returns nothing.
generate_markdown() {
    cat <<EOF
### $1

$(echo "$2" | uncomment | sed -e "/^$/!s/^/    /")

EOF
}

# Read lines from stdin, look for shell function or variable definition, and
# print function or variable name if found; otherwise, print nothing.
#
# Returns nothing.
parse_code() {
    sed -n \
        -e "s/^$SPACE_RE\(function\)\{0,1\}$SPACE_RE\($NAME_RE\)$SPACE_RE().*$/\2()/p" \
        -e "s/^$SPACE_RE\(export\)\{0,1\}$SPACE_RE\($NAME_RE\)=.*$/\2/p"
}

# Read lines from stdin, look for TomDoc'd shell functions and variables, and
# pass them to a generator for formatting.
#
# Returns nothing.
parse_tomdoc() {
    doc=
    while read -r line; do
        case "$line" in
        '#'|'# '*)
            doc="$doc$line
"
            ;;
        *)
            test -n "$line" -a -n "$doc" && {
                # Match access level if given.
                test -n "$access" &&
                case "$doc" in
                "# $access:"*)
                    ;;
                *)
                    doc=; continue ;;
                esac

                name="$(echo "$line" | parse_code)"
                test -n "$name" && "$generate" "$name" "$doc"
            }
            doc=
            ;;
        esac
    done
}

cat -- "$@" | parse_tomdoc

:
