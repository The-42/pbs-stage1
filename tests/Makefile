include defs.mk
include mk/commands.mk

testdir=$(prefix)/tests
gcc=$(target)-gcc
gxx=$(target)-g++
objdump=$(target)-objdump

ifeq ($(arch),x86)
	qarch = i386
else ifeq ($(arch),powerpc)
	qarch = ppc
else ifeq ($(arch),s390)
	qarch = s390x
else
	qarch = $(arch)
endif
qemu=qemu-$(qarch)

$(testdir):
	$(call cmd,mkdir_p)

compiler-src = \
	$(CURDIR)/tests/test.c

features-src = \
	$(CURDIR)/tests/features.cpp

compiler-dynamic: | $(testdir)
	@echo "Dynamic binary test..."
	$(env) $(gcc) -o $(testdir)/$(target)-test-dynamic $(compiler-src)
	$(env) $(objdump) -S $(testdir)/$(target)-test-dynamic > $(testdir)/$(target)-test-dynamic.S
	@echo "Test completed."

compiler-static: | $(testdir)
	@echo "Static binary test..."
	$(env) $(gcc) -static -o $(testdir)/$(target)-test-static $(compiler-src)
	$(env) $(objdump) -h $(testdir)/$(target)-test-static > $(testdir)/$(target)-test-static.txt
	@echo "Test completed."

features-dynamic: | $(testdir)
	@echo "Static binary test..."
	$(env) $(gxx) -std=c++17 -o $(testdir)/$(target)-features $(features-src) -lstdc++
	@echo "Build completed."
	#$(env) $(qemu) -L $(prefix)/$(target)/sys-root $(testdir)/$(target)-features
	#@echo "Test completed."

features-static: | $(testdir)
	@echo "Static binary test..."
	$(env) $(gxx) -static -std=c++17 -o $(testdir)/$(target)-features-static $(features-src) -lstdc++
	@echo "Build completed."
	$(env) $(qemu) -L $(prefix)/$(target)/sys-root $(testdir)/$(target)-features-static
	@echo "Test completed."

compiler: compiler-dynamic compiler-static features-dynamic features-static

clean:
	rm -f $(testdir)/$(target)-test-*
