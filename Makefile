INSTALL ?= install

prefix ?= $(HOME)
bindir ?= $(prefix)/bin

TOMDOCSH_VERSION := $(shell command -v git >/dev/null && \
	git describe --tags --match "v[0-9]*" --abbrev=4 --dirty | cut -c2- || \
	sed -n "s/TOMDOCSH_VERSION=\"\(.*\)\"/\1/p" tomdoc.sh)

all:

test: all
	$(MAKE) -C test

install: all
	$(INSTALL) -d -m 755 '$(DESTDIR)$(bindir)'
	$(INSTALL) tomdoc.sh '$(DESTDIR)$(bindir)'
	sed "s/\(TOMDOCSH_VERSION\)=.*/\1=\"$(TOMDOCSH_VERSION)\"/" -i '$(DESTDIR)$(bindir)/tomdoc.sh'

uninstall:
	$(RM) '$(DESTDIR)$(bindir)/tomdoc.sh'

.PHONY: all test install uninstall
