package = mpfr
version = 3.1.2

location = http://www.mpfr.org/$(package)-$(version)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args += \
	--with-gmp=$(prefix) \
	--enable-shared \
	--disable-static
