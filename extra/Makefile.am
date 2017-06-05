themedir    = $(datadir)/themes
popdir      = $(DESTDIR)$(themedir)/Pop
noktodir    = $(DESTDIR)$(themedir)/Pop-Dark
popetadir   = $(DESTDIR)$(themedir)/Pop-Slim
noktoetadir = $(DESTDIR)$(themedir)/Pop-Slim-Dark

chromedir         = $(srcdir)/chrome
chrome_file       = $(chromedir)/pop-theme.crx
chrome_nokto_file = $(chromedir)/pop-nokto-theme.crx

plankdir   = $(srcdir)/plank
plank_file = $(plankdir)/dock.theme

telegramdir         = $(srcdir)/telegram
telegram_file       = $(telegramdir)/pop.tdesktop-theme
telegram_nokto_file = $(telegramdir)/pop-nokto.tdesktop-theme

geditdir   = $(srcdir)/gedit
gedit_file = \
	$(geditdir)/pop.xml \
	$(geditdir)/README.md

# ******************
# * Generate files *
# ******************

all:

# *****************
# * Install files *
# *****************

install-data-local:
if ENABLE_CHROME
	$(MKDIR_P) $(popdir)/chrome
	$(MKDIR_P) $(noktodir)/chrome
	cp -Rv $(chrome_file) $(popdir)/chrome
	cp -Rv $(chrome_nokto_file) $(noktodir)/chrome

	cd $(popdir)
	ln -sf ../pop/chrome $(popetadir)/chrome
	ln -sf ../pop-Nokto/chrome $(noktoetadir)/chrome
endif

if ENABLE_PLANK
	$(MKDIR_P) $(popdir)/plank
	cp -Rv $(plank_file) $(popdir)/plank
	cd $(popdir)
	ln -sf ../pop/plank $(noktodir)/plank
	ln -sf ../pop/plank $(popetadir)/plank
	ln -sf ../pop/plank $(noktoetadir)/plank
endif

if ENABLE_TELEGRAM
	$(MKDIR_P) $(popdir)/telegram
	$(MKDIR_P) $(noktodir)/telegram
	cp -Rv $(telegram_file) $(popdir)/telegram
	cp -Rv $(telegram_nokto_file) $(noktodir)/telegram

	cd $(popdir)
	ln -sf ../pop/telegram $(popetadir)/telegram
	ln -sf ../pop-Nokto/telegram $(noktoetadir)/telegram
endif

	$(MKDIR_P) $(popdir)/gedit
	cp -Rv $(gedit_file) $(popdir)/gedit
	cd $(popdir)
	ln -sf ../pop/gedit $(noktodir)/gedit

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_CHROME
	test -e $(noktodir)/chrome && rm -rfv $(noktodir)/chrome
	test -e $(popdir)/chrome && rm -rfv $(popdir)/chrome
	test -e $(noktoetadir)/chrome && rm -rfv $(noktoetadir)/chrome
	test -e $(popetadir)/chrome && rm -rfv $(popetadir)/chrome
endif

if ENABLE_PLANK
	test -e $(noktodir)/plank && rm -rfv $(noktodir)/plank
	test -e $(popdir)/plank && rm -rfv $(popdir)/plank
	test -e $(noktoetadir)/plank && rm -rfv $(noktoetadir)/plank
	test -e $(popetadir)/plank && rm -rfv $(popetadir)/plank
endif

if ENABLE_TELEGRAM
	test -e $(noktodir)/telegram && rm -rfv $(noktodir)/telegram
	test -e $(popdir)/telegram && rm -rfv $(popdir)/telegram
	test -e $(noktoetadir)/telegram && rm -rfv $(noktoetadir)/telegram
	test -e $(popetadir)/telegram && rm -rfv $(popetadir)/telegram
endif

	test -e $(noktodir)/gedit && rm -rfv $(noktodir)/gedit
	test -e $(popdir)/gedit && rm -rfv $(popdir)/gedit

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

DISTCLEANFILES = \
	$(CLEANFILES)
