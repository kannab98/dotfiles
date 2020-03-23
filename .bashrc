export EDITOR=vim
export VISUAL=vim
export SYSTEMD_EDITOR=vim

export HISTSIZE=10000000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist
set -o vi
set show-mode-in-prompt-on

reset=$(tput sgr0)
#red=$(tput setaf 1)
#blue=$(tput setaf 4)
#green=$(tput setaf 2)

# Приглашение командной строки
PS1='\[\033[01;31m\][\u@\h\[\033[01;34m\] \W\[\033[01;31m\]]\[\033[00m\]\$\[$reset\] '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Tab-completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export WINEARCH=win32
export WINEPREFIX=~/.wine
# Check ip wan address
alias ip4='dig +short -4 A    myip.opendns.com   @resolver1.opendns.com'
alias ip6='dig +short -6 AAAA myip.opendns.com   @resolver1.opendns.com'
alias vim='vim --servername vim'  

alias sudo='sudo -E'
alias status='sudo systemctl status'
alias enable='sudo systemctl enable'
alias disable='sudo systemctl disable'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias edit='sudo systemctl edit'
alias restart='sudo systemctl restart'
alias google='ping google.com'
alias analyze='systemd-analyze blame'
alias ls='ls --color=auto --group-directories-first'

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
