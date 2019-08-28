#! /usr/bin/expect -f
set timeout -1
#Take command for run at remote machine
#The command start as demon
proc read_ip {} {
	set f [open "ip_host.txt"]
	set VAR [lindex $::argv 0]
	while { [gets $f line] >= 0 } {
	
		run_ssh $line $VAR
	}

	close $f

	
}


proc run_ssh { MY_COUNT MY_COMMAND } {
set DRWEB "/opt/drweb/drweb"
spawn ssh root@$MY_COUNT 
expect	{
	"*es/no)" {
       	send  "yes\r"
}	
	"*password:" {
	send "12345678\r"
}
}	

expect "#*"
#send "/scan.sh &\r"
send "$MY_COMMAND &\r"
expect "\[1\]*\r"
send "exit\r"
}

set COUNT 1

read_ip

expect eof

