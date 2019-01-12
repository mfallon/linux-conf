m!/bin/bash

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

# Back up entire SDCARD on A0001
mtpDeviceBackup -o "-av --ignore-existing" -r -O "Backups/A0001" -m "horizon" -s "Internal storage"

# backup any plugged in cameras or inserted SD cards
diskBackup -o "-av --stats --ignore-existing" -O "CamDisks/SonyCyberShot" -m texas -s "DCIM/100MSDCF"
diskBackup -o "-anv --stats --ignore-existing" -O "CamDisks/SonyCyberShot" -m texas -s "MP_ROOT/100ANV01"

# UPDATE
# scripts need to be rewritten for raspi environment anyway
./diskBackup -o "-anv --stats --ignore-existing" -O "Photos/CamDisks/SonyCyberShot" -m california -s "DCIM/100MSDCF"

# OpenCamera
./mtpDeviceBackup -o "-anv --stats --ignore-existing" -O "Photos/OnePlus1/OpenCamera" -m california -s "Internal storage/DCIM/OpenCamera"
./mtpDeviceBackup -o "-anv --stats --ignore-existing" -r -O "Backups/uncompressed/OnePlus1" -m california -s "Internal storage/callRecordsApp"
./mtpDeviceBackup -o "-anv --stats --ignore-existing" -r -O "Backups/uncompressed/OnePlus1" -m california -s "Internal storage/Snapseed"
./mtpDeviceBackup -o "-anv --stats --ignore-existing" -r -O "Backups/uncompressed/OnePlus1" -m california -s "Internal storage/TomTom_MySports"
./mtpDeviceBackup -o "-anv --stats --ignore-existing" -r -O "Backups/uncompressed/OnePlus1" -m california -s "Internal storage/WhatsApp"
./mtpDeviceBackup -o "-anv --stats --ignore-existing" -r -O "Backups/uncompressed/OnePlus1" -m california -s "Internal storage/SMSBackupRestore"
./mtpDeviceBackup -o "-anv --stats --ignore-existing" -r -O "Backups/uncompressed/OnePlus1" -m california -s "Internal storage/pw.kbdx"
