autoload -U compinit promptinit
compinit
promptinit
prompt redhat

HISTFILE=~/.history
# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

setopt incappendhistory 
setopt sharehistory
setopt extendedhistory
setopt completeinword
setopt extendedglob

unsetopt caseglob

# Normal aliases
alias ls='ls --color=auto'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias c="clear"
alias dir='ls -1'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ack=ack-grep
alias smtest='python -m smtpd -n -c DebuggingServer localhost:1025'
alias spill=~/bin/spill.py

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

zstyle ':completion:*' auto-description 'specify: %d'


case $TERM in
(xterm*)
    function precmd () { print -Pn "\e]0;%n@%m:%~\a" }
;;
esac

