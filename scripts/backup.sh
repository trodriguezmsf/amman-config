#!/bin/sh
REMOTE_SERV_ADDRESS='vohray@10.136.20.21';
REMOTE_SERV_SYNC_DIR='/Users/vohray/yug_ws/temp';
MAILING_ADDRESS_ON_FAILURE='vyugesh@thoughtworks.com'
DIR_TO_BACKUP='/db-backup/,/home/bahmni/uploaded_results,/home/bahmni/document_images,/home/bahmni/.bahmni-reports,/home/bahmni/patient_images,/home/bahmni/uploaded-files'
SENDMAIL=false
while getopts "s:m:d:f:" opt ;
do
    case $opt in
        s) REMOTE_SERV_ADDRESS="$OPTARG";;
        m) SENDMAIL="$OPTARG";;
        d) DIR_TO_BACKUP="$OPTARG";;
        f) MAILING_ADDRESS_ON_FAILURE="$OPTARG";;
        *) echo "Invalid Argument $OPTARG"
        exit 0 ;;
    esac
done
DIRS=(${DIR_TO_BACKUP//,/ })
STATUS_MESSAGE_PREFIX="Directories"
STATUS_MESSAGE="";
STATUS_MESSAGE_POSTFIX="have been synched"
ERROR_MESSAGE="Rsync failed"
ERROR_FLAG=false
CURRENT_DIR=""
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
if [[ "$ERROR_FLAG" = true && "$SENDMAIL" = true ]]; then
MESSAGE="$STATUS_MESSAGE_PREFIX $STATUS_MESSAGE $STATUS_MESSAGE_POSTFIX"
echo -e "$ERROR_MESSAGE on $CURRENT_DIR
$MESSAGE" |mail -s "Rsync failed" -S from=rsync_error@Bahmni.failure.com $MAILING_ADDRESS_ON_FAILURE
fi
MESSAGE="$STATUS_MESSAGE_PREFIX $STATUS_MESSAGE $STATUS_MESSAGE_POSTFIX"
echo $MESSAGE
