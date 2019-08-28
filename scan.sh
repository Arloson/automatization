#! /bin/bash
scan_ip(){
for (( ip=1; ip < 255; ip++))
do 
        
        ping -t 1 -c 1 192.168.3.$ip > /dev/null
        if [ $? -eq 0 ] 
        then
                echo "192.168.3.$ip is up"
                echo "192.168.3.$ip" >> ip_host.txt
        else
                echo "192.168.3.$ip is down"
        fi

done

}



parse_host(){
ARM=`grep -Eo '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' /etc/hosts`

for v in $ARM
do
		
	echo $v >> ip.txt	 
done
}

scan_ip
#parse_host

