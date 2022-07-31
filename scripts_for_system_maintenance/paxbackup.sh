#!/bin/bash

if [[ `id -u` != 0 ]]; then
	echo "You must be root"
	exit 1
fi

### SETTINGS FOR CHANGE
BACKUPDIR=/home/avx/  #DEFAULT Directory that you want to backup
###

ARCHIVER=pax
I_BACKUPNAME="INCREMENTAL_BACKUP_BACKUP"
F_BACKUPNAME="FULL_BACKUP"  
timestamp="${BACKUPDIR}".pax_time_stamp
date=`date +%F-%I:%M`
OUTPUTDIR=0
USERNAME=0

command -v ${ARCHIVER}

if [[ $? != 0 ]]; then
	echo "Could not find ARCHIVER: ${ARCHIVER}"
	echo "Aborting..."
	echo "Pleas try installing ${ARCHIVER} using apt-get install ${ARCHIVER}"	
else
	echo "ARCHIVER: ${ARCHIVER} found	[OK]"
fi


function createTimestamp(){
	echo "Creating timestamp @ $timestamp @ $date"
	touch $timestamp
}

if [[ ! -f $timestamp ]]; then
	echo "No timestamp file found"
	read -p "Should we create one? Y/n" answ

	if [[ $answ == "y" ]]; then 
		createTimestamp
	else
		echo "Aborting" 
		exit 1
	fi

fi

function help(){
	cat << "EOF" >&2
	Usage: [-u username][-f full backup]/[-i incremental] [-b backup directory (optional)] [-o backup output directory]
	Example: sudo ./paxbackup.sh -u avx -i -o /tmp/backup/

EOF
	exit 1
}

while getopts "u:b:o:if" opts; do
	case $opts in 
		b) BACKUPDIR=$OPTARG ;;
		u) USERNAME=$OPTARG;;
		o) OUTPUTDIR=$OPTARG ;; 
		i) BTYPE="i" ;;
		f) BTYPE="f" ;;
		?) help
	esac

done

if [[ $OUTPUTDIR == 0 ]]; then 
	echo "No backup OUTPUT directory selected"
	help
else if [[ ! -d $OUTPUTDIR ]]; then
	echo "OUTPUT directory: ${OUTPUTDIR} does NOT exist"
	exit 1
	fi
fi

if [[ $USERNAME == 0 ]]; then 
	echo "No username selected"
	help
fi

###Functions###

function incremental_backup(){
	echo "> Incremental backup of ${BACKUPDIR} selected"
	echo "> Gathering files for user: ${USERNAME} ..."
	echo "> will be written to:  '${OUTPUTDIR}${I_BACKUPNAME}.${date}.pax' "
	
	find "${BACKUPDIR}" -newer "${timestamp}" -user "${USERNAME}" -type f | pax -wvf "${OUTPUTDIR}${I_BACKUPNAME}.${date}.pax"

}

function full_backup(){
	echo "> Incremental backup of ${BACKUPDIR} selected"
	echo "> Gathering files for user: ${USERNAME} ..."
	echo "> will be written to:  '${OUTPUTDIR}${I_BACKUPNAME}.${date}.pax' "

	find "${BACKUPDIR}" -user "${USERNAME}" -type f | pax -wvf "${OUTPUTDIR}${F_BACKUPNAME}.${date}.pax"

}


case $BTYPE in
	i) incremental_backup ;;
	f) full_backup ;;
esac

echo "Backup Completed"
exit 0









