ACLOCAL_AMFLAGS = -I m4

themedir  = $(datadir)/themes
popdir = $(DESTDIR)$(themedir)/Pop
noktodir  = $(DESTDIR)$(themedir)/Pop-Nokto
popetadir = $(DESTDIR)$(themedir)/Pop-Eta
noktoetadir  = $(DESTDIR)$(themedir)/Pop-Nokto-Eta

SUBDIRS = \
	gtk \
	shell \
	wm \
	extra

EXTRA_DIST = \
	COPYING \
	LICENSE_CC_BY_SA4 \
	README.md

install-data-hook:
	cp -Rv $(EXTRA_DIST) $(popdir)

uninstall-hook:
	test -e $(noktodir) && rm -rfv $(noktodir)
	test -e $(popdir) && rm -rfv $(popdir)
	test -e $(noktetaodir) && rm -rfv $(noktoetadir)
	test -e $(popetadir) && rm -rfv $(popetadir)
