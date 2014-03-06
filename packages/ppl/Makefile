package = ppl
version = 1.0

location = http://bugseng.com/products/$(package)/download/ftp/releases/$(version)
tarballs = $(package)-$(version).tar.xz

patches = \
	gmp-5.1.0.patch

include packages/all-package.mk

conf-args = \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--with-gmp=$(prefix) \
	--enable-interfaces="c,cxx" \
	--enable-shared \
	--disable-static \
	--disable-optimization

install: | $(pkgsrcdir)
	cd $(pkgbuilddir) && ./configure $(conf-args)
	cd $(pkgbuilddir) && $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(MAKE) install

.PHONY: install
