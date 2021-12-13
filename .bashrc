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

# prompt
IPADDR=`ifconfig | grep 192.168.2 | perl -nle '/(192\.168\.\d+.)(\d+)/ && print $2;'`
PS1='\n\[\e[35m\][\t] \[\e[34m\]\w \[\e[90m\]\u@$IPADDR  \[\e[35m\]\n❯\[\e[0m\] '

# auto-ls cd
cd () {
  builtin cd "$@" && ls -AlFh
}
