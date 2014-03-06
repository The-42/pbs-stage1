include packages/common.mk

pkgbuilddir = $(pkgsrcdir)

conf-args = \
        --prefix=$(prefix)
        --infodir=$(prefix)/share/info \
        --mandir=$(prefix)/share/man \
