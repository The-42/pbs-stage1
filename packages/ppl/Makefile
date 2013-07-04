package = ppl
version = 1.0

location = http://bugseng.com/products/$(package)/download/ftp/releases/$(version)
tarballs = $(package)-$(version).tar.xz

pkgsrcdir = $(builddir)/$(package)-$(version)
pkgbuilddir = $(pkgsrcdir)
srcdir = $(CURDIR)/packages/$(package)

include packages/common.mk

conf-args = \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--with-gmp=$(prefix) \
	--enable-interfaces="c,cxx" \
	--enable-shared \
	--disable-static \
	--disable-optimization

$(pkgsrcdir)/stamp-patched: | $(pkgsrcdir)
	cd $(pkgsrcdir) && patch -p1 < $(srcdir)/patches/gmp-5.1.0.patch
	touch $@

install: $(pkgsrcdir)/stamp-patched
	cd $(pkgbuilddir) && ./configure $(conf-args)
	cd $(pkgbuilddir) && $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(MAKE) install

.PHONY: install
