package = pkg-config
version = 0.29.1

location = https://pkgconfig.freedesktop.org/releases
tarballs = $(package)-$(version).tar.gz

patches = \
	fix-glib-compilation-with-gcc-6.patch

include packages/all-package.mk

conf-args += \
	--with-internal-glib
