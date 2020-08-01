export TMUX_CONFIG_PATH=$HOME/.config/tmux/
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.config/tmux/plugins/

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach || tmux new -As 家に
fi
