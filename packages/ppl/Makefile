package = ppl
version = 1.0

location = http://bugseng.com/products/$(package)/download/ftp/releases/$(version)
tarballs = $(package)-$(version).tar.xz

patches = \
	gmp-5.1.0.patch \
	gcc4_9_compile.patch

include packages/all-package.mk

conf-args += \
	--with-gmp=$(prefix) \
	--enable-interfaces="c,cxx" \
	--enable-shared \
	--disable-static \
	--disable-optimization
