source ~/.promptline.sh

# opam configuration OCaml
test -r /Users/andyclark1/.opam/opam-init/init.zsh && . /Users/andyclark1/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# autocompletions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

autoload -Uz compinit
compinit
fi

PATH="/usr/local/opt/python@3.8/bin:$PATH"
PATH=$PATH:$HOME/.npm-global/bin

## make prompt cleaner
PROMPT='%~ %# '
RPROMPT='%*'
ZLE_RPTOMPT_INDENT=0

CASE_SENSITIVE="false"

## prompt history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY
SAVEHIST=500
HISTSIZE=200
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# alias for useful things
alias py="python3"
alias pip="pip3"
alias lf="ranger"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -mh'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias tos='exec thinkorswim/thinkorswim'
alias pic='scrot -s'
alias website='ssh root@andyrclark.com'
alias grafana='kubectl -n default port-forward monitoring-grafana-656dbff547-fcpsx 3000'
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
# pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias merge='xrdb -merge ~/.Xresources' #Merge .Xresources
alias jctl="journalctl -p 3 -xb" #get error messages from journalctl
alias icat="kitty +kitten icat"


# meson ninja PATH
export PATH=$PATH:/Users/andyclark1/Library/Python/3.8/bin

# Remap ls to exa
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'


## substituted out in favor of promptline.vim ('/edkolev/promptline.vim')
## make prompt cleaner
## git status right prompt
#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
#zstyle ':vcs_info:*' enable git


# The following lines were added by compinstall
zstyle :compinstall filename '/Users/andyclark1/.zshrc'

autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin
# End of lines added by compinstall

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo          					# Shift+tab undo last action

export GOPATH=$HOME/.local/share/go
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export SYSTEMD_EDITOR=vim
export BROWSER=chromium

source <(kubectl completion zsh)
