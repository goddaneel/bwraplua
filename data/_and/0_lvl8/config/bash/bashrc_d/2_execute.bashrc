#!/bin/bash



### user
## variable
# path
declare -x PATH="${PATH}:${HOME}/.local/bin/"


## execute
# directory
alias d,execute='cd "${HOME}/.local/bin" ; pwd'

# print
alias p,executel='_GF_tp_list "${HOME}/.local/bin"'

# file
function _GF_f_executel () 
{ 
        declare "_ls_1_realpath" ;
        _ls_1_realpath="$(realpath -e "${1:?}")" || return ;
        shift 1 ;
        ln -sv "${_ls_1_realpath}" "${HOME}/.local/bin/" ${@} ;
}
declare -fr "_GF_f_executel"
alias f,executel='_GF_f_executel'

