package = mpc
version = 1.0.3

location = https://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.gz

include packages/all-package.mk

conf-args += \
	--with-mpfr=$(prefix) \
	--with-gmp=$(prefix) \
	--disable-static
