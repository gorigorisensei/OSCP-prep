#!/bin/bash
# this script takes rustscan result (all ports) and put them in one line with a comma seperator which are then passed as an argument of an nmap scan
# Execution example: 
# 1. Save the output from the rust scan to a file --- ports.txt
# i.e) Open 10.11.1.21:21
#Open 10.11.1.21:80
#Open 10.11.1.21:135
#Open 10.11.1.21:139
#Open 10.11.1.21:445
#Open 10.11.1.21:3389
# 2. Run the script (make sure to change the permission of this file)!

 echo -e "
███████  ██████  █████  ███    ██     ████████ ██   ██ ███████ ███    ███      █████  ██      ██
██      ██      ██   ██ ████   ██        ██    ██   ██ ██      ████  ████     ██   ██ ██      ██
███████ ██      ███████ ██ ██  ██        ██    ███████ █████   ██ ████ ██     ███████ ██      ██
     ██ ██      ██   ██ ██  ██ ██        ██    ██   ██ ██      ██  ██  ██     ██   ██ ██      ██
███████  ██████ ██   ██ ██   ████        ██    ██   ██ ███████ ██      ██     ██   ██ ███████ ███████
                                                                                 
                                                                  gorigorisensei               
"


echo "Please enter the IP address you would like to scan these ports" 

read ip_addr

combine_ports() {
	cat ports.txt | awk -F: '{print $2}'| tr '\n' ',' | sed 's/,$//g'
	return 
}



result=$(combine_ports) 

nmap -A -sV -sC -Pn $ip_addr -p $result
