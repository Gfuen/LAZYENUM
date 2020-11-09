#!/bin/bash

function welcome {
    echo "
 _     ____  ____ ___  _ _____  _    _ _   _  _     __
/ \   /  _ \/_   \\\  \//  __/ | \   || | | || \    /|
| |   | / \| /   / \  / |  \   |  \  || | | ||  \  / |
| |_/\| |-||/   /_ / /  |  /_  |   \ || |_| ||   \/  |
\____/\_/ \|\____//_/   \____\\|    \||_____||       |
    "
    echo "Welcome to the LAZYENUM script by Gregory Fuentes"
    echo "The purpose of this script is to make Host enumeration more automated given simple user input."
}
function help {
    echo "LAZYENUM 1.0"
    echo "Program Usage: [Input_Option]"
    echo "Example: 1"
    echo "1) NMAP FAST SCAN: "
    echo "  Usage: nmap <host> -vvv -Pn -sV -sC -O -o <output_file> --top-ports 2000"
    echo "  Example: nmap 1.1.1.1 -vvv -Pn -sV -sC -O -o output.txt --top-ports 2000"
    echo "2) NMAP FULL SCAN: "
    echo "  Usage: nmap <host> -vvv -Pn -sV -sC -O -o <output_file> --top-ports 2000"
    echo "  Example: nmap 1.1.1.1 -vvv -Pn -sV -sC -O -o output.txt --top-ports 2000"
    echo "3) GOBUSTER WITHOUT AUTH"
    echo "  Usage: gobuster dir -e -u <url> --wildcard -t 30 -r -w <wordlist> -r -f -b 302,400,404 -o <output>"
    echo "  Example: gobuster dir -e -u http://192.168.0.155/ --wildcard -t 30 -r -w /usr/share/wordlists/dirb/common.txt -r -f -b 302,400,404 -o output.txt"
    echo "4) GOBUSTER WITH AUTH"
    echo "  Usage: gobuster dir -e -u <url> -w <wordlist> -t 30 -v -r -s 302,400,404 -u <user> -p <password> -fw -o <output.txt>"
    echo "  Example: gobuster dir -e -u http://192.168.0.155/ -w /usr/share/wordlists/dirb/common.txt -t 30 -v -r -s 302,400,404 -u testuser -p testpass -fw -o <output.txt>"
    echo "5) NIKTO WITHOUT AUTH"
    echo "  Usage: nikto -Display 1234EPV -o <output.txt> -Format htm -Tuning 1234567890abcdex -host <url> -404code -404string"
    echo "  Example: nikto -Display 1234EPV -o output.txt -Format htm -Tuning 1234567890abcdex -host http://192.168.0.155/ -404code -404string"
    echo "6) NIKTO WITH AUTH"
    echo "  Usage: nikto -Display 1234EPV -o <output.txt> -Format htm -Tuning 1234567890abcdex -host <url> -404code -404string -id <user>:<password>"
    echo "  Example: nikto -Display 1234EPV -o output.txt -Format htm -Tuning 1234567890abcdex -host http://192.168.0.155/ -404code -404string -id testuser:testpass"   
    echo "7) TCPDUMP GENERAL"
    echo "  Usage: tcpdump -i <interface> host <url> -vvv -t -w <outputfile.txt>"
    echo "  Example: tcpdump -i eth0 host 192.168.1.185 -vvv -t -w outputfile.txt"      
    echo "8) TCPDUMP GENERAL WITH PORT"
    echo "  Usage: tcpdump -i <interface> host <url> -vvv -t -w <outputfile.txt> port <port>"
    echo "  Example: tcpdump -i eth0 host 192.168.1.185 -vvv -t -w outputfile.txt port 22"   
    echo "9) TCPDUMP GENERAL WITH PORT AND PROTOCOL"
    echo "  Usage: tcpdump -i <interface> host <url> -vvv -t -w <outputfile.txt> <protocol> port <port>"
    echo "  Example: tcpdump -i eth0 host 192.168.1.185 -vvv -t -w outputfile.txt tcp port 22"  
    echo "10) DNSENUM"
    echo "  Usage: dnsenum --noreverse -o <output.txt> <domain>"
    echo "  Example: dnsenum --noreverse -o mydomain.xml example.com"  
    echo "11) SQLMAP"
    echo "  Usage: sqlmap -u <url> -v 6 -a"
    echo "  Example: sqlmap -u 'http://192.168.1.250/?p=1&forumaction=search' -v 6 -a"  
    echo "12) ENUM4LINUX"
    echo "  Usage: enum4linux -v -a <host>"
    echo "  Example: enum4linux -v -a 192.168.1.200"     
    echo "13) ENUM4LINUX WITH AUTH"
    echo "  Usage: enum4linux -u <user> -p <password> -v -a <host>"
    echo "  Example: enum4linux -u testuser -p testpass -v -a 192.168.1.200" 
    echo "14) HELP"    
    echo "15) QUIT"
}
function nmap_fast {
    nmap $1 -vvv -Pn -sV -sC -O -o $2 --top-ports 2000
}
function nmap_full {
    nmap $1 -vvv -Pn -sV -sC -O -o $2 -F
}
function gobuster_without_auth {
    gobuster dir -e -u $1 --wildcard -t 30 -r -w $2 -r -f -b 302,400,404 -o $3
}
function gobuster_with_auth {
    gobuster dir -e -u $1 -w $2 -t 30 -v -r -s 302,400,404 -u $3 -p $4 -fw -o $5
}
function nikto {
    nikto -Display 1234EPV -o $1 -Format htm -Tuning 1234567890abcdex -host $2 -404code -404string
}
function nikto_with_auth {
    nikto -Display 1234EPV -o $1 -Format htm -Tuning 1234567890abcdex -host $2 -404code -404string -id $3:$4
}
function tcpdump_general {
    tcpdump -i $1 host $2 -vvv -t -w $3
}
function tcpdump_port {
    tcpdump -i $1 host $2 -vvv -t -w $3 port $4
}
function tcpdump_port_and_protcol {
    tcpdump -i $1 host $2 -vvv -t -w $3 $4 port $5
}
function dnsenum {
    dnsenum --noreverse -o $1 $2
}
function sqlmap {
    sqlmap -u $1 -v 6 -a
}
function enum4linux {
    enum4linux -v -a $1
}
function enum4linux_with_auth {
    enum4linux -u $1 -p $2 -v -a $3
}
function quit {
    exit
}
function error {
    echo "Input cant seem to be resolved. Please try again using the help prompt and usage"
    main()
}
function main {
  welcome()
  help()
  read user_input
  case $user_input in
  1)
    echo "1) NMAP FAST SCAN: "
    echo "Please input host to be scanned by nmap: "
    read nmap_host
    echo "Please input desired name of output file: "
    read output
    nmap_fast nmap_host output
    ;;
  2)
    echo "2) NMAP FULL SCAN: "
    echo "Please input host to be scanned by nmap: "
    read nmap_host
    echo "Please input desired name of output file: "
    read output
    nmap_full nmap_host output
    ;;
  3)
    echo "3) GOBUSTER WITHOUT AUTH"
    echo "Please input host to be scanned by gobuster: "
    read gobuster_host
    echo "Please enter the location of the wordlist to be used: "
    read wordlist
    echo "Please input desired name of output file: "
    read output
    gobuster_without_auth gobuster_host wordlist output
    ;;
  4)
    echo "4) GOBUSTER WITH AUTH"
    echo "Please input host to be scanned by gobuster: "
    read gobuster_host
    echo "Please enter the location of the wordlist to be used: "
    read wordlist
    echo "Please input desired name of output file: "
    read output
    echo "Please input username to test with: "
    read user
    echo "Please input password to test with: "
    read pass 
    gobuster_with_auth gobuster_host wordlist user pass output 
    ;;

  5)
    echo "5) NIKTO WITHOUT AUTH"
    echo "Please input host to be scanned by nikto: "
    read nikto_host
    echo "Please input desired name of output file: "
    read output
    nikto output nikto_host
    ;;

  6)
    echo "6) NIKTO WITH AUTH"
    echo "Please input host to be scanned by nikto: "
    read nikto_host
    echo "Please input desired name of output file: "
    read output
    echo "Please input username to test with: "
    read user
    echo "Please input password to test with: "
    read pass 
    nikto_with_auth output nikto_host user pass 
    ;;
  7)
    echo "7) TCPDUMP GENERAL"
    echo "Please input the interface to be used by tcpdump"
    read interface
    echo "Please input the host where to monitor network traffic"
    read host 
    echo "Please input the filename for tcpdump to write to"
    read filename
    tcpdump_general interface host filename
    ;;
  8)
    echo "8) TCPDUMP GENERAL WITH PORT"
    echo "Please input the interface to be used by tcpdump"
    read interface
    echo "Please input the host where to monitor network traffic"
    read host 
    echo "Please input the filename for tcpdump to write to"
    read filename
    echo "Please input the port to monitor network traffic on"
    read port
    tcpdump_port interface host filename port 
    ;;
  9)
    echo "9) TCPDUMP GENERAL WITH PORT AND PROTOCOL"
    echo "Please input the interface to be used by tcpdump"
    read interface
    echo "Please input the host where to monitor network traffic"
    read host 
    echo "Please input the filename for tcpdump to write to"
    read filename
    echo "Please input the protcol to monitor network traffic on"
    read protocol
    echo "Please input the port to monitor network traffic on"
    read port  
    tcpdump_port_and_protcol interface host filename protocol port
    ;;
  10)
    echo "10) DNSENUM"
    echo "Please input the output filename"
    read output
    echo "Please input the domain to be scanned"
    read domain
    dnsenum output domain
    ;;
  11)
    echo "11) SQLMAP"
    echo "Please input the url to be scanned by sqlmap"
    read url
    sqlmap url
    ;;
  12)
    echo "12) ENUM4LINUX" 
    echo "Please input the host to be scanned by enum4linux"
    read host
    enum4linux host  
    ;;
  13)
    echo "13) ENUM4LINUX WITH AUTH"
    echo "Please input the username to be used for enum4linux"
    read user
    echo "Please input the password to be used for enum4linux"
    read pass
    echo "Please input the host to be used for enum4linux"
    read host
    enum4linux_with_auth user pass host 
    ;;
  14)
    echo "14) HELP"   
    main()
    ;;
  15)
    echo "15) QUIT"
    quit()
    ;;
  *)
    error()
    ;;
esac  
}


main()

