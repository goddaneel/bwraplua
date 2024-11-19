#!/bin/bash



### bash
## command
# short
alias bashno='bash --norc --noprofile'



### nvim
## variable
# environment
declare -x EDITOR="nvim"


## command
# short
alias nvimr='nvim -RMn'



### htop
## command
# short
alias htop,='htop -M -t --readonly'



### shasum
## command
# short
alias shasumc='shasum -c'
#       #
function _GF_p_shasumc ()
{
        declare _ls_1_="${1:?}" ;
        declare _ls_2_="${2:?}" ;
        shift 2 ;
        shasum -c <(echo "${_ls_1_}  ${_ls_2_}") ${@} ;
}
declare -fr "_GF_p_shasumc"
alias p,shasumc='_GF_p_shasumc'
#       #
function _GF_f_shasumt ()
{
        shasum ${@} ;
        shasum ${@} > "${1:?}.shasum" ;
}
declare -fr "_GF_f_shasumt"
alias f,shasumt='_GF_f_shasumt'



### rsync
## command
# short
alias rsync,='rsync --info=progress2'
alias rsyncn='rsync --info=progress2 --dry-run'



### trash
## command
# alias
alias trashp='trash-put'
alias trashr='trash-restore'
alias trashd='trash-rm'
alias trashl='trash-list'
alias trashe='trash-empty'

