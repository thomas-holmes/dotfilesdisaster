# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="pygmalion"
# ZSH_THEME="simple"
# ZSH_THEME="powerline"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux rvm colorize ruby rspec rails rake bundler)

source $ZSH/oh-my-zsh.sh

bindkey -e

# Customize to your needs...
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

# key[Home]=${terminfo[khome]}
# key[End]=${terminfo[kend]}
# key[Insert]=${terminfo[kich1]}
# key[Delete]=${terminfo[kdch1]}
# key[Up]=${terminfo[kcuu1]}
# key[Down]=${terminfo[kcud1]}
# key[Left]=${terminfo[kcub1]}
# key[Right]=${terminfo[kcuf1]}
# key[PageUp]=${terminfo[kpp]}
# key[PageDown]=${terminfo[knp]}

# setup key accordingly
bindkey  "[7~"    beginning-of-line
bindkey  "[8~"     end-of-line
bindkey  "[2~"  overwrite-mode
bindkey  "[3~"  delete-char
bindkey  "OA"      up-line-or-history
bindkey  "OB"    down-line-or-history
bindkey  "OD"    backward-char
bindkey  "OC"   forward-char

# [[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
# [[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
# [[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
# [[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
# [[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
# [[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
# [[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
# [[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
# 
# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# disable special meaning of certain characters
unsetopt nomatch

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source /usr/bin/virtualenvwrapper.sh
