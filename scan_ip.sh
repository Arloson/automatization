#! /bin/bash

#echo $PING

for (( ip=1; ip < 255; ip++)) 
do
       	#ping -c 1 -t 1 192.168.3.$ip > /dev/null && echo "${ip} is up"; 
	ping -t 1 -c 1 192.168.3.$ip > /dev/null
	if [ $? -eq 0 ] 
	then
		echo "192.168.3.$ip is up"
		echo "192.168.3.$ip" >> ip_host.txt
	else
		echo "192.168.3.$ip is down"
	fi

done

