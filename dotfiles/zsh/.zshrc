# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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


bindkey -r ^x
bindkey -s ^a "tmux a\n"
bindkey -s ^g "lazygit\n"
bindkey -s ^e "echo fart\n"

bindkey -s ^f 'tmuxifier-sessionizer\n'
bindkey -s ^n 'new-project tmuxifier load-session dev\n'

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

export PATH="$PATH:$(bash -ic 'echo $PATH'):$PATH"


# tmuxifier
export PATH=$PATH:$HOME/.tmux/plugins/tmuxifier/bin
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
eval "$(tmuxifier init -)"

#zoxide
eval "$(zoxide init zsh)"

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

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
