#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
shopt -s autocd
complete -cf sudo
# PS1='[\u@\h \W]\$ '

shwoGitBranch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="╭─\[\033[32m\]\u@\h \[\033[1;34m\]\w \[\033[31m\]\$(shwoGitBranch)\[\033[0;00m\] \n╰─➤ "
# export PS1="╭─\[$(tput setaf 2)\]\u@\h \[$(tput bold)\]\[$(tput setaf 4)\]\w \[$(tput setaf 1)\]\$(shwoGitBranch)\[$(tput sgr0)\] \n╰─➤ "

# vim key binding
set -o vi

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

. $HOME/.config/shrc

if [ -f $HOME/.private_env ]; then
  . $HOME/.private_env
fi

if [ -f $HOME/.git-compilation.bash ]; then
  . $HOME/.git-compilation.bash
fi

if [ -d /usr/share/fzf/ ]; then
  source /usr/share/fzf/completion.bash
  source /usr/share/fzf/key-bindings.bash
fi
