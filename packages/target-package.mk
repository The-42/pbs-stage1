include packages/common.mk

pkgbuilddir = $(pkgsrcdir)/target-$(target)

conf-args = \
	--target=$(host) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--with-pkgversion="$(package-version)" \
	--with-sysroot=$(sysroot) \
	--program-prefix=$(target)- \
	--enable-silent-rules \
	ac_cv_prog_MAKEINFO=

clean:
	rm -rf $(wildcard $(pkgbuilddir)*)
