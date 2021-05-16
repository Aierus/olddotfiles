source ~/.promptlinex.sh

# opam configuration
test -r /Users/andyclark1/.opam/opam-init/init.zsh && . /Users/andyclark1/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# autocompletions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

autoload -Uz compinit
compinit
fi

## substituted out in favor of promptline.vim ('/edkolev/promptline.vim')
## make prompt cleaner
PROMPT='%~ %# '
RPROMPT='%*'
ZLE_RPTOMPT_INDENT=0

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
# End of lines added by compinstall
