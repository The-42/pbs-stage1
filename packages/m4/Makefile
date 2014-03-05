package = m4
version = 1.4.16

location = http://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args = \
	--prefix=$(prefix)

$(pkgsrcdir)/stamp-patched: | $(pkgsrcdir)
	cd $(pkgsrcdir) && patch -p1 < $(srcdir)/patches/glibc-2.17.patch
	touch $@

install: $(pkgsrcdir)/stamp-patched
	cd $(pkgbuilddir) && ./configure $(conf-args)
	cd $(pkgbuilddir) && $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(MAKE) install

.PHONY: install
