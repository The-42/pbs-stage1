package = qemu
version = 5.0.0

location = https://download.qemu.org/
tarballs = $(package)-$(version).tar.xz

patches = \
	0001-configure-ignore-unknown-options.patch

include packages/all-package.mk

qarch = $(arch)

ifeq ($(arch),i786)
	qarch = i386
else ifeq ($(arch),powerpc)
	qarch = ppc
else ifeq ($(arch),s390)
	qarch = s390x
endif

# also possible: $(qarch)-softmmu => config option?
qemu-target = $(qarch)-linux-user

conf-args += \
	--target-list=$(qemu-target)
