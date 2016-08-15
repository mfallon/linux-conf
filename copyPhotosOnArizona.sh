#!/bin/sh
# mount point and folders where the photos live
SRCDRV="/media/mark/disk"
TGTDRV="/media/mark/texas"
DRVS="/media/mark/disk
/media/mark/texas"

# src folders - these could take a few forms, depending on camera settings
MOVIES="mp_root/100anv01"
PHOTOS="dcim/100msdcf"
EXTS="jpg
mp4"

# target folders
BACKUPTO="mobilephotos/CamDisks" # foldername by date
BACKUPDIR=`date +"%Y%b%d_%T"`

# command line args
usage() {
    echo "You have not invoked copy file correctly!"
}

# let "DRYRUN=(( $1 & 1 ))"
DRYRUN=false

# check mount points, exit if no mount point
for DRV in $DRVS
do
    if ! mount | grep -q $DRV
	then
	    echo "$DRV is not mounted, exiting."
	    exit 0
    fi
done

echo "drives mounted, continue..."

# check fro folders on drives
if [[ -d $TGTDRV/$BACKUPTO ]]
    then
	if [[ ! -d $TGTDRV/$BACKUPTO/$BACKUPDIR ]]
	    then
		# mkdir -v $TGTDRV/$BACKUPTO/$BACKUPDIR
		echo "mkdir disabled: $TGTDRV/$BACKUPTO/$BACKUPDIR"
	fi
    else
	echo "Backup folder not exist: $TGTDRV/$BACKUPTO."
	exit 0
fi

echo "folders exist, continue..."

# if a 'newer than' file is used for reference then see if we can find it
NEWER_THAN=""
XTRA=""
if [ "$2" != "" ]
    then
	# find it
	NEWER_THAN=`find $TGTDRV/$BACKUPTO -type f -name "$2"`
	XTRA=" -newer $NEWER_THAN"
	echo "Newer than: $NEWER_THAN"	
fi

# search drive for files
# declare -i NUMFILES
NUMFILES=0
for EXT in $EXTS
do
    if [ $DRYRUN = true ]
	then
	    echo "Performing dry run... "
	    find $SRCDRV/* -type f -name "*.$EXT" $XTRA -exec echo "Pretend copy " {} " --> $TGTDRV/$BACKUPTO" $(basename "{}" ) \;
	else
	    # find $SRCDRV/* -type f -name "*.$EXT" $XTRA -exec cp -puv {} $TGTDRV/$BACKUPTO/$BACKUPDIR \;
	    find $SRCDRV/* -type f -name "*.$EXT" $XTRA -exec cp -puv {} $TGTDRV/$BACKUPTO \;
    fi
done

echo "$NUMFILES copied - good job! exiting."

exit 0

