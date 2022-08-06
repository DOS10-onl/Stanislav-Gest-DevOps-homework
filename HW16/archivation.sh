#!/bin/bash

####################################### Task ########################################################################
### [] create backup script for some data folder                                                                     #
### [] this script should be able to work in different modes                                                         #
##### [] backups minutely (with miliseconds in the archive name): 2022-07-17-09:53:53.3332211.zip                    #
##### [] backups hourly (with just day-hour): 2022-07-17-09:53.zip                                                   #
##### [] backups daily: 2022-07-17.zip                                                                               #
### [] script should also include archive file list in the archive and some meta information                         #
### [ ] about the execution details (who, when and how)                                                               #
### [ ] script should be added in crontab                                                                             #
#####################################################################################################################

# Инструменты:
# zip
# cron

# Фунционал:
# + получить параметры - путь папки и режим
# + создание и заполнение мета файла
# + вывести содержимое папки, которая будет архивироваться в мета файла
# + архивация
# +- крон
# копирование на удаленный сервер

# install tree
sudo apt-get install tree zip -y > /dev/null

MODE=$1          #cron mode
PATH_FOLDER=$2      #archive path
# TODO: add second parameter for script to input the folder to backup
#PATH_FOLDER="./app"

# create cron and archive name
case $MODE in
    "minutely")
        cron_schedule="* * * * *"        
        archive_name=$(date +%Y-%m-%d-%T.%7N)
        ;;
    "hourly")
        cron_schedule="1 * * * *"
        archive_name=$(date +%Y-%m-%d-%H)
        ;;
    "daily")
        cron_schedule="0 20 * * *"
        archive_name=$(date +%Y-%m-%d)
        ;;
    *)
        echo "Wrong input"
        exit 1
        ;;
esac

# Checking the user or process who run this script
#shellcheck disable=SC2009
CRON=$(ps -ef | grep "/usr/sbin/CRON -f" | awk '{print $2}' | head -1)  # checking the PID of CRONjob
#shellcheck disable=SC2009
SCRIPT=$(ps -ef | grep "$0 $1" | awk '{print $3}' | head -1)            # checking the PPID the our running script
if [ "$CRON" -eq "$SCRIPT" ]; then 
      LAUNCHER="start from CRON"
else
      LAUNCHER="start from user"
fi
# Create file meta.txt and write some info to it
touch /home/stas/examples/lesson16/meta.txt     
{
whoami 
date 
echo "Mode: $MODE" 
echo "Launcher: $LAUNCHER"
echo "List of files:"
tree /home/stas/examples/lesson16               
} > /home/stas/examples/lesson16/meta.txt       
# archivation 
echo "Adding files to zip archive"
sleep 1
zip "$PATH_FOLDER/$archive_name".zip -r "/home/stas/examples/lesson16/meta.txt" "/home/stas/examples/lesson16"  
# Checking active crontab and if there is not job, add to CRON
if crontab -l | grep "$0" ; then  
    echo "Crontab have job. The cron job see above" 
else    
    sleep 1
    echo "Add job to crontab"
    echo "$cron_schedule /home/stas/homework/Stanislav-Gest-DevOps-homework/HW16/archivation.sh $1 $2" | crontab   # adding job to CRON. 
fi
# Copying to remote server
scp "$PATH_FOLDER/$archive_name".zip /home/stas/examples/lesson16   