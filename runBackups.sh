#!/bin/bash

# collect invocation lines here to run backups with multiple iterations over different folders

# Back up photos/videos on A0001
mtpDeviceBackup -o "-av --ignore-existing" -O "mobilephotos/A0001" -m "texas" -s "Internal storage/DCIM/Camera"

# Back up entire folder and put it to A0001

# SmartVoiceRecorder
mtpDeviceBackup -o "-av --ignore-existing" -r -O "mobilephotos/A0001" -m "texas" -s "Internal storage/SmartVoiceRecorder"

# SmartVoiceRecorder
mtpDeviceBackup -o "-av --ignore-existing" -r -O "mobilephotos/A0001" -m texas -s "Internal storage/SoundRecorder"

# Call Recordings  and other notes in mf
mtpDeviceBackup -o "-av --ignore-existing" -r -O "mobilephotos/A0001" -m texas -s "Internal storage/mf"

# SJCAM - GoPro footage capture
mtpDeviceBackup -o "-av --ignore-existing" -r -O "mobilephotos/A0001" -m texas -s "Internal storage/SJCAM"

# Backup Messages And Logs - output from backup app
mtpDeviceBackup -o "-av --ignore-existing" -r -O "mobilephotos/A0001" -m texas -s "Internal storage/SmsContactsBackup"

# backup any plugged in cameras or inserted SD cards
diskBackup -o "-av --stats --ignore-existing" -O "CamDisks/SonyCyberShot" -m texas -s "DCIM/100MSDCF"
diskBackup -o "-anv --stats --ignore-existing" -O "CamDisks/SonyCyberShot" -m texas -s "MP_ROOT/100ANV01"

# Back up entire SDCARD on A0001
mtpDeviceBackup -o "-av --ignore-existing" -r -O "Backups/A0001" -m "horizon" -s "Internal storage"
