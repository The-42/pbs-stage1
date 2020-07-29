all:

ifdef TARGET
include targets/$(TARGET).mk

ifeq ($(libc),gnu)
  libc = glibc
endif

export arch cpu os libc abi fp target
endif
include defs.mk
include mk/commands.mk
include mk/pretty.mk

$(prefix)/meta/_host-check:
	support/prerequisites.sh
	$(call cmd,stamp)

host-check: $(prefix)/meta/_host-check

targets += host-check

$(prefix)/meta/patch:
	$(Q)$(MAKE) -f packages/patch/Makefile install
	$(call cmd,stamp)

patch: $(prefix)/meta/patch

$(prefix)/meta/m4:
	$(Q)$(MAKE) -f packages/m4/Makefile install
	$(call cmd,stamp)

m4: $(prefix)/meta/m4

$(prefix)/meta/gmp: m4
	$(Q)$(MAKE) -f packages/gmp/Makefile install
	$(call cmd,stamp)

gmp: $(prefix)/meta/gmp

$(prefix)/meta/bison: m4
	$(Q)$(MAKE) -f packages/bison/Makefile install
	$(call cmd,stamp)

bison: $(prefix)/meta/bison

$(prefix)/meta/flex: m4
	$(Q)$(MAKE) -f packages/flex/Makefile install
	$(call cmd,stamp)

flex: $(prefix)/meta/flex

$(prefix)/meta/mpfr: $(prefix)/meta/gmp
	$(Q)$(MAKE) -f packages/mpfr/Makefile install
	$(call cmd,stamp)

mpfr: $(prefix)/meta/mpfr

$(prefix)/meta/mpc: $(prefix)/meta/gmp $(prefix)/meta/mpfr
	$(Q)$(MAKE) -f packages/mpc/Makefile install
	$(call cmd,stamp)

mpc: $(prefix)/meta/mpc

gcc-deps: host-check patch bison flex gmp mpc mpfr

ifneq ($(target),)
$(prefix)/meta/$(target)-linux:
	$(Q)$(MAKE) -f packages/linux/Makefile install
	$(call cmd,stamp)

$(prefix)/meta/$(target)-binutils:
	$(Q)$(MAKE) -f packages/binutils/Makefile install
	$(call cmd,stamp)

$(prefix)/meta/$(target)-gcc-stage1: gcc-deps $(prefix)/meta/$(target)-binutils $(prefix)/meta/$(target)-linux
	$(Q)$(MAKE) -f packages/gcc/Makefile install-stage1
	$(call cmd,stamp)

$(prefix)/meta/$(target)-glibc-stage1: $(prefix)/meta/$(target)-gcc-stage1
	$(Q)$(MAKE) -f packages/glibc/Makefile install-stage1
	$(call cmd,stamp)

$(prefix)/meta/$(target)-uclibc-stage1: $(prefix)/meta/$(target)-gcc-stage1
	$(Q)$(MAKE) -f packages/uclibc/Makefile install-stage1
	$(call cmd,stamp)

$(prefix)/meta/$(target)-gcc-stage1-libgcc: $(prefix)/meta/$(target)-$(libc)-stage1
	$(Q)$(MAKE) -f packages/gcc/Makefile install-stage1-libgcc
	$(call cmd,stamp)

$(prefix)/meta/$(target)-glibc: $(prefix)/meta/$(target)-gcc-stage1-libgcc
	$(Q)$(MAKE) -f packages/glibc/Makefile install
	$(call cmd,stamp)

$(prefix)/meta/$(target)-uclibc: $(prefix)/meta/$(target)-gcc-stage1-libgcc
	$(Q)$(MAKE) -f packages/uclibc/Makefile install
	$(call cmd,stamp)

$(prefix)/meta/$(target)-gcc: $(prefix)/meta/$(target)-$(libc)
	$(Q)$(MAKE) -f packages/gcc/Makefile install
	$(call cmd,stamp)

gcc: $(prefix)/meta/$(target)-gcc

$(prefix)/meta/$(target)-gdb: $(prefix)/meta/ncurses
	$(Q)$(MAKE) -f packages/gdb/Makefile install
	$(call cmd,stamp)

gdb: $(prefix)/meta/$(target)-gdb

$(prefix)/meta/qemu:
	$(Q)$(MAKE) -f packages/qemu/Makefile install
	$(call cmd,stamp)

qemu: $(prefix)/meta/qemu

$(prefix)/meta/test-$(target)-compiler:
	$(Q)$(MAKE) -f tests/Makefile compiler
	$(call cmd,stamp)

compiler-test: $(prefix)/meta/test-$(target)-compiler

targets += gcc gdb qemu compiler-test
else
targets += gcc-deps
endif

$(prefix)/meta/ppl: gmp
	$(Q)$(MAKE) -f packages/ppl/Makefile install
	$(call cmd,stamp)

ppl: $(prefix)/meta/ppl

