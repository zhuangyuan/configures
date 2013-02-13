# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias gccm="gcc *.c -lm -o"
alias vi="vim"
alias em="emacs"
alias en="emacs -nw"
alias ll="ls -l"
alias la="ls -a"
alias lall="ls -all"

source /xtmp/intel/composer_xe_2013.1.117/bin/compilervars.sh intel64