package = glibc
version = 2.24

location = http://ftp.gnu.org/pub/gnu/$(package)
tarballs = $(package)-$(version).tar.xz

stages = stage1 stage2

# glibc is picky and fails if prefix is sensed on the command line.
MAKEOVERRIDES := $(filter-out prefix=%,$(MAKEOVERRIDES))

include packages/target-package.mk

install-args = \
	install_root=$(sysroot) \
	DESTDIR=$(sysroot)

stage1-conf-args = \
	--build=$(build) \
	--host=$(host) \
	--prefix=/usr \
	--libdir=/usr/lib \
	--datadir=/usr/share \
	--infodir=/usr/share/info \
	--mandir=/usr/share/man \
	--program-prefix=$(target)- \
	--with-headers=$(sysroot-prefix)/include \
	--enable-addons=ports \
	libc_cv_forced_unwind=yes

stage1-build-cmd = true
stage1-build-args =

stage1-install-goal = install-headers

install-stage1:
	touch $(sysroot-prefix)/include/gnu/stubs.h

stage2-conf-args = \
	--build=$(build) \
	--host=$(host) \
	--prefix=/usr \
	--libdir=/usr/lib \
	--datadir=/usr/share \
	--infodir=/usr/share/info \
	--mandir=/usr/share/man \
	--program-prefix=$(target)- \
	--with-headers=$(sysroot-prefix)/include \
	--enable-addons=ports \
	libc_cv_ssp=no

#
# Workaround for glibc bug on sparc64 arch. See
# https://sourceware.org/bugzilla/show_bug.cgi?id=19477
#
# Optimisation and -g get lost if CFLAGS are given, so set them here as well.
#
ifeq ($(arch),sparc64)
stage2-conf-args += \
	CFLAGS='-O2 -g -mcpu=ultrasparc'
endif

#
# On IA64, the programs built by glibc cannot be properly linked because
# they reference symbols defined only by the shared libunwind that is
# only built by stage2 of gcc. We work around this by instructing the
# build system to not build the problematic programs.
#
ifeq ($(arch),ia64)
build-stage2: $(pkgbuilddir)/stage2/configparms

$(pkgbuilddir)/stage2/configparms:
	mkdir -p $(pkgbuilddir)/stage2
	echo "build-programs = no" > $@
endif
