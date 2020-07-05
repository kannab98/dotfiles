# Lines configured by zsh-newuser-install
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[red]%}%n%{$fg[red]%}@%{$fg[red]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
export EDITOR=vim
bindkey -v

setopt extendedglob
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
#setopt prompt_subst # enable shell comands in PROMPT variable
setopt complete_aliases

# Basic auto/tab complete:
autoload -U compinit && compinit

zstyle ':completion:*' menu select # select completions with arrow keys
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.ompinit

alias vim='vim --servername vim'  
#alias ssh='kitty  +kitten ssh'
alias ls='ls --color=auto --group-directories-first'
alias -s tex=vim
alias -s bib=vim


alias -g nf='*(^/om[1])'
alias -g nd='*(/om[1])'
alias gca="git commit -a  --allow-empty-message -m ''"

autoload -U zsh-mime-setup # automatical open files with known extension
# watch /etc/mailcap
zsh-mime-setup

[ -f "$HOME/.dotfiles/zsh/bindkeys"  ]         && \
    source "$HOME/.dotfiles/zsh/bindkeys"
[ -f "$HOME/.dotfiles/zsh/functions" ]         && \
    source "$HOME/.dotfiles/zsh/functions"
[ -f "$HOME/.dotfiles/zsh/kill.complete" ]     && \
    source "$HOME/.dotfiles/zsh/kill.complete"
[ -f "$HOME/.dotfiles/zsh/vi-mode" ]           && \
    source "$HOME/.dotfiles/zsh/vi-mode"


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


