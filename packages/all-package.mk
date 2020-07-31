include packages/common.mk

pkgbuilddir = $(pkgsrcdir)

conf-args = \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--enable-silent-rules \
	ac_cv_prog_MAKEINFO=
