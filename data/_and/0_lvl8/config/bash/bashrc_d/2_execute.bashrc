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

