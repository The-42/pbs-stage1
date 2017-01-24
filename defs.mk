release = 2017.01

downloaddir = download
top_builddir = $(prefix)/build
builddir = $(top_builddir)

prefix = ${HOME}/pbs-stage1
exec-prefix = $(prefix)/$(target)
sysroot = $(prefix)/$(target)/sys-root
sysroot-prefix = $(sysroot)/usr

num-jobs = $(or $(shell cat /proc/cpuinfo | grep '^processor' | wc -l),1)

build = $(shell support/config.guess)
host = $(target)

env =	LD_LIBRARY_PATH=$(prefix)/lib \
	PATH=$(prefix)/bin:${PATH} \
	LIBRARY_PATH=$(prefix)/lib \
	CPATH=$(prefix)/include
