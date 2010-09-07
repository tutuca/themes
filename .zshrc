autoload -U compinit promptinit
compinit
promptinit
prompt redhat

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=5000

setopt incappendhistory 
setopt sharehistory
setopt extendedhistory
setopt completeinword
setopt extendedglob

unsetopt caseglob

# Normal aliases
alias ls='ls --color=auto -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias c="clear"
alias dir='ls -1'


zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'



