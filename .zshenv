ENVDIR=$HOME/Scripts/env/
. ${ENVDIR}paths.sh
export ZDOTDIR=${ZDOTDIR:=${HOME}}
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HOMEBREW_AUTO_UPDATE_SECS=86400
#export HOMEBREW_NO_ENV_HINTS=1
source $ZDOTDIR/.zshrc
. "$HOME/.cargo/env"
