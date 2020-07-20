export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}
export HISTFILE="$XDG_DATA_HOME"/zsh/history

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
