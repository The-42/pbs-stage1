package = uclibc
version = 0.9.33.2

location = http://uclibc.org/downloads
tarballs = uClibc-$(version).tar.xz
pkgbasedir = uClibc-$(version)

patches = \
	config-path-len.patch \
	out-of-tree.patch \
	arg-max.patch

stages = stage1 stage2

include packages/target-package.mk

ifeq ($(arch),arm)
  ifeq ($(fp),hard)
    defconfig = $(srcdir)/configs/$(arch)_hard_defconfig
  else
    defconfig = $(srcdir)/configs/$(arch)_soft_defconfig
  endif
else
  defconfig = $(srcdir)/configs/$(arch)_defconfig
endif

conf-args = \
	CROSS_COMPILE=$(target)- \
	RUNTIME_PREFIX=/usr/ \
	DEVEL_PREFIX=/usr/ \
	PREFIX=$(sysroot) \
	O=$(pkgoutputdir)

$(pkgbuilddir)/stage1/.config $(pkgbuilddir)/stage2/.config: $(defconfig)
	mkdir -p $(@D)
	cp $< $@

pkg-cwd = $(pkgsrcdir)
conf-cmd = $(MAKE)
conf-goal = oldconfig
# No build step is needed
stage1-build-cmd = true
stage1-install-args = $(conf-args)
stage1-install-goal = install_headers

build-stage1: $(pkgbuilddir)/stage1/.config

stage2-build-args = $(conf-args)
stage2-install-args = $(conf-args)

build-stage2: $(pkgbuilddir)/stage2/.config
