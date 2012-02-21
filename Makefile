INSTALL ?= install

prefix ?= $(HOME)
bindir ?= $(prefix)/bin

all:

install: all
	$(INSTALL) -d -m 755 '$(DESTDIR)$(bindir)'
	$(INSTALL) tomdoc.sh '$(DESTDIR)$(bindir)'

uninstall:
	$(RM) '$(DESTDIR)$(bindir)/tomdoc.sh'
