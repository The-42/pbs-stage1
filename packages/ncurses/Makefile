package = ncurses
version = 6.0

location = https://ftp.gnu.org/pub/gnu/$(package)
tarballs = $(package)-$(version).tar.gz

patches = \
	Upgrade-to-ncurses-6.0-20160423.patch

include packages/all-package.mk

conf-args += \
	--with-shared \
	--enable-rpath
