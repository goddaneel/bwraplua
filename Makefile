### fun
define _ef_init_delete
$(if $(wildcard $(1)), $(_es_init_delete) $(1))
endef
#	#
define _ef_init_shasum
$(eval _la_args_shasum :=)
$(eval _la_args_shasum += -a)
$(eval _la_args_shasum += $(or $(2), 512))
$(eval _la_args_shasum += $(basename $(1)))
$(eval _la_args_shasum += >)
$(eval _la_args_shasum += $(basename $(1)).shasum)
endef

### env
_es_init_delete ?= '/usr/bin/trash' -rv
_es_init_dirmake ?= ./make/


### var
ifdef package
	_gs_args_package ?= $(package)
else
	_gs_args_package ?= archive
endif
#	#
ifdef version
	_gs_args_version ?= v$(version)
else
	_gs_args_version ?= u$(shell '/usr/bin/date' "+%s")
endif
#	#
_gs_load_makedir ?= $(_es_init_dirmake)/$(_gs_args_package)_$(_gs_args_version)
_gs_load_archive ?= bwraplua_$(_gs_args_version).tar.gz


### opt
.PHONY: create
create: _main_create

.PHONY: delete
delete: _main_delete

.PHONY: full-delete
full-delete: _main_full-delete

### main
.PHONY: _main_create

.PHONY: _main_delete
_main_delete: _load_dirsRmdir

.PHONY: _main_full-delete
_main_full-delete:
	$(call _ef_init_delete, $(_es_init_dirmake))


### load
.PHONY: _load_dirsRmdir
_load_dirsRmdir:
	$(call _ef_init_delete, $(_gs_load_makedir))

.PHONY: _load_dirsMkdir
_load_dirsMkdir:
	'/usr/bin/mkdir' -pv "$(_es_init_dirmake)"
	'/usr/bin/mkdir' -v "$(_gs_load_makedir)"

.PHONY: _load_packArchive
_load_packArchive:
	'/usr/bin/tar' -cvf "$(_gs_load_makedir)/$(_gs_load_archive)" "./program"
	cd "$(_gs_load_makedir)"
	'/usr/bin/shasum' -a 512 "$(_gs_load_archive)" > "$(_gs_load_archive).shasum"

