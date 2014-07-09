package = binutils
version = 2.24

location = http://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.bz2

patches = \
	gcc4_9_compile.patch

include packages/target-package.mk

conf-args += \
	--disable-multilib \
	--disable-nls
