package = linux
version = 3.8.5

major = $(word 1,$(subst ., ,$(version)))

location = https://www.kernel.org/pub/linux/kernel/v$(major).x
tarballs = $(package)-$(version).tar.xz

include packages/target-package.mk

ifeq ($(arch),powerpc)
  defconfig = ppc64_defconfig
else
  defconfig = defconfig
endif

ifeq ($(arch),sh4)
  arch = sh
endif

$(pkgbuilddir): | $(pkgsrcdir)
	mkdir -p $@

common-vars = \
	O=target-$(host) \
	ARCH=$(arch)

install-vars = \
	INSTALL_HDR_PATH=$(sysroot-prefix) \
	$(common-vars)

install: | $(pkgbuilddir)
	cd $(pkgsrcdir) && $(MAKE) $(common-vars) $(defconfig)
	cd $(pkgsrcdir) && $(MAKE) $(install-vars) headers_install

.PHONY: install
