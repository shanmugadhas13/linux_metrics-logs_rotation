#!/bin/bash

#This script will rotate the system-metrics log.
#Github repo - https://github.com/shanmugadhas13/linux_metrics-logs_rotation.git

# Set the log directory and file name prefix
LOG_DIR="/var/log/system_metrics"
FILE_PREFIX="system_metrics"

# Set the date format for the output file name
DATE_FORMAT=$(date +%Y%m%d)

# Compress the previous day's log file
PREV_DATE=$(date -d "yesterday" +%Y%m%d)
gzip $LOG_DIR/$FILE_PREFIX\_$PREV_DATE.csv

# Move the compressed log file to a directory with the current date
mkdir -p $LOG_DIR/$DATE_FORMAT
mv $LOG_DIR/$FILE_PREFIX\_$PREV_DATE.csv.gz $LOG_DIR/$DATE_FORMAT/

# Remove any empty directories in the log directory
find $LOG_DIR -type d -empty -delete
