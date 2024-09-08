#!/bin/bash


## command
# short
alias bwraplua,='bwraplua.lua ,q, ,r, ,y,'

# print
function _GF_p_bwraplual () {
        echo -e "\n \033[4;34m #/etc/bwraplua/options/# \033[0m" ;
        _GF_tp_list -L 2 "/etc/bwraplua/options/" ;
        echo -e "\n \033[4;34m #${HOME}/.config/bwraplua/options/# \033[0m" ;
        _GF_tp_list -L 2 "${HOME}/.config/bwraplua/options/" ;
        return ;
}
readonly -f "_GF_p_bwraplual"
alias p,bwraplual='_GF_p_bwraplual'

# print # custom
function _GF_c__bwraplua () {
        local _ls_1_=${1:?} ;
        shift 1 ;
        if [[ -x "/etc/bwraplua/options/default/${_ls_1_}" ]] ; then
                "/etc/bwraplua/options/default/${_ls_1_}" ${@} ;
        elif [[ -x "/etc/bwraplua/options/execute/${_ls_1_}" ]] ; then
                "/etc/bwraplua/options/execute/${_ls_1_}" ${@} ;
        else
                type "${_ls_1_}" ;
                return "127" ;
        fi
}
function _GF_c_bwraplua () {
        local _ls_1_=${1:?} ;
        shift 1 ;
        if [[ -x "${HOME}/.config/bwraplua/options/default/${_ls_1_}" ]] ; then
                "${HOME}/.config/bwraplua/options/default/${_ls_1_}" ${@} ;
        elif [[ -x "${HOME}/.config/bwraplua/options/execute/${_ls_1_}" ]] ; then
                "${HOME}/.config/bwraplua/options/execute/${_ls_1_}" ${@} ;
        else
                type "${_ls_1_}" ;
                return "127" ;
        fi
}
function _GF_p_bwrapluai () {
        if $(bwraplua.lua ,,p "${1:?}" &>"/dev/null") ; then
                echo -e "\n \033[4;36m #PRINT# \033[0m" ;
                bwraplua.lua ,q, ,c, ,n, ,,p "${1}" ;
                echo -e "\n \033[4;36m #LOAD# \033[0m" ;
                bwraplua.lua ,v, ,c, ,n, ,re "${1}" ,co "bash" ;
        else
                echo -e "\n \033[4;32m #EXECUTE_AND# \033[0m" ;
                _GF_c__bwraplua "${1}" ,v, ,c, ,n, ;
                echo -e "\n \033[4;32m #EXECUTE_OWN# \033[0m" ;
                _GF_c_bwraplua "${1}" ,v, ,c, ,n, ;
        fi
}
readonly -f "_GF_p_bwrapluai" ;
readonly -f "_GF_c__bwraplua"
readonly -f "_GF_c_bwraplua"
alias c,,bwraplua='_GF_c__bwraplua'
alias c,bwraplua='_GF_c_bwraplua'
alias p,bwrapluai='_GF_p_bwrapluai'

# directory
function _GF_d__bwraplua ()
{ 
        cd "/etc/bwraplua/options/${1}" ;
        pwd ;
}
readonly -f "_GF_d__bwraplua"
alias d,,bwraplua='_GF_d__bwraplua'
#       #
function _GF_d_bwraplua ()
{ 
        cd "${HOME}/.config/bwraplua/options/${1}" ;
        pwd ;
}
readonly -f "_GF_d_bwraplua"
alias d,bwraplua='_GF_d_bwraplua'

# environment
function _GF_e_bwrapluatc () {
        _ga_args_bwraplua=(
                ,v, ,r, ,y,
                ,co "bash"
                ,,n ${@}
                ,r "02_lvl6_testcli"
        )
        #       #
        bwraplua.lua ${_ga_args_bwraplua[@]}
}
readonly -f "_GF_e_bwrapluatc"
alias e,bwrapluatc='_GF_e_bwrapluatc'
alias e,bwrapluatcd='_GF_e_bwrapluatc ,r "01_fsloadrw_pwd" ,,n'
alias e,bwrapluatg='_GF_e_bwrapluatc ,r "02_lvl6_testgui" ,,n'
alias e,bwrapluatgd='_GF_e_bwrapluatc ,r "02_lvl6_testgui" ,r "01_fsloadrw_pwd" ,,n'

# file
function _GF_m_bwrapluar () {
        _gs_2_="${2:-"1:1"}" ;
        [[ -r "${HOME}/.local/share/bwraphome/${1:?}" ]] ;
        rm -rf "${HOME}/.local/share/bwraphome/${1}" ;
        if [[ "${_gs_2_##*:}" == "0" ]] ; then
                rm -fv "${HOME}/.config/bwraplua/options/options/${1}_own.lua" ;
        fi
        if [[ "${_gs_2_%%:*}" == "0" ]] ; then
                sudo rm -fv "/etc/bwraplua/options/options/${1}.lua" ;
        fi
}
readonly -f "_GF_m_bwrapluar" ;
alias m,bwrapluar='_GF_m_bwrapluar'

