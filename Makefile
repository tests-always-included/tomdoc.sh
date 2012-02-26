prefix ?= $(HOME)
bindir ?= $(prefix)/bin

TOMDOCSH_VERSION := $(shell command -v git >/dev/null && \
	git describe --tags --match "v[0-9]*" --abbrev=4 --dirty | cut -c2- || \
	sed -n -e "s/TOMDOCSH_VERSION=\"\(.*\)\"/\1/p" tomdoc.sh)

all:

test: all
	$(MAKE) -C test

install: all
	mkdir -p '$(DESTDIR)$(bindir)'
	sed -e "s/\(TOMDOCSH_VERSION\)=.*/\1=\"$(TOMDOCSH_VERSION)\"/" tomdoc.sh > \
	'$(DESTDIR)$(bindir)/tomdoc.sh'
	chmod 755 '$(DESTDIR)$(bindir)/tomdoc.sh'

uninstall:
	$(RM) '$(DESTDIR)$(bindir)/tomdoc.sh'

.PHONY: all test install uninstall
