# Lines configured by zsh-newuser-install
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[red]%}%n%{$fg[red]%}@%{$fg[red]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
HISTSIZE=10000
SAVEHIST=10000
bindkey -v

# Basic auto/tab complete:
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.ompinit


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

alias ls='ls --color=auto --group-directories-first'
alias -s tex=vim
alias -s bib=vim

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


function cd {
        builtin cd $@
        echo $(pwd) > ~/.last_dir
}
if [ -f ~/.last_dir ]; then
        cd "`cat ~/.last_dir`"
fi

extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

conservation(){
    path=/sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
    bool=$(cat $path)
    if [ $bool -eq 1 ] ; then
        echo 0 > $path
        echo "conservation mod is off"
    else
        echo 1 > $path
        echo "conservation mod is on"
    fi
}
