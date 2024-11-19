#!/bin/bash



### config
## command
# directory
function _GF_d_config () 
{ 
        cd "/_end/${USER}/_0_config/${1}" ; 
        pwd ;
}
declare -fr "_GF_d_config"
alias d,config='_GF_d_config'



### bash
## command
# print
function _GF_p_bashrc () 
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
                _GF_tp_list "${_ls_path}/bashrc_d" ${@} ;
        elif [[ "${_ls_1_file}" == "bashrc" ]] ; then
                _GF_tp_show "${_ls_path}/bashrc" ${@} ;
        elif [[ "${_ls_1_file}" == "bash_profile" ]] ; then
                _GF_tp_show "${_ls_path}/bash_profile" ${@} ;
        else
                _GF_tp_show "${_ls_path}/bashrc_d/${_ls_1_file%.*}.bashrc" ${@} ;
        fi
}
declare -fr "_GF_p_bashrc"
alias p,bashrc='_GF_p_bashrc'

