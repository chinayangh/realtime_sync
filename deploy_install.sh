#!/bin/bash

##check system version
#osv=$(awk -F. '{print $1}' /etc/redhat-release | awk '{print $4 }')
osv=$(awk '{match($0,"release "); print substr($0,RSTART+RLENGTH)}' /etc/redhat-release | awk -F. '{print $1}')
#b=6

#cmp=$(echo "$osv == 7" | bc)

if [ $osv == 7 ]
then
	echo "--------The system version is 7--------"	
	echo "--------Begin install Bash & DBAudit--------"	
	wget http://10.x.x.x:8080/HostSEnforce-AS7A-gw.sh -O HostSEnforce-AS7A-gw.sh && sh HostSEnforce-AS7A-gw.sh
#elif [ $(echo "$osv == 6" | bc) == 1 ]
elif [ $osv == 6 ]
then
	echo "--------The system version is 6--------"
	echo "--------Begin install bash&dbaudit--------"	
	wget http://10.x.x.x:8080/HostSEnforce-AS6A-gw.sh -O HostSEnforce-AS6A-gw.sh && sh HostSEnforce-AS6A-gw.sh

#fi

##install ossec
elif [ $? -eq 0 ]
then
	echo "--------Begin install ossec--------"
	wget  http://10.x.x.x:8080/ossec/ossec_agent_install.sh  -O  ossec_agent_install.sh  &&  sh  ossec_agent_install.sh
#fi

##install clamav
elif [ $? -eq 0 ]
then
	echo "--------Begin install clamav--------"
	wget http://10.x.x.x:8080/cla/clamav.sh -O clamav.sh && sh clamav.sh
fi
