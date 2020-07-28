##
## Makefile base commands
##

quiet_cmd_stamp = STAMP   $@
      cmd_stamp = mkdir -p $(@D); touch $@

##
## If quiet is set, print the short version of the command only
##
cmd = @$(if $($(quiet)cmd_$(1)),echo '  $($(quiet)cmd_$(1))' &&) $(cmd_$(1))

