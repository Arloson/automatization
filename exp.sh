#! /usr/bin/expect -f
set timeout -1

proc scat_ip { START_IP } {
	spawn ping -c 1 $START_IP
	

}

proc read_ip {} {
	set f [open "ip_host.txt"]
	set ip [split [read $f] "\n"]
	close $f
	set sizeip [ string length ip ]
	foreach i $ip {
		puts "$i"
		}		
}


proc run_ssh { MY_COUNT } {
set DRWEB "/opt/drweb/drweb"
spawn ssh root@192.168.3.$MY_COUNT 
expect	{
	"*es/no)" {
       	send  "yes\r"
}	
	"*password:" {
	send "12345678\r"
}
}	
#expect 	"password:"
#send  "12345678\r"

expect "#*"
send "$DRWEB\r"
expect "#*"
send "exit\r"
}

set COUNT 1
#run_ssh $COUNT
read_ip

expect eof

