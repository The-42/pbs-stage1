package = gcc
version = 4.9.3

location = http://ftp.gnu.org/pub/gnu/$(package)/$(package)-$(version)
tarballs = $(package)-$(version).tar.bz2

stages = stage1 stage1-libgcc stage2

include packages/target-package.mk

stage1-conf-args = \
	$(conf-args) \
	--libdir=$(sysroot-prefix)/lib \
	--libexecdir=$(sysroot-prefix)/lib \
	--includedir=$(sysroot-prefix)/include \
	--with-mpfr=$(prefix) \
	--with-gmp=$(prefix) \
	--with-ppl=$(prefix) \
	--enable-languages=c \
	--enable-threads=posix \
	--disable-shared \
	--disable-nls

ifeq ($(arch),arm)
  ifeq ($(fp),hard)
    stage1-conf-args += --with-float=hard
  else
    stage1-conf-args += --with-float=soft
  endif
endif

ifeq ($(os),none)
  stage1-conf-args += --enable-multilib --with-newlib

  ifeq ($(arch),arm)
    stage1-conf-args += --enable-interwork
  endif
else
  stage1-conf-args += --disable-multilib
endif

stage1-build-goal = all-gcc
stage1-install-goal = install-gcc

install-stage1:
	rm $(prefix)/bin/$(target)-gcc && \
		sed -e 's,@VERSION@,$(version),' support/gcc.in > $(prefix)/bin/$(target)-gcc && \
		chmod a+x $(prefix)/bin/$(target)-gcc

stage1-libgcc-conf-cmd = true
stage1-libgcc-build-goal = all-target-libgcc
stage1-libgcc-install-goal = install-target-libgcc

install-stage1-libgcc: pkg-cwd = $(pkgbuilddir)/stage1

stage2-conf-args = \
	$(conf-args) \
	--libdir=$(exec-prefix)/lib \
	--libexecdir=$(exec-prefix)/lib \
	--includedir=$(sysroot-prefix)/include \
	--with-gxx-include-dir=$(sysroot-prefix)/include/c++/$(version) \
	--with-mpfr=$(prefix) \
	--with-gmp=$(prefix) \
	--with-ppl=$(prefix) \
	--disable-ppl-version-check \
	--enable-languages=c,c++,objc,obj-c++ \
	--enable-threads=posix \
	--disable-nls

ifeq ($(arch),arm)
  ifeq ($(fp),hard)
    stage2-conf-args += --with-float=hard
  else
    stage2-conf-args += --with-float=soft
  endif
endif

ifeq ($(os),none)
  stage2-conf-args += --enable-multilib --with-newlib

  ifeq ($(arch),arm)
    stage2-conf-args += --enable-interwork
  endif
else
  stage2-conf-args += --disable-multilib
endif

ifeq ($(libc),uclibc)
  stage2-conf-args += --disable-libsanitizer
endif

install-stage2:
	rm $(prefix)/bin/$(target)-gcc && \
		sed -e 's,@VERSION@,$(version),' support/gcc.in > $(prefix)/bin/$(target)-gcc && \
		chmod a+x $(prefix)/bin/$(target)-gcc
	mv $(prefix)/bin/$(target)-cpp $(prefix)/bin/$(target)-cpp-$(version) && ln -s $(target)-gcc $(prefix)/bin/$(target)-cpp
	mv $(prefix)/bin/$(target)-g++ $(prefix)/bin/$(target)-g++-$(version) && ln -s $(target)-gcc $(prefix)/bin/$(target)-g++
	mv $(prefix)/bin/$(target)-c++ $(prefix)/bin/$(target)-c++-$(version) && ln -s $(target)-gcc $(prefix)/bin/$(target)-c++
