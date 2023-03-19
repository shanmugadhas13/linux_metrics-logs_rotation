# linux_metrics-logs_rotation
Simple bash scripts to record system metrics every minute and rotate

Add the above scripts in linux system in required paths.

Configure cron for the above scripts - 
system-metrics.sh (every minute) and 
system-metrics-rotator.sh (everyday at 12:00am)

* * * * * /path/to/system-metrics.sh
0 3 * * * /path/to/system-metrics-rotator.sh

