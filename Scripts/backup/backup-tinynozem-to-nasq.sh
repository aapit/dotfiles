#!/bin/bash
script=`realpath $0`
logfile=$HOME/.local/share/backup-tinynozem-nasq.log
rsync -u -avz --copy-links --delete --info=progress2 \
    ~/Scripts \
    ~/Documents \
    ~/Books \
    ~/Sites \
    ~/Remotes \
    ~/Lab \
    ~/Music \
    ~/Pictures \
    ~/Templates \
    ~/Videos \
	nasq:/share/homes/admin/Backups/tinynozem-ubu-rsync/
echo $(date) >> $logfile
