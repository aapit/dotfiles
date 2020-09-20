ENVDIR=$HOME/Scripts/env/
. ${ENVDIR}language.sh


. ${ENVDIR}ssh_keys.sh
. ${ENVDIR}gpg_keys.sh
. ${ENVDIR}aliases.sh
[ -f ${ENVDIR}tokens.sh ] && source ${ENVDIR}tokens.sh


# Interactive context
if [[ $- == *i* ]]; then
    . ${ENVDIR}tmux.sh
    . ${ENVDIR}colors.sh
fi
