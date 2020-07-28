##
## Make the output pretty (or: more readable)
##

##
## Disable printing directory changes
##
MAKEFLAGS += --no-print-directory

##
## Check if a V=1 is set on the command line
##
ifdef V
  ifeq ("$(origin V)", "command line")
    KBUILD_VERBOSE = $(V)
  endif
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

##
## beautify output
##
ifeq ($(KBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet = quiet_
  Q = @
endif

##
## Detect the -s flag
##
ifneq ($(findstring s,$(MAKEFLAGS)),)
  quiet = silent_
endif

export quiet Q KBUILD_VERBOSE