$(prefix)/meta/libtool:
	$(Q)$(MAKE) -f packages/libtool/Makefile install
	$(call cmd,stamp)

libtool: $(prefix)/meta/libtool

$(prefix)/meta/pkg-config:
	$(Q)$(MAKE) -f packages/pkg-config/Makefile install
	$(call cmd,stamp)

pkgconfig pkg-config: $(prefix)/meta/pkg-config

$(prefix)/meta/ccache:
	$(Q)$(MAKE) -f packages/ccache/Makefile install
	$(call cmd,stamp)

ccache: $(prefix)/meta/ccache

$(prefix)/meta/autoconf:
	$(Q)$(MAKE) -f packages/autoconf/Makefile install
	$(call cmd,stamp)

autoconf: $(prefix)/meta/autoconf

$(prefix)/meta/autoconf-archive:
	$(Q)$(MAKE) -f packages/autoconf-archive/Makefile install
	$(call cmd,stamp)

autoconf-archive: $(prefix)/meta/autoconf-archive

$(prefix)/meta/automake:
	$(Q)$(MAKE) -f packages/automake/Makefile install
	$(call cmd,stamp)

automake: $(prefix)/meta/automake

$(prefix)/meta/ncurses:
	$(Q)$(MAKE) -f packages/ncurses/Makefile install
	$(call cmd,stamp)

ncurses: $(prefix)/meta/ncurses

$(prefix)/meta/nano:
	$(Q)$(MAKE) -f packages/nano/Makefile install
	$(call cmd,stamp)

nano: $(prefix)/meta/nano

$(prefix)/meta/which:
	$(Q)$(MAKE) -f packages/which/Makefile install
	$(call cmd,stamp)

which: $(prefix)/meta/which

$(prefix)/meta/less:
	$(Q)$(MAKE) -f packages/less/Makefile install
	$(call cmd,stamp)

less: $(prefix)/meta/less

$(prefix)/meta/libsigsegv:
	$(Q)$(MAKE) -f packages/libsigsegv/Makefile install
	$(call cmd,stamp)

libsigsegv: $(prefix)/meta/libsigsegv

$(prefix)/meta/gzip:
	$(Q)$(MAKE) -f packages/gzip/Makefile install
	$(call cmd,stamp)

gzip: $(prefix)/meta/gzip

$(prefix)/meta/grep:
	$(Q)$(MAKE) -f packages/grep/Makefile install
	$(call cmd,stamp)

grep: $(prefix)/meta/grep

$(prefix)/meta/bc:
	$(Q)$(MAKE) -f packages/bc/Makefile install
	$(call cmd,stamp)

bc: $(prefix)/meta/bc

$(prefix)/meta/sed:
	$(Q)$(MAKE) -f packages/sed/Makefile install
	$(call cmd,stamp)

sed: $(prefix)/meta/sed

$(prefix)/meta/gawk:
	$(Q)$(MAKE) -f packages/gawk/Makefile install
	$(call cmd,stamp)

gawk: $(prefix)/meta/gawk

$(prefix)/meta/readline:
	$(Q)$(MAKE) -f packages/readline/Makefile install
	$(call cmd,stamp)

readline: $(prefix)/meta/readline

$(prefix)/meta/findutils:
	$(Q)$(MAKE) -f packages/findutils/Makefile install
	$(call cmd,stamp)

findutils: $(prefix)/meta/findutils

$(prefix)/meta/diffutils:
	$(Q)$(MAKE) -f packages/diffutils/Makefile install
	$(call cmd,stamp)

diffutils: $(prefix)/meta/diffutils

$(prefix)/meta/coreutils:
	$(Q)$(MAKE) -f packages/coreutils/Makefile install
	$(call cmd,stamp)

coreutils: $(prefix)/meta/coreutils

$(prefix)/meta/tar:
	$(Q)$(MAKE) -f packages/tar/Makefile install
	$(call cmd,stamp)

tar: $(prefix)/meta/tar

$(prefix)/meta/make:
	$(Q)$(MAKE) -f packages/make/Makefile install
	$(call cmd,stamp)

make: $(prefix)/meta/make

tools: host-check patch bc libtool pkg-config ccache autoconf autoconf-archive automake ncurses m4 sed ppl gawk tar readline findutils diffutils coreutils make nano which less libsigsegv gzip grep

tools-test:

targets += tools

all: $(targets)

uninstall:
	rm -rf $(prefix)/lib/gcc/$(target)
	rm -rf $(wildcard $(prefix)/bin/$(target)-*)
	rm -rf $(prefix)/$(target)
	rm -rf $(wildcard $(prefix)/meta/$(target)-*)

clean-tests:
	$(Q)$(MAKE) -f tests/Makefile clean
	rm -f $(wildcard $(prefix)/meta/test-*)

clean-%:
	$(Q)$(MAKE) -f packages/$*/Makefile clean

clean: clean-binutils clean-gdb clean-gcc clean-glibc clean-uclibc clean-linux clean-tests
