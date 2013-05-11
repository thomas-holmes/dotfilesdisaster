#
# ~/.zprofile
#

alias ls='ls --color=auto'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval $(keychain --eval --agents ssh -Q --quiet $HOME/.ssh/id_rsa)
