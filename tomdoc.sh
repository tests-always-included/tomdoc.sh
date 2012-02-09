#!/bin/sh
# Parse TomDoc'd shell scripts and generate pretty documentation from it
#
# Written by Mathias Lafeldt <mathias.lafeldt@gmail.com>

generate=generate_text

while test "$#" -ne 0; do
    case "$1" in
    -t|--t|--te|--tex|--text)
        generate=generate_text
        shift ;;
    -m|--m|--ma|--mar|--mark|--markd|--markdo|--markdow|--markdown)
        generate=generate_markdown
        shift ;;
    [!-]*)
        break ;;
    *)
        echo >&2 "error: invalid option '$1'"
        exit 1
        ;;
    esac
done

file="$1"
test -n "$file" || {
    echo >&2 "error: filename missing"
    exit 1
}


generate_text() {
    cat <<EOF
--------------------------------------------------------------------------------
$1

$2
EOF
}

generate_markdown() {
    cat <<EOF
### $1

$(echo "$2" | sed 's/^/    /')
EOF
}

parse_tomdoc() {
    doc=
    while read -r line; do
        case "$line" in
        '#'|'# '*)
            line="${line#\#}"
            line="${line# }"
            doc="$doc$line
"
            ;;
        '')
            doc=
            ;;
        [!#]*)
            test -n "$doc" && {
                # XXX only support functions for now
                func="$(expr "$line" : '\([a-zA-Z_]*\)[ \t]*()')" &&
                "$generate" "$func()" "$doc"
                doc=
            }
            ;;
       esac
    done
}

cat -- "$file" | parse_tomdoc
