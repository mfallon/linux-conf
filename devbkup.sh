#!/bin/bash

#########################    GLOBAL VARIABLES    ##############################

# MEDIA
SRCMEDIA=`ls -1 $XDG_RUNTIME_DIR/gvfs | sed 's/:/\\:/g'`
DSTMEDIA="/media/pi/california"

# FOLDERS
SRCFOLDER="Internal Storage"
DSTFOLDER="Backups/uncompressed/OnePlus1"

echo "-------------------------------"
echo "|        DEVICE BACKUP        |"
echo "-------------------------------"
echo "Source Media: ${SRCMEDIA}"
echo "Destination Media: ${DSTMEDIA}"
echo ""
echo -n "Do you wish to specify new values?:"
read USRMOD

exit 0

