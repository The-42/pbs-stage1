include defs.mk

testdir=$(prefix)/tests
gcc=$(target)-gcc
objdump=$(target)-objdump

compiler-src = \
	$(CURDIR)/tests/test.c

compiler-dynamic:
	@echo "Dynamic binary test..."
	$(env) $(gcc) -o $(testdir)/$(target)-test-dynamic $(compiler-src)
	$(env) $(objdump) -S $(testdir)/$(target)-test-dynamic > $(testdir)/$(target)-test-dynamic.S
	@echo "Test completed."

compiler-static:
	@echo "Static binary test..."
	$(env) $(gcc) -static -o $(testdir)/$(target)-test-static $(compiler-src)
	$(env) $(objdump) -h $(testdir)/$(target)-test-static > $(testdir)/$(target)-test-static.txt
	@echo "Test completed."

compiler: compiler-dynamic compiler-static

