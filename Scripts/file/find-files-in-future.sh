#!/bin/bash
# Author: David Spreekmeester @aapit
NOWFILE=/tmp/find-future-files-nowfile
MSG_SEARCH_ARG="Provide search dir as first argument."
MSG_FIX_ARG="Provide 'fix' as second argument to set modification date to now."

[ -z $1 ] && echo $MSG_SEARCH_ARG && exit 1
touch $NOWFILE
find $1 -newer $NOWFILE
echo $(find $1 -newer $NOWFILE | wc -l) futuristic files.
rm $NOWFILE

[ -z $2 ] && echo $MSG_FIX_ARG && exit 0
[ "fix" != "$2" ] && echo $MSG_FIX_ARG && exit 1

touch $NOWFILE
find $1 -newer $NOWFILE -exec touch "{}" \;
rm $NOWFILE
