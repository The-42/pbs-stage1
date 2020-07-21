package = mpfr
version = 4.1.0

location = https://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args += \
	--with-gmp=$(prefix) \
	--enable-shared \
	--disable-static
