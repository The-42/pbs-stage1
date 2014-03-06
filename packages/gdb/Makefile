package = gdb
version = 7.7

location = http://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.bz2

patches = \
	disable-docs.patch

include packages/target-package.mk

conf-args = \
	--target=$(host) \
	--prefix=$(prefix) \
	--libdir=$(prefix)/lib \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--program-prefix=$(host)- \
	--enable-multilib

ifeq ($(arch),arm)
  conf-args += --enable-interwork
endif

$(pkgbuilddir): | $(pkgsrcdir)
	mkdir -p $@

install: | $(pkgbuilddir)
	cd $(pkgbuilddir) && $(env) ../configure $(conf-args) $(conf-vars)
	cd $(pkgbuilddir) && $(env) $(MAKE) -j $(num-jobs)
	cd $(pkgbuilddir) && $(env) $(MAKE) install

.PHONY: install
