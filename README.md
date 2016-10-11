PBS Stage 1, toolchain collection
=================================
[![Travis build][travis-badge]][travis]

This repository contains a cross-compiling toolchain collection, some of which
are needed for PBS stage 2. Usage is not restricted to PBS however. For many
targets either glibc or uclibc can be chosen as libc implementation, and all gcc
incarnations get to use ccache to speed up (repeated) cross builds.

Requirements
============

The aim of this toolchain collection is to keep the requirements low, thus not
much is needed to get started:

- make >= 3.82
- gcc, g++ >= 4.8
- patch
- wget
- tar
- gawk

Building
========

To build a toolchain:

	$ make TARGET=<toolchain>

The available toolchains are defined in the "targets" subdirectory:

	$ ls -1 targets/
	alpha-linux-gnu.mk
	arm-unknown-linux-gnueabi.mk
	arm-unknown-linux-uclibceabi.mk
	armv7l-unknown-linux-gnueabihf.mk
	armv7l-unknown-linux-uclibceabihf.mk
	i786-pc-linux-gnu.mk
	i786-pc-linux-uclibc.mk
	ia64-unknown-linux-gnu.mk
	m68k-linux-gnu.mk
	mipsel-linux-gnu.mk
	mips-linux-gnu.mk
	powerpc-unknown-linux-gnu.mk
	powerpc-unknown-linux-uclibc.mk
	s390-linux-gnu.mk
	sh4-linux-gnu.mk
	sparc64-linux-gnu.mk
	x86_64-unknown-linux-gnu.mk

Loose the '.mk' suffix when stating a target. Not supplying a target will lead
arch independent support packages being built. Those are required for any target
and built implicitly when needed and a target is given.

Per default the created toolchain is installed into $HOME/pbs-stage1. To
choose a different install directory you can override the "prefix" variable,
for example to point to /opt or /usr/local.

	$ make prefix=/usr/local TARGET=arm-unknown-linux-gnueabi

Development
===========

Issues may be reported via [GitHub][bugs-github]. Pull requests are welcome,
bear in mind though we might have different plans or use cases.

  [bugs-github]: https://github.com/avionic-design/pbs-stage1/issues
  [travis]: https://travis-ci.org/avionic-design/pbs-stage1
  [travis-badge]: https://travis-ci.org/avionic-design/pbs-stage1.svg?branch=master
