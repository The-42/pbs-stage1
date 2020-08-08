package = kconfig-frontends
version = 4.11.0.1

location = https://deb.debian.org/debian/pool/main/k/$(package)
tarballs = $(package)_$(version)+dfsg.orig.tar.bz2

include packages/all-package.mk

$(pkgbuilddir)/configure:
	cd $(@D) && autoreconf -i -f -v

build-all: $(pkgbuilddir)/configure

