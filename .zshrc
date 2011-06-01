# Prompt
autoload -U promptinit && promptinit
prompt="%n@%m:%~$ "

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle :compinstall filename '/home/tutuca/.zshrc'

[ -f ~/.ssh/config ] && : ${(A)ssh_config_hosts:=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
[ -f ~/.ssh/known_hosts ] && : ${(A)ssh_known_hosts:=${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*}}

zstyle ':completion:*:*:*' hosts $ssh_config_hosts $ssh_known_hosts

zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Keys
bindkey -e
bindkey ';5A' up-line-or-history
bindkey ';5B' down-line-or-history
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ack='ack-grep -i'
alias smtest='python -m smtpd -n -c DebuggingServer localhost:1025'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


case $TERM in
(xterm*)
    function precmd () { print -Pn "\e]0;%n@%m:%~\a" }
;;
esac
