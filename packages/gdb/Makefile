package = gdb
version = 9.2

location = https://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.xz

patches = \
	disable-docs.patch

include packages/target-package.mk

conf-args += \
	--enable-multilib

ifeq ($(arch),arm)
  conf-args += --enable-interwork
endif
