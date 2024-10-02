###########################################
#         sprig's minimal bashrc          #
###########################################

# aliases
alias la='ls -AlFh --show-control-chars --color'
alias ..='cd ..'
alias q='exit'
alias v='vim'
alias gp='git pull'
alias gps='git push origin HEAD'
alias rbs='exec $SHELL -l'

# auto-ls cd
cd () {
  builtin cd "$@" && ls -AlFh
}
