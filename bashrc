#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PS1="\[$(tput setaf 161)\]\u\[$(tput setaf 88)\]@\[$(tput setaf 88)\]\h \[$(tput setaf 44)\]\w \[$(tput sgr0)\]$ "
