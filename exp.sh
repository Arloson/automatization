#! /usr/bin/expect -f
set timeout -1


proc read_ip {} {
	set f [open "ip_host.txt"]
	#set ip [split [read $f] "\n"]
	#set len [llength $ip]
	#puts "$len"
	
	while { [gets $f line] >= 0 } {
		run_ssh $line
	}

	close $f

	#foreach i $ip {
	#	run_ssh $i
	#	}		
}


proc run_ssh { MY_COUNT } {
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
send "/scan.sh &\r"
set o "\[1\]"
expect "\[1\]*\r"
send "exit\r"
}

set COUNT 1

read_ip

expect eof

