package = automake
version = 1.12.6

location = http://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args = \
	--prefix=$(prefix)

install: | $(pkgbuilddir)
	cd $(pkgbuilddir) && ./configure $(conf-args)
	cd $(pkgbuilddir) && $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(MAKE) install

.PHONY: install
