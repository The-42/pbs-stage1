package = ppl
version = 1.2

location = https://bugseng.com/products/$(package)/download/ftp/releases/$(version)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args += \
	--with-gmp=$(prefix) \
	--enable-interfaces="c,cxx" \
	--enable-shared \
	--disable-static \
	--disable-optimization
