#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

shwoGitBranch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="╭─\[$(tput setaf 2)\]\u@\h \[$(tput bold)\]\[$(tput setaf 4)\]\w \[$(tput setaf 1)\]\$(shwoGitBranch)\[$(tput sgr0)\] \n╰─➤ "

# vim key binding
set -o vi

. $HOME/.config/shrc
