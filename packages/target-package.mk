include packages/common.mk

pkgbuilddir = $(pkgsrcdir)/target-$(target)

conf-args = \
	--target=$(host) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--with-pkgversion="PBS $(release)" \
	--with-sysroot=$(sysroot) \
	--program-prefix=$(target)- \
	--enable-silent-rules
