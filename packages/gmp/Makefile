package = gmp
version = 5.1.2

location = http://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args = \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--disable-static \
	--enable-cxx

install: | $(pkgbuilddir)
	cd $(pkgbuilddir) && ./configure $(conf-args)
	cd $(pkgbuilddir) && $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(MAKE) install

.PHONY: install
