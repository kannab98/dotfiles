

# Lines configured by zsh-newuser-install
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[red]%}%n%{$fg[red]%}@%{$fg[red]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
 ZSH_CUSTOM=$HOME/.zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    systemd
    last-working-dir
    vi-mode
)




# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8



# Compilation flags
# export ARCHFLAGS="-arch x86_64"


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export EDITOR='vim'
export VISUAL='vim'
bindkey -v

setopt extendedglob
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
#setopt prompt_subst # enable shell comands in PROMPT variable
#setopt complete_aliases

# Basic auto/tab complete:
autoload -Uz compinit && compinit
kitty +complete setup zsh | source /dev/stdin
zstyle ':completion:*' menu select # select completions with arrow keys
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.ompinit

[ -f "/usr/bin/gvim" ] && alias vim='vim --servername vim'  
#alias ssh='kitty  +kitten ssh'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias cp='cp -r'

alias -s {tex,bib}=vim
alias -s {pdf}=okular


alias -g nf='*(^/om[-1])'
alias -g nd='*(/om[-1])'
alias gca="git commit -a  --allow-empty-message -m ''"

alias vpn="sudo protonvpn"

autoload -U zsh-mime-setup # automatical open files with known extension
# watch /etc/mailcap
zsh-mime-setup

[ -f "$ZSH_CUSTOM/../bindkeys"  ]         && \
    source "$ZSH_CUSTOM/../bindkeys"
[ -f "$ZSH_CUSTOM/../functions" ]         && \
    source "$ZSH_CUSTOM/../functions"

[ -f "$ZSH_CUSTOM/../completions" ]         && \
    source "$ZSH_CUSTOM/../completions"


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null



#FPATH=$ZSH_CUSTOM:$FPATH
#autoload -U zranger





