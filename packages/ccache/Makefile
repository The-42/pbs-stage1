package = ccache
version = 3.1.8

location = http://www.samba.org/ftp/$(package)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args = \
	--prefix=$(prefix)

install: | $(pkgbuilddir)
	cd $(pkgbuilddir) && ./configure $(conf-args)
	cd $(pkgbuilddir) && $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(MAKE) install

.PHONY: install
