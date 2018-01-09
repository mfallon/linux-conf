#!/bin/bash
# 
# Copy LIST file of paths relative to the cwd to DEST directory

# LIST is a file with a list of paths per line
LIST=$1

# DEST is a relative location
DEST=$2

# Common Base Dir - Project Folder on both systems
# obviously they need to be availabe on the target host
COMBASEDIR=mcx-homes-fe
PATCHDIR=../patches-in

# Utility on target host we will merge changes with
EXE=kdiff3

#########################    HOUSEKEEPING - CHECK ARGS ##############################

function usage {
printf "Usage: \
Copy files from a list of paths to a destination\n\
$0 <ListFile> <Destination>";
printf "\n";
exit 0;
}

# check we are operating out of the COMBASEDIR
if [ ${PWD##*/} != $COMBASEDIR ]; then
  echo "Error: Working directory should be root of project directory: $COMBASEDIR"
  usage
fi

# ensure we have our options before proceeding
if [[ ! $# -eq 2 || ! -f $1 || ! -d $2 ]]; then
  usage
fi

#########################    MAIN    ##############################

echo "#!/bin/bash

# Run this file on target
" > $DEST/changeset-$EXE.txt
echo "COMBASEDIR=$COMBASEDIR
PATCHDIR=$PATCHDIR

if [ \${PWD##*/} != \$COMBASEDIR ]; then
  echo \"Error: Working directory should be root of project directory: \$COMBASEDIR\"
  exit 0
fi

# Now run each command in sequence performing a manual merge if required
" >> $DEST/changeset-$EXE.txt


while IFS='' read -r line || [[ -n "$line" ]]; do
  rsync -pR $line $DEST
  # echo "rsync -R ../$COMBASEDIR/$line $line" >> "$DEST/changeset.txt"
  # Generate a kdiff3 command list worthy of being applied on target
  echo "$EXE $PATCHDIR/$line $line --auto -o $line" >> $DEST/changeset-$EXE.txt
done < "$LIST"

# Display a tree of copied files
tree $DEST

exit 0
