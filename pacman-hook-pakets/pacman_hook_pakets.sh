#!/bin/bash
#
# _____               _ _
#|_   _|__   __ _  __| (_) ___
#  | |/ _ \ / _` |/ _` | |/ _ \
#  | | (_) | (_| | (_| | |  __/
#  |_|\___/ \__,_|\__,_|_|\___|
#


LOGDATE=$(date +%b.%d.%Y)
LOGTIME=$(date +%H:%M)
LOGPATH=/home/YOURUSER/Logs/
LOGFILE="Pacman_$HOSTNAME"_"$LOGDATE.md"

UPDATELOGDATE=$(date +%d.%m.%Y)
UPDATELOG="Update_$HOSTNAME.md"

function getPacman 
{
    echo "---" >> $LOGPATH$LOGFILE
    echo "tags:" >> $LOGPATH$LOGFILE
    echo "- Backup" >> $LOGPATH$LOGFILE
    echo "- Log" >> $LOGPATH$LOGFILE
    echo "---" >> $LOGPATH$LOGFILE

    echo "## " $LOGDATE "-" $LOGTIME "Uhr" >> $LOGPATH$LOGFILE

    echo "### Pacman Packages" >> $LOGPATH$LOGFILE
    echo '```txt' >> $LOGPATH$LOGFILE
    pacman -Qqen >> $LOGPATH$LOGFILE
    echo '```' >> $LOGPATH$LOGFILE

    echo "### Non Pacman Packages" >> $LOGPATH$LOGFILE
    echo '```txt' >> $LOGPATH$LOGFILE
    pacman -Qqem >> $LOGPATH$LOGFILE
    echo '```' >> $LOGPATH$LOGFILE

    echo "### Flatpak Packages" >> $LOGPATH$LOGFILE
    echo '```txt' >> $LOGPATH$LOGFILE
    flatpak list >> $LOGPATH$LOGFILE
    echo '```' >> $LOGPATH$LOGFILE
}

function CleanUp
{
    find $LOGPATH/Pacman_$HOSTNAME_*.md -mtime +5 -delete
}

function UpdateLog
{
    echo $UPDATELOGDATE "-" $LOGTIME >> $LOGPATH$UPDATELOG
}

getPacman
CleanUp
UpdateLog
