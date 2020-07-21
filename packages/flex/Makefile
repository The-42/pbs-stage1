package = flex
version = 2.6.4

location = https://github.com/westes/$(package)/releases/download/v$(version)
tarballs = $(package)-$(version).tar.gz

include packages/all-package.mk

# See https://github.com/westes/flex/issues/425
conf-args += \
	CFLAGS='-g -O2 -D_GNU_SOURCE'
