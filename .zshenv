ENVDIR=$HOME/Scripts/env/
. ${ENVDIR}paths.sh
export ZDOTDIR=${ZDOTDIR:=${HOME}}
export HISTFILE="$XDG_DATA_HOME"/zsh/history
source $ZDOTDIR/.zshrc
