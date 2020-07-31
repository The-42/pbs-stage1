include defs.mk
include mk/commands.mk

#
# Directories
#
pkgbasedir ?= $(package)-$(version)
pkgsrcdir = $(builddir)/$(pkgbasedir)
srcdir = $(CURDIR)/packages/$(package)
pkgpatchdir = $(srcdir)/patches

#
# Package dowload, extract and patch
#
download-files = $(addprefix $(downloaddir)/,$(tarballs))

$(downloaddir) $(builddir):
	$(call cmd,mkdir_p)

$(download-files): $(downloaddir)/%: | $(downloaddir)
	$(CURDIR)/support/download $(location)/$* $@

download-files := $(patsubst $(downloaddir)/%,%,$(download-files))
extract-files = $(addprefix $(stampdir)/extract-,$(download-files))
extract-bz2 = $(filter %.tar.bz2,$(extract-files))
extract-gz = $(filter %.tar.gz,$(extract-files))
extract-xz = $(filter %.tar.xz,$(extract-files))

apply-patches = $(addprefix $(stampdir)/apply-$(package)-,$(patches))

stampdir = $(builddir)/stamp

$(stampdir): | $(builddir)
	$(call cmd,mkdir_p)

$(extract-bz2): $(stampdir)/extract-%: $(downloaddir)/% | $(builddir) $(stampdir)
	tar xjf $< -C $(builddir)
	$(call cmd,stamp)

$(extract-gz): $(stampdir)/extract-%: $(downloaddir)/% | $(builddir) $(stampdir)
	tar xzf $< -C $(builddir)
	$(call cmd,stamp)

$(extract-xz): $(stampdir)/extract-%: $(downloaddir)/% | $(builddir) $(stampdir)
	tar xJf $< -C $(builddir)
	$(call cmd,stamp)

$(apply-patches): $(stampdir)/apply-$(package)-%: $(pkgpatchdir)/% | $(extract-files)
	cd $(pkgsrcdir) && patch -p1 < $<
	$(call cmd,stamp)

$(pkgsrcdir): $(extract-files) $(apply-patches)

# Make the patches depend on each other to guarantee the apply order
filter-lastword = $(filter-out $(lastword $(1)),$(1))
define add-patch-deps
$(lastword $(1)): | $(lastword $(call filter-lastword,$(1)))
$(if $(call filter-lastword,$(1)),$(call add-patch-deps,$(call filter-lastword,$(1))))
endef
$(eval $(call add-patch-deps,$(apply-patches)))

#
# Package build rules
#
pkgoutputdir = $(pkgbuilddir)$(if $(stages),/$*)

pkg-cwd = $(pkgoutputdir)

conf-cwd = $(pkg-cwd)
conf-cmd = $(pkgsrcdir)/configure
conf-args =
conf-goal =

build-cwd = $(pkg-cwd)
build-cmd = $(MAKE)
build-args = -j $(num-jobs)
build-goal =

install-cwd = $(build-cwd)
install-cmd = $(MAKE)
install-args = -j $(num-jobs)
install-goal = install

build-stages = $(addprefix build-,$(or $(stages),all))
install-stages = $(addprefix install-,$(or $(stages),all))

stage-args = $(foreach arg,$(1),$(or $($*-$(arg)),$($(arg))))

.SECONDEXPANSION:
$(pkgoutputdir)%:
	$(call cmd,mkdir_p)

$(build-stages): build-%: | $(pkgsrcdir) $$(pkgoutputdir)
	cd $(conf-cwd) && $(env) $(call stage-args, conf-cmd conf-args conf-goal)
	cd $(build-cwd) && $(env) $(call stage-args, build-cmd build-args build-goal)
	cd $(install-cwd) && $(env) $(call stage-args, install-cmd install-args install-goal)

$(install-stages): install-%: build-%

install: $(lastword $(install-stages))

.PHONY: install $(build-stages)
