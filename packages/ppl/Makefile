package = ppl
version = 1.2

location = http://ftp.avionic-design.de/pub/$(package)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args += \
	--with-gmp=$(prefix) \
	--enable-interfaces="c,cxx" \
	--enable-shared \
	--disable-static \
	--disable-optimization
