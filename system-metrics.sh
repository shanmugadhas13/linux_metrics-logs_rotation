#!/bin/bash

#This script will record metrics every minute and stores in output file.
#Github repo - https://github.com/shanmugadhas13/linux_metrics-logs_rotation.git

# The output directory and file name for storing the data
OUTPUT_DIR="/var/log/system_metrics"
OUTPUT_FILE="system_metrics_$(date +%Y%m%d).csv"

# Creating the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Write headers to the output file -
echo "Timestamp, Load Average, Memory Used (MB), Memory Available (MB), Disk Used (GB), Disk Available (GB)" > $OUTPUT_DIR/$OUTPUT_FILE

while true
do
  # Get the current timestamp
  TIMESTAMP=$(date +%Y-%m-%d\ %H:%M:%S)

  # Get the system load average
  LOAD=$(uptime | awk '{print $10}')

  # Get the memory usage
  MEM_USED=$(free -m | awk 'NR==2{print $3}')
  MEM_AVAIL=$(free -m | awk 'NR==2{print $4}')

  # Get the disk usage
  DISK_USED=$(df -h / | awk 'NR==2{print $3}')
  DISK_AVAIL=$(df -h / | awk 'NR==2{print $4}')

  # Write the metrics to the output file with spaces so output is stored exactly under each header-
  printf "%s,%s,%12s,%18s,%12s,%18s\n" "$TIMESTAMP" "$LOAD" "$MEM_USED" "$MEM_AVAIL" "$DISK_USED" "$DISK_AVAIL" >> $OUTPUT_DIR/$OUTPUT_FILE

  # Wait for one minute before collecting the next set of metrics
  sleep 60
done

