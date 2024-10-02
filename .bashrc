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
alias rbs="exec $SHELL -l"

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
