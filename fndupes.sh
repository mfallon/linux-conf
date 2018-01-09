#!/bin/bash
# 
# Search a DEST directory recursively for files in LIST
# If the file exists in DEST: the file can be removed
# else copy the file from the LIST SRC into DEST with relative paths
# Where this is run from should be common ancestor of SRC / DEST

# SRC is where files to check live
SRC=$1

# DEST is where we will check if any files from SRC exist
DEST=$2 

#########################    HOUSEKEEPING - CHECK ARGS ##############################

function usage {
printf "Usage: \
Work with a LIST of file paths\n\
$0 <Src Directory> <Destination Directory>";
printf "\n";
exit 0;
}

# ensure we have our options before proceeding
if [[ ! $# -eq 2 || ! -d $1 || ! -d $2 ]]; then
  usage
fi

#########################    MAIN    ##############################

find $SRC -type f | while IFS='' read -r path || [[ -n "$path" ]]; do
  FILE=`basename "${path}"`
  RESULT=`find $DEST -type f -iname $FILE`
  if [ -z "$RESULT" ]; then
    # echo "$FILE not found, Copying to $DEST"
		rsync -avp $path $DEST
  fi
done

exit 0
