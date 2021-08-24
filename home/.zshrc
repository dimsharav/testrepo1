# Chmouel Boudjnah <chmouel@mandrakesoft.com>
# Default zsh configuration if no .zshrc is provided.

# Set up aliases, this may confuse gurus but well after all gurus now
# how to remove alias.
alias mv='nocorrect mv -i'       # no spelling correction on mv
alias cp='nocorrect cp -i'       # no spelling correction on cp
alias rm='nocorrect rm -i'       # no spelling correction on rm
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias d='ls'
alias s='cd ..'
alias p='cd -'
alias rdp='rdesktop -g 1024x768'

# Shell compatibility functions
setenv() { export $1=$2 }  # csh compatibility

# Completion functions
_compdir=/usr/share/zsh/$ZSH_VERSION/functions/Completion
[[ -z $fpath[(r)$_compdir] ]] && fpath=($fpath $_compdir)
autoload -U compinit
compinit

### Color completion. and menu selection
zmodload -i zsh/complist
export ZLS_COLORS=$LS_COLORS
export ZLS_COLOURS=$LS_COLORS
export LISTPROMPT=""

#Make it bash alike
WORDCHARS=''

## General alias examples
#  alias -g L="|less"
#  alias -g H="|head"
#  alias -g T="|tail"
# alias -g G="|grep"
#  alias -g N="&>/dev/null&"
#  alias -g O="2>&1"
## local mount point 
alias -g D="/media/win_d"
alias -g C="/media/win_c"
## prk
alias -g terra="/media/net/terra/e"
alias -g borey="/media/net/borealis/c"
## home-lan
alias -g raD='/media/net/ra/d'
alias -g raE='/media/net/ra/e'

## Bindkey you may think it's usefull 
#  bindkey ' ' magic-space  # also do history expansino on space
#  bindkey -s "^xs" '\C-e"\C-asu -c "'
#  bindkey -s "^xd" "$(date '+-%d_%b')"
#  bindkey -s "^xf" "$(date '+-%D'|sed 's|/||g')"
#  bindkey -s "^xp" "\$(pwd\)/"
#  bindkey -s "^xw" "\C-a \$(which \C-e\)\C-a"



## Установка нормального поведения клавиш Delete, Home, End и т.д.:
case $TERM in linux)
bindkey "^[[2~" yank
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
bindkey " " magic-space ## do history expansion on space
;;
*xterm*|rxvt|konsole|(dt|k|E)term)
bindkey "^[[2~" yank
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
bindkey " " magic-space ## do history expansion on space
;;
esac

export PATH="/bin:/sbin:/usr/bin:/usr/local/bin:/usr/sbin:/usr/games:/usr/share/bin:/usr/X11R6/bin:/home/dimsharav/.gem/ruby/1.9.1/bin:"

HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt  APPEND_HISTORY
setopt  HIST_IGNORE_ALL_DUPS
setopt  HIST_IGNORE_SPACE
setopt  HIST_REDUCE_BLANKS

# promt style
PROMPT=$'%{\e[1;34m%}%n@%m %~ $ %{\e[0m%}'
RPROMPT=$'%{\e[1;32m%}[%{\e[1;33m%}%T%{\e[1;32m%}]%{\e[0m%}'

# alias for extenshions
alias -s {avi,mpeg,mpg,mov,m2v}=mplayer
alias -s {odt,doc,sxw,rtf}=oowriter
alias -s {odx,ods,xls}=oocalc
alias -s {odp,ppt}=ooimpress
alias -s {ogg,mp3,wav,wma}=mplayer
alias -s pdf=okular
autoload -U pick-web-browser
alias -s {html,htm}=pick-web-browser

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# completion style
zstyle ':completion:*:default' list-colors 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;31:'
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' add-space true
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true

# autoloading ssh-key
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
