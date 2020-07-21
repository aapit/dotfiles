ENVDIR=$HOME/Scripts/env/
. ${ENVDIR}language.sh


. ${ENVDIR}ssh_keys.sh
. ${ENVDIR}aliases.sh
[ -f ${ENVDIR}tokens.sh ] && source ${ENVDIR}tokens.sh


# Interactive context
if [[ $- == *i* ]]; then
    . ${ENVDIR}tmux.sh
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    . ${ENVDIR}colors.sh
fi
