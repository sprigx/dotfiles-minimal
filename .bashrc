###########################################
#         sprig's minimal bashrc          #
###########################################

# aliases
alias la='ls -AlFh --show-control-chars --color'
alias ..='cd ..'
alias q='exit'
alias v='vim'
alias h='cd ~'
alias gp='git pull'
alias gps='git push origin HEAD'
alias rbs="exec $SHELL -l"

# prompt
IPADDR=`ifconfig | grep 192.168.2 | perl -nle '/(192\.168\.\d+.)(\d+)/ && print $2;'`
PS1='\n\[\e[35m\][\t] \[\e[34m\]\w \[\e[90m\]\u@$IPADDR  \[\e[35m\]\n❯\[\e[0m\] '

# Pyenv
export PATH=$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH

# Locale
export LANG="en_US.utf-8"
export LANGUAGE="en_US.utf-8"
export LC_ALL="en_US.utf-8"

# auto-ls cd
cd () {
  builtin cd "$@" && ls -AlFh --show-control-chars --color
}
