# this script will display some basic information 
#these information are  handy after first bootup
#author : youknowhoiam
echo -e "\e[31;43m*****your current ip address *****\e[0m"
ifconfig ens33 | grep 'inet addr'|cut -d: -f2 | awk '{ print $1}'
echo  -e  "\e[31;43m******network statistics*******\e[0m"
netstat -s
# -Hostname information:
echo -e "\e[31;43m***** HOSTNAME INFORMATION *****\e[0m"
hostnamectl
echo ""
# -File system disk space usage:
echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""
# -Free and used memory in the system:
echo -e "\e[31;43m ***** FREE AND USED MEMORY *****\e[0m"
free
echo ""
# -System uptime and load:
echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""
# -Logged-in users:
echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who
echo ""
# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;43m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo  -e  "\e[31;43m*********ssh service status******\e[0m]"
service=ssh

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$service is running!!!"
else
echo  "ssh service is not running"
fi
echo -e "\e[1;32mDone.\e[0m"
