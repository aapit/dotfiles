export XDG_CONFIG_HOME="$HOME"/.config
export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}
export HISTFILE="$XDG_DATA_HOME"/zsh/history
source $ZDOTDIR/.zshrc
