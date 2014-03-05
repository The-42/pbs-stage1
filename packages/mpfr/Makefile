package = mpfr
version = 3.1.2

location = http://www.mpfr.org/$(package)-$(version)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args = \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--with-gmp=$(prefix) \
	--enable-shared \
	--disable-static

install: | $(pkgbuilddir)
	cd $(pkgbuilddir) && ./configure $(conf-args)
	cd $(pkgbuilddir) && $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(MAKE) install

.PHONY: install
