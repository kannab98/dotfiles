export EDITOR=vim
export VISUAL=vim
export SYSTEMD_EDITOR=vim

export HISTSIZE=10000000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

shopt -s checkwinsize
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell
shopt -s checkwinsize
set -o vi
set show-mode-in-prompt-on

reset=$(tput sgr0)
#red=$(tput setaf 1)
#blue=$(tput setaf 4)
#green=$(tput setaf 2)

PS1='\[\033[01;31m\][\u@\h\[\033[01;34m\] \W\[\033[01;31m\]]\[\033[00m\]\$\[$reset\] '



#export WINEARCH=win32
#export WINEPREFIX=~/.wine
# Check ip wan address
alias ip4='dig +short -4 A    myip.opendns.com   @resolver1.opendns.com'
alias ip6='dig +short -6 AAAA myip.opendns.com   @resolver1.opendns.com'
#alias vim0='vim'  
#alias vim='vim --servername vim'  


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


