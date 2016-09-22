#!/bin/sh
#REMOTE_SERV_ADDRESS='vohray@10.136.20.21';
#REMOTE_SERV_SYNC_DIR='/Users/vohray/yug_ws/temp';
MAILING_ADDRESS_ON_FAILURE='vyugesh@thoughtworks.com'
DIR_TO_BACKUP='/db-backup/,/home/bahmni/uploaded_results,/home/bahmni/document_images,/home/bahmni/.bahmni-reports,/home/bahmni/patient_images,/home/bahmni/uploaded-files'
SENDMAIL=false
USAGE="script should be used as backup.sh <user@remore_server.com> <remote_backup_dir>"

#parsing the command line options
while getopts "m:d:f:" opt ;
do
    case $opt in
        m) SENDMAIL="$OPTARG";;
        d) DIR_TO_BACKUP="$OPTARG";;
        f) MAILING_ADDRESS_ON_FAILURE="$OPTARG";;
        *) echo "$USAGE"
        exit 0 ;;
    esac
done

#fetching the command line arguments for remote server address and directory
while [[ "$1" == -* ]];
do
    shift 2;
done

REMOTE_SERV_ADDRESS="$1";
REMOTE_SERV_SYNC_DIR="$2";
echo "connecting to $REMOTE_SERV_ADDRESS at $REMOTE_SERV_SYNC_DIR"

DIRS=(${DIR_TO_BACKUP//,/ })

STATUS_MESSAGE_PREFIX="Directories"
STATUS_MESSAGE="";
STATUS_MESSAGE_POSTFIX="have been synched"
ERROR_MESSAGE="Rsync failed"
ERROR_FLAG=false
CURRENT_DIR=""

#loopping through the directories
for Dir in ${DIRS[@]}
do
    CURRENT_DIR="$Dir"
    rsync -avzpe ssh $Dir $REMOTE_SERV_ADDRESS:$REMOTE_SERV_SYNC_DIR
    if [[ $? -ne 0 ]] ; then
    ERROR_FLAG=true;
    break;
fi
STATUS_MESSAGE+="$Dir "
done

#mail program should be installed and sendmail should be set as true using -m option argument
if [[ "$ERROR_FLAG" = true && "$SENDMAIL" = true ]]; then
MESSAGE="$STATUS_MESSAGE_PREFIX $STATUS_MESSAGE $STATUS_MESSAGE_POSTFIX"
echo -e "$ERROR_MESSAGE on $CURRENT_DIR
$MESSAGE" |mail -s "Rsync failed" -S from=rsync_error@Bahmni.failure.com $MAILING_ADDRESS_ON_FAILURE
fi

MESSAGE="$STATUS_MESSAGE_PREFIX $STATUS_MESSAGE $STATUS_MESSAGE_POSTFIX"
echo $MESSAGE
