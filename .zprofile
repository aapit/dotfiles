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

# Hermes Agent command
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
