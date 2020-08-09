#export GOPATH=/usr/local/opt/golang
#export GOROOT=/usr/local/opt/go/libexec
#export GEM_HOME=$HOME/.gem
#export PYTHONPATH=$HOME/.local/lib/python3/site-packages:/usr/lib/python3/dist-packages
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export BASH_SCRIPTS_DIR=$HOME/Scripts/shell/env
export XMONAD_CONFIG_DIR=$HOME/.config/xmonad
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export EMACSCLIENT="/snap/bin/emacsclient -c -n -s /run/user/1000/snap.emacs/emacs/aapit"
#export KUBECONFIG="$HOME/.kube/config"

PATH=$PATH:\
./vendor/bin:\
./node_modules/.bin:\
$HOME/.yarn/bin:\
$HOME/.local/bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin/:\
/sbin:\
$HOME/Scripts:\
$HOME/.composer/vendor/bin:\
$HOME/.emacs.d/bin:\
/home/linuxbrew/.linuxbrew/bin:\
$HOME/.cargo/bin
