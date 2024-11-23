#!/bin/bash


## command
# print
function _GF_p_script () 
{
        declare _ls_1_file="${1:?}" ;
        if [[ "${2}" == "and" ]] || [[ -z "${2}" ]] ; then
                declare _ls_path="/_and/config/bash" ;
        elif [[ "${2}" == "own" ]] ; then
                declare _ls_path="/_end/${USER}/_0_config/bash" ;
        else
                declare _ls_path="${2}" ;
        fi
        shift 1 ;
        shift 1 ;
        if [[ "${_ls_1_file}" == ",l" ]] ; then
                _GF_tp_list "${_ls_path}/script" ${@} ;
        else
                _GF_tp_show "${_ls_path}/script/${_ls_1_file%.*}.bash" ${@} ;
        fi
}
declare -fr "_GF_p_script"
alias p,script='_GF_p_script'

# manage
alias m,clean='bash "/_and/config/bash/script/clean_own.bash"'
alias m,reset='bash "/_and/config/bash/script/reset_own.bash"'

