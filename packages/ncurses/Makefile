package = ncurses
version = 5.9

location = http://ftp.gnu.org/pub/gnu/$(package)
tarballs = $(package)-$(version).tar.gz

include packages/all-package.mk

conf-args = \
	--with-shared \
	--enable-rpath \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man

install: | $(pkgbuilddir)
	cd $(pkgbuilddir) && $(env) ./configure $(conf-args)
	cd $(pkgbuilddir) && $(env) $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(env) $(MAKE) install

.PHONY: install
