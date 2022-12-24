export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL=nvim
export EDITOR="$VISUAL"
export HISTFILESIZE=42195
export HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
set -o emacs

fpath=(~/.zsh $fpath)

autoload -Uz compinit; compinit
autoload -Uz promptinit; promptinit
add-zsh-hook precmd vcs_info
setopt prompt_subst

zstyle ':completion:*' menu select
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
zstyle ':completion:*:default' list-colors 'GxFxCxDxBxegedabagaced'

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+%f'
# zstyle ':vcs_info:git:*' formats       '%F{yellow}[%f%F{blue}%r%f %F{green}%b%f%u%c%F{yellow}]%f'
zstyle ':vcs_info:git:*' formats       '%F{yellow}[%f%F{green}%b%f%u%c%F{yellow}]%f'
zstyle ':vcs_info:git:*' actionformats '%F{green}%b%f|%F{red}%a%f%u%c'

# PROMPT='%F{magenta}%n@%m%f %F{cyan}%~%f%F{yellow} %# %f'
# RPROMPT='${vcs_info_msg_0_}'
PROMPT='%F{magenta}%m%f %F{cyan}%~%f ${vcs_info_msg_0_}%F{yellow} %# %f'

# Source machine specific aliases
source ~/.other_alias.sh
alias rz="source ~/.zshrc"
alias c="clear"

# Muscle memory
alias vi="nvim"
alias vim="nvim"

alias rm="rm -i"

# Better replacements for unix stuff
alias cat="bat --style='numbers,changes,header'"
alias ls='exa -laF --git --group-directories-first'
alias l='exa -1aF --git --group-directories-first'
alias ll='exa -laF --git --group-directories-first'
alias lll='ll --git --header -a'

# Force tmux to assume 256 colors
alias tmux="tmux -2"
alias resume="tmux attach -t"

# Cleanup
alias git-cleanup="git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d"

# fzf default to use ripgrep
# export FZF_DEFAULT_COMMAND='rg --files --hidden -g \!".git/**"'
export FZF_DEFAULT_COMMAND='fd -H -E ".git"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --bind ctrl-a:select-all'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# homebrew cask path
export PATH="$HOME/.cask/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS=yes
