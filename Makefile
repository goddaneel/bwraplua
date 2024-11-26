### fun
define _ef_init_delete
$(if $(wildcard $(1)), $(_es_init_delete) $(1))
endef


### env
_es_init_delete ?= '/usr/bin/trash' -rv
_es_init_dirmake ?= ./make


### var
ifdef version
	_gs_pack_version ?= v$(version)
else
	_gs_pack_version ?= u$(shell '/usr/bin/date' "+%s")
endif
#	#
_gs_pack_makedir ?= $(_es_init_dirmake)/$(_gs_pack_version)
_gs_pack_archive ?= bwraplua_$(_gs_pack_version).tar.gz


### opt
.PHONY: package
package: _main_package

.PHONY: delete
delete: _main_delete

.PHONY: clean
clean: _main_clean


### main
.PHONY: _main_package
_main_package: _load_useRmdir _load_useMkdir _load_useArchive

.PHONY: _main_delete
_main_delete: _load_useRmdir

.PHONY: _main_clean
_main_clean:
	$(call _ef_init_delete, $(_es_init_dirmake))


### load
.PHONY: _load_useRmdir
_load_useRmdir:
	$(call _ef_init_delete, $(_gs_pack_makedir))

.PHONY: _load_useMkdir
_load_useMkdir:
	'/usr/bin/mkdir' -pv "$(_es_init_dirmake)"
	'/usr/bin/mkdir' -v "$(_gs_pack_makedir)"

.PHONY: _load_useArchive
.ONESHELL:
_load_useArchive:
	'/usr/bin/tar' -cvf "$(_gs_pack_makedir)/$(_gs_pack_archive)" "./program"
	cd "$(_gs_pack_makedir)"
	'/usr/bin/shasum' -a 512 "$(_gs_pack_archive)" > "$(_gs_pack_archive).shasum"

