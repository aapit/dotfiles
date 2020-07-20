ENVDIR=$HOME/Scripts/env/
. ${ENVDIR}language.sh
. ${ENVDIR}paths.sh

export VISUAL="/usr/bin/emacsclient -c -n -s /tmp/emacs1000/aapit"
export EDITOR="/usr/bin/emacsclient -c -n -s /tmp/emacs1000/aapit"

. ${ENVDIR}ssh_keys.sh
. ${ENVDIR}aliases.sh
[ -f ${ENVDIR}tokens.sh ] && source ${ENVDIR}tokens.sh


# Interactive context
if [[ $- == *i* ]]; then
    . ${ENVDIR}tmux.sh
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    . ~/Scripts/3rdparty/todoist-cli/todoist_functions.sh
fi
