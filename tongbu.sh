#!/bin/bash
/usr/bin/inotifywait -mrq  --timefmt '%d/%m/%y %H:%M:%S' --format '%T %e %w%f' -e create,close_write /var/xxx/RecXXd/2017/10/ | while read file; 
do 
INO_FILE=$(echo $file | awk '{print $4}')
#echo $file | awk '{print $4}'

 /usr/bin/rsync -avuz -e 'ssh -p 22'  --size-only  ${INO_FILE} root@192.168.X.X:/home/meXXX/10/ > /dev/null 2>&1 &

done
