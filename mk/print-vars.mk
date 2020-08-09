# Rule to print out any variable - use as e.g. make print-MAKE_VERSION
print-%:
	@echo '$*=$($*)'

print-all: ;
	@$(foreach n,$(sort $(.VARIABLES)),echo '$n=$($n)';)

