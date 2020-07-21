package = gmp
version = 6.2.0

location = https://ftp.gnu.org/gnu/$(package)
tarballs = $(package)-$(version).tar.xz

include packages/all-package.mk

conf-args += \
	--disable-static \
	--enable-cxx
