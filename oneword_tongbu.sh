#!/bin/bash
/usr/bin/inotifywait -mrq  --timefmt '%d/%m/%y %H:%M:%S' --format '%T %e %w%f' -e create,close_write /var/XXX/Record/201X/0X | while read file;  do  INO_FILE=$(echo $file | awk '{print $4}');  /usr/bin/rsync -avuz -e 'ssh -p XXXX'  --size-only  ${INO_FILE} root@192.168.X.X:/home/XXX/20XX-XX/ > /dev/null 2>&1;  done
