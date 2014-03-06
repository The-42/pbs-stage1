package = mpc
version = 1.0.1

location = http://www.multiprecision.org/$(package)/download
tarballs = $(package)-$(version).tar.gz

include packages/all-package.mk

conf-args += \
	--with-mpfr=$(prefix) \
	--with-gmp=$(prefix) \
	--disable-static
