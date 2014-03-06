package = gdb
version = 7.7

location = http://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.bz2

patches = \
	disable-docs.patch

include packages/target-package.mk

conf-args += \
	--enable-multilib

ifeq ($(arch),arm)
  conf-args += --enable-interwork
endif
