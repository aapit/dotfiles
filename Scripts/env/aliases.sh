# Various
alias top='gtop'
alias luxafor='~/Scripts/luxafor.sh'
alias bla='~/Scripts/generate-loremipsum.sh'
alias copy='xclip -selection c'
alias pomodoro='sleep 1500; zenity --warning --text="Rest now (worked 25 mins)"'

# Mapping broot (fancy dir tree in Rust) to something I can potentially remember
alias tree='br --sizes --show-git-info --hidden --show-gitignored --permissions'
alias tree-whales='br --sizes --show-git-info --hidden --show-gitignored --whale-spotting'
# To spot large files or dirs, use: --whale-spotting

# Using exa (in Rust) instead of ls
alias ls='exa --long --level=2 --all --group-directories-first --modified --git'
alias lsl='exa --long --tree --level=2 --all --group-directories-first --group --modified --git --header'

# Sane defaults for du and df
alias du='du -hs'
alias df='df -h'

# Fd-find
alias f=$(command -v fdfind && echo 'fdfind' || echo 'fd')

# Sourcing
alias src=". ~/.zshenv"
alias alias-edit="vim ~/Scripts/env/aliases.sh && . ~/Scripts/env/aliases.sh"

# Dotfiles
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Doom
alias ds="killall emacs && systemctl --user restart emacs && doom sync"

# Editing and reading
alias e="emacsclient -c -n -s /run/user/1000/emacs/aapit"
alias v="nvim"
alias vim="nvim"
alias cat='bat'
alias n='nvim -c "NV!"'
alias vim-color-edit='nvim ~/.vim/colors/spacemonkey_dark.vim'

# Clipboard
alias c="xclip -selection c"

# Dirs
alias desk="cd ~/Desktop"
alias ~="cd ~"
alias dotfiles="cd ~/.dotfiles/"

# Editing configurations
alias config-edit-tmux="(cd $HOME/.config/tmux && vim $HOME/.tmux.conf && cd -)"
alias config-edit-tmux-theme="(cd $HOME/.config/tmux/themes && vim default.conf && cd -)"
alias config-edit-vim="(cd $HOME/.config/vim/config && vim -c 'FZF!' && cd -)"
alias config-edit-vim-theme="(cd $HOME/.config/vim/colors && vim spacemonkey_dark.vim && cd -)"
alias config-edit-cloudkey="(cd $HOME/Remotes/unifi-cloudkey && vim config.gateway.json && make && echo 'Now adjust a setting in the Cloudkey UI, like Local Network dhcp range, to trigger provisioning to the Security Gateway.' && xdg-open "https://cloudkey.floase.zone:8443/manage/site/default/v2/settings/networks/manage/edit/5d45683ee5c66d0dee9b68d1" && cd -)"
alias config-edit-ha="(cd $HOME/Remotes/domo && make mount-and-symlink && nvim ./mount/configuration.yaml)"
alias config-edit-alias="alias-edit"
alias config-edit-path="vim ~/Scripts/env/paths.sh && . ~/Scripts/env/paths.sh"
alias config-edit-zsh="vim ~/.zshrc"
alias config-edit-profile="vim $ZDOTDIR/.zprofile && . $ZDOTDIR/.zprofile"

# Python
alias py='python'

# Capistrano
alias csd='cap staging deploy'
alias cpd='cap production deploy'

# Git
alias g='git'
alias gs='git status'
alias gc='git commit -m'
alias gl='git pull'
alias gd='git diff'
alias gp='git push'
alias ga='git add .'
alias dev='git co develop'
alias master='git co master'
alias git-push-upstream='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# Docker
alias dco='docker-compose'
alias dce='docker-compose exec'
alias dcr='docker-compose run'
alias dcup='docker-compose up'
alias docker-snafu='~/Scripts/docker/docker-snafu.sh'

# Kubernetes
alias k='kubectl'

# tmux
#alias tmux='tmux -2'
alias rn='tmux movew -r && tmux rename-window'

# Encryption
alias lock='~/Scripts/file/gpg-dir-encrypt/lock.sh'
alias unlock='~/Scripts/file/gpg-dir-encrypt/unlock.sh'

# Spotify
alias spotify="$(which spotify) --force-device-scale-factor=2 > /dev/null &"

# TensorFlow
TF_DOCKER_GPU_PREFIX=$([[ `~/Scripts/display/has-gpu.sh` == '1' ]] && echo '--gpus all ')
alias tf-docker-python="docker run $TF_DOCKER_GPU_PREFIX -it --rm $TF_IMG python -c '$1'"
alias tf-docker-run="docker run $TF_DOCKER_GPU_PREFIX -it -u $(id -u):$(id -g) $TF_IMG bash"
