package = binutils
version = 2.34

location = https://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.bz2

patches = \
	disable-docs.patch

include packages/target-package.mk

conf-args += \
	--enable-gold \
	--disable-multilib \
	--disable-nls
