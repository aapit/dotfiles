ENVDIR=$HOME/Scripts/env/
. ${ENVDIR}language.sh

export VISUAL="/usr/bin/emacsclient -c -n -s /tmp/emacs1000/aapit"
export EDITOR="/usr/bin/emacsclient -c -n -s /tmp/emacs1000/aapit"

. ${ENVDIR}ssh_keys.sh
. ${ENVDIR}aliases.sh
[ -f ${ENVDIR}tokens.sh ] && source ${ENVDIR}tokens.sh


# Interactive context
if [[ $- == *i* ]]; then
    . ${ENVDIR}tmux.sh
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    . ${ENVDIR}colors.sh
fi
