# oh-my-zsh configuration block
# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export FZF_BASE=~/src/ext/fzf

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git vi-mode colored-man-pages fzf)


# Pure zsh
fpath+=($HOME/.zsh/pure)
autoload -Uz promptinit; promptinit
prompt pure


# User configuration
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY     # write history file immediately, not when shell exits
unsetopt SHARE_HISTORY        # share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST # remove duplicates first
setopt HIST_SAVE_NO_DUPS      # don't record an entry that was just recorded again
setopt AUTO_PUSHD             # push to history file immediately
setopt PUSHD_IGNORE_DUPS      # don't push duplicate entries to the stack


# vim keybindings
# inputrc port
bindkey -v
bindkey '^?'   backward-delete-char # make backspace work in vi mode
bindkey '^[[A' history-search-backward # up arrow to search history
bindkey '^[[B' history-search-forward # down arrow to search history
bindkey '\e.'  insert-last-word # Alt-. to insert last word
bindkey -M viins "^p" history-beginning-search-backward
bindkey -M viins "^n" history-beginning-search-forward
# bindkey -M viins "\e." insert-last-word

autoload -Uz compinit && compinit

# === Customise PATH ===
export PATH=$HOME/bin:/usr/local/bin:$PATH

# add GO
export PATH=/usr/local/go/bin:$PATH

# Ruby config
export PATH=$HOME/gems/bin:$PATH
export GEM_HOME=$HOME/gems

#TexLive
export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH

# Neovim
export PATH=/opt/nvim-linux64/bin:$PATH

# NPM binaries
# export PATH=$(npm bin):$PATH 


# export MANPATH="/usr/local/man:$MANPATH"

alias tmux='tmux -2' # support 256 colour
alias pgcli='~/.virtualenvs/pgcli/bin/pgcli'
alias tig='tig status'
alias pipcache='pip download -d /var/www/pypi.local'
alias pipinstall='pip install --trusted-host=pypi.local --index-url=http://pypi.local/simple'
alias cat='bat'
alias gpg='gpg2'
alias npm-exec='PATH=$(npm bin):$PATH'
alias vim='nvim'

# source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# reduce mode-switch to 10ms
export KEYTIMEOUT=1

# configure dircolors

if [ -f ~/.dir_colors/dircolors ]
    then eval `dircolors ~/.dir_colors/dircolors`
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Haskell stack autocomplete
# eval "$(stack --bash-completion-script stack)"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Ctrl p/n to search history up/down

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/adam/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/adam/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/adam/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/adam/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# === Node Version Manager ===
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # lazy loading (call nvm use to initialise)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pixi
export PATH="/home/adam/.pixi/bin:$PATH"
eval "$(pixi completion --shell zsh)"
