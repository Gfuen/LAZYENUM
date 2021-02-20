# LAZYENUM (IN PROGRESS STAY TUNED!)
The purpose of this script is to make Host enumeration more automated given simple user input.

LAZYENUM 1.0 
Program Usage: [Input_Option] 
Example: 1 
1) NMAP FAST SCAN:  
  Usage: nmap <host> -vvv -Pn -sV -sC -O -o <output_file> --top-ports 2000 
  Example: nmap 1.1.1.1 -vvv -Pn -sV -sC -O -o output.txt --top-ports 2000 
2) NMAP FULL SCAN:  
  Usage: nmap <host> -vvv -Pn -sV -sC -O -o <output_file> --top-ports 2000 
  Example: nmap 1.1.1.1 -vvv -Pn -sV -sC -O -o output.txt --top-ports 2000 
3) GOBUSTER WITHOUT AUTH 
  Usage: gobuster dir -e -u <url> --wildcard -t 30 -r -w <wordlist> -r -f -b 302,400,404 -o <output> 
  Example: gobuster dir -e -u http://192.168.0.155/ --wildcard -t 30 -r -w /usr/share/wordlists/dirb/common.txt -r -f -b 302,400,404 -o output.txt 
4) GOBUSTER WITH AUTH 
  Usage: gobuster dir -e -u <url> -w <wordlist> -t 30 -v -r -s 302,400,404 -u <user> -p <password> -fw -o <output.txt> 
  Example: gobuster dir -e -u http://192.168.0.155/ -w /usr/share/wordlists/dirb/common.txt -t 30 -v -r -s 302,400,404 -u testuser -p testpass -fw -o <output.txt> 
5) NIKTO WITHOUT AUTH 
  Usage: nikto -Display 1234EPV -o <output.txt> -Format htm -Tuning 1234567890abcdex -host <url> -404code -404string 
  Example: nikto -Display 1234EPV -o output.txt -Format htm -Tuning 1234567890abcdex -host http://192.168.0.155/ -404code -404string 
6) NIKTO WITH AUTH 
  Usage: nikto -Display 1234EPV -o <output.txt> -Format htm -Tuning 1234567890abcdex -host <url> -404code -404string -id <user>:<password> 
  Example: nikto -Display 1234EPV -o output.txt -Format htm -Tuning 1234567890abcdex -host http://192.168.0.155/ -404code -404string -id testuser:testpass    
7) TCPDUMP GENERAL 
  Usage: tcpdump -i <interface> host <url> -vvv -t -w <outputfile.txt> 
  Example: tcpdump -i eth0 host 192.168.1.185 -vvv -t -w outputfile.txt  
8) TCPDUMP GENERAL WITH PORT 
  Usage: tcpdump -i <interface> host <url> -vvv -t -w <outputfile.txt> port <port> 
  Example: tcpdump -i eth0 host 192.168.1.185 -vvv -t -w outputfile.txt port 22    
9) TCPDUMP GENERAL WITH PORT AND PROTOCOL 
  Usage: tcpdump -i <interface> host <url> -vvv -t -w <outputfile.txt> <protocol> port <port> 
  Example: tcpdump -i eth0 host 192.168.1.185 -vvv -t -w outputfile.txt tcp port 22   
10) DNSENUM 
  Usage: dnsenum --noreverse -o <output.txt> <domain> 
  Example: dnsenum --noreverse -o mydomain.xml example.com   
11) SQLMAP 
  Usage: sqlmap -u <url> -v 6 -a 
  Example: sqlmap -u 'http://192.168.1.250/?p=1&forumaction=search' -v 6 -a   
12) ENUM4LINUX 
  Usage: enum4linux -v -a <host> 
  Example: enum4linux -v -a 192.168.1.200 
13) ENUM4LINUX WITH AUTH 
  Usage: enum4linux -u <user> -p <password> -v -a <host> 
  Example: enum4linux -u testuser -p testpass -v -a 192.168.1.200  
14) HELP
15) QUIT 
