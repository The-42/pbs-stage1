package = kconfig-frontends
version = 4.11.0.1

location = https://deb.debian.org/debian/pool/main/k/$(package)
tarballs = $(package)_$(version)+dfsg.orig.tar.bz2

patches = \
	gperf_newtype.patch \
	python3_support.patch

include packages/all-package.mk

$(pkgbuilddir)/configure:
	cd $(@D) && mkdir -p scripts/.autostuff/m4 && $(env) autoreconf -i -f

build-all: $(pkgbuilddir)/configure

