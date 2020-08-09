#!/usr/bin/env python3
# Author: David Spreekmeester @aapit
from pathlib import Path
import subprocess
import datetime
import os

# Config
print(os.environ['HOME'])
print(os.environ['HOME'])
print(os.environ['HOME'])
sourceFolder     = os.environ['SCREENSHOT_ARCHIVER_SRC']
targetFolder     = os.environ['SCREENSHOT_ARCHIVER_ARCHIVE']
password         = os.environ['SCREENSHOT_ARCHIVER_PASSWORD']
movablesFileGlob = 'Screenshot*.png'
archiveNameTpl   = 'Screenshot\ Archive\ {}.zip'

# Computed vars
today       = datetime.date.today()
now         = datetime.datetime.now()
archiveName = archiveNameTpl.format(today.strftime("%Y%m%d") + now.strftime("%H%M%S"))
filenames   = Path(sourceFolder + '/').rglob(movablesFileGlob)
targetList  = []
zipCmd      = ' '.join(['zip', '-jr9mP', password,
                targetFolder + '/' + archiveName,
                sourceFolder + '/' + movablesFileGlob
])

for f in filenames:
    targetList.append(f)

if len(targetList) == 0:
    quit("No files to be archived.")

output = subprocess.Popen(zipCmd, shell = True, close_fds=True).communicate()

print("All files archived.")
