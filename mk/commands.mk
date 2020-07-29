##
## Makefile base commands
##

quiet_cmd_stamp = STAMP   $@
      cmd_stamp = mkdir -p $(@D); touch $@

quiet_cmd_mkdir_p = MKDIR   $@
      cmd_mkdir_p = mkdir -p $@

##
## If quiet is set, print the short version of the command only
##
cmd = @$(if $($(quiet)cmd_$(1)),echo '  $($(quiet)cmd_$(1))' &&) $(cmd_$(1))

