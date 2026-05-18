# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#alias nautilus="echo 'Use the terminal, you fool!'"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias i3config="cd ~/.config/i3 && nvim ."
alias polybarconfig="nvim ~/.config/polybar/"
alias weztermconfig="nvim ~/.config/wezterm/"
alias picomconfig="nvim ~/.config/picom/"
alias nvimconfig="cd ~/.config/nvim && nvim ."
alias alacrittyconfig="nvim ~/.config/alacritty/"
alias scripts="nvim ~/.dotfiles/scripts/.local/scripts/"
alias findfile="fzf --preview 'bat --style=numbers --color=always {}' | xargs -r nvim"
alias chat="ollama run dolphin-mixtral:latest"
alias ccpp="c++"
alias runekit="~/Downloads/RuneKit.AppImage 2> /dev/null &"
alias ls="lsd"
#alias nvim="zed"


alias ta="tmux a"
#bindkey -r ^h
#bindkey -r ^j
#bindkey -r ^k
#bindkey -r ^l
bindkey -r ^x
bindkey -s ^a "tmux a\n"
bindkey -s ^g "lazygit\n"
bindkey -s ^e "echo fart\n"
#bindkey ^x clear-terminal
bindkey "^x" clear-screen
bindkey -s ^f "tmux-sessionizer\n"
#bindkey -s ^a "zellij a\n"
#bindkey -s ^e "nvim $(fzf)\n"

# bun completions
[ -s "/home/bduck/.bun/_bun" ] && source "/home/bduck/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Scripts
export PATH="$HOME/.local/scripts:$PATH"
# Turso
export PATH="$HOME/.turso:$PATH"
# emacs
export PATH="$HOME/.config/emacs/bin:$PATH"
# Volta
#export VOLTA_HOME="$HOME/.volta"
#export PATH="$VOLTA_HOME/bin:$PATH"

# opam configuration
[[ ! -r /home/bduck/.opam/opam-init/init.zsh ]] || source /home/bduck/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/home/bduck/.ghcup/env" ] && source "/home/bduck/.ghcup/env" # ghcup-env


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--margin="8,10,8,10" --padding="1" --border="rounded" --preview-window="border-rounded"
'

eval "$(zoxide init zsh)"
# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro

declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="5"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}
  spd-say "'$val' session done"
  notify-send "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

#echo "use z instead of cd"
export PATH=$PATH:$HOME/go/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/go
export GOROOT=/usr/local/go


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bduck/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bduck/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bduck/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bduck/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

