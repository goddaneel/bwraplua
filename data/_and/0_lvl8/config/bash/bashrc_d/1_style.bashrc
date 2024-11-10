#!/bin/bash



### bash
## variable
# environment
declare -x PS1='\n\[\033[46;30m\] $? \[\033[0m\]\[\033[44;30m\] \w \[\033[0m\]\n\[\033[43;30m\] \$ \[\033[0m\] '
declare -x PS1='\n\[\033[41;37m\] BWRAPLUA [${_Es_bwrap_name}:${_Es_bwrap_exec}] \[\033[0m\]'"${PS1}"



### history
## variable
# environment
declare -x HISTTIMEFORMAT="%F %T %t"



### ls
## command
# short
alias ls,='ls --color'
alias la='ls --color -A'
alias ll='ls --color -lh'
alias lla='ls --color -lhA'



### grep
## command
# short
alias grep,='grep --color'
alias grepi='grep --color -i'
alias grepe='grep --color -E'



### echo
## command
# short
alias echoe='echo -e'



### diff
## command
# short
alias diff,='diff --color'



### less
## variable
# environment
declare -x LESS='-R --use-color -Dd+r$Du+b$'



### tree
## command
# short
alias tree,='tree -C'
alias trea='tree -C -a'
alias tres='tree -C -pugshD'
alias tresa='tree -C -pugshDa'



### exa/eza
## command
# alias
function eza ()
{
        exa ${@} ;
}

# short
alias ezaa='eza -a'
alias ezl='eza --time-style=long-iso -lgh'
alias ezla='eza --time-style=long-iso -lgha'
alias ezt='eza -T'
alias ezta='eza -Ta'
alias eztl='eza --time-style=long-iso -Tlgh'
alias eztla='eza --time-style=long-iso -Tlgha'

# type
function _GF_tp_list ()
{
        exa --time-style=long-iso -Tlgha -L 1 ${@} ;
}



### batcat
## variable
# environment
declare -x BAT_STYLE="header,grid"


## command
# short
alias catb='batcat --paging=never'
alias lessb='batcat --paging=always'
alias helpb='batcat -l help'
alias bashb='batcat -l bash'

# type
function _GF_tp_show ()
{
        batcat ${@} ;
}



### fdfind
## command
# alias
alias fdf='fdfind'



### man
## command
# short
function _GF__manb () 
{ 
        MANPAGER="sh -c 'col -bx | batcat -l man'" man ${@} ;
}
declare -fr "_GF__manb"
alias ,manb='_GF__manb'
#       #
function _GF__manv () 
{
        man ${@} | nvim -RMn -c ":set filetype=man" ;
}
declare -fr "_GF__manv"
alias ,manv='_GF__manv'



### ip
## command
# short
alias ip,='ip -color'

