#
# ~/.zprofile
#
source /usr/share/git/completion/git-prompt.sh

alias ls='ls --color=auto'
alias pacman='sudo pacman'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval $(keychain --eval --agents ssh -Q --quiet $HOME/.ssh/id_rsa)

setxkbmap -option ctrl:nocaps # Get out of here, caps-lock

# /usr/bin/fix_governor.sh
