### uncomment()

    Strip leading whitespace and '#' from TomDoc strings.

    Returns nothing.

### generate_text()

    Generate the documentation for a shell function in plain text format and write
    it to stdout.

    $1 - Function name
    $2 - TomDoc string

    Returns nothing.

### generate_markdown()

    Generate the documentation for a shell function in markdown format and write
    it to stdout.

    $1 - Function name
    $2 - TomDoc string

    Returns nothing.

### parse_tomdoc()

    Read lines from stdin, look for TomDoc'd shell functions, and pass them to a
    generator for formatting.

    Returns nothing.

