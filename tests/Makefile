include defs.mk
include mk/commands.mk

testdir=$(prefix)/tests
gcc=$(target)-gcc
objdump=$(target)-objdump

$(testdir):
	$(call cmd,mkdir_p)

compiler-src = \
	$(CURDIR)/tests/test.c

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

compiler: compiler-dynamic compiler-static

clean:
	rm -f $(testdir)/$(target)-test-*
