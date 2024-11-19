#!/bin/bash


## history
echo -e "\n \033[4;34m ## history \033[0m"

# bash
echo -e "\n \033[4;34m # bash \033[0m"
#       #
rm -fv "${HOME}/.bash_history"

# less
echo -e "\n \033[4;34m # less \033[0m"
#       #
rm -fv "${HOME}/.lesshst"

# vim
echo -e "\n \033[4;34m # vim \033[0m"
#       #
rm -fv "${HOME}/.viminfo"

# wget
echo -e "\n \033[4;34m # wget \033[0m"
#       #
rm -fv "${HOME}/.wget-hsts"


#       #
echo -e "\n \033[4;34m \033[0m"
#       #

