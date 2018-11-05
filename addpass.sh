#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
#MYIP=$(wget -qO- ipv4.icanhazip.com)


echo "------------------------ MEMBUAT AKUN SSH ------------------------"
echo "           DEVELOPED BY YUSUF ARDIANSYAH AND ELANG OVERDOSIS           " 
echo ""

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "Username [$username] sudah ada!"
	exit 1
else
	read -p "Isikan password akun [$username]: " password
	

	touch etc/[$username].json
	echo "$username:$password"
clear
echo -e ""
echo -e ""
echo -e ""
echo -e "==========================================="
echo -e "|         Informasi Akun Baru SSH         |"  
echo -e "============[[-SERVER-PREMIUM-]]===========" 
echo -e "     Host: $MYIP"  | lolcat
echo -e "     Username: $username"  
echo -e "     Password: $password                   " 
echo -e "     Port default dropbear: 442,80         "  
echo -e "     Port default SSL/TLS : 443            " 
echo -e "     Port default openSSH : 22,143         "  
echo -e "     Port default squid   : 8080,3128      " 
echo -e "                                           " 
echo -e "     Peringatan: Maksimal 2 login          "  
echo -e "-------------------------------------------"
echo -e "     Aktif Sampai: $(date -d "$AKTIF days" +"%d-%m-%Y")"  
echo -e "===========================================" 
echo -e "   DI LARANG:                              " 
echo -e "   HACKING-DDOS-PHISING-SPAM-TORENT        "  
echo -e "   CARDING-CRIMINAL CYBER.                 " 
echo -e "===========================================" 
echo -e "   Script by Yusuf Ardiansyah              " 
echo -e "   Config OVPN:                            " 
echo -e "   http://$MYIP:81/client.ovpn        "  
echo -e "-------------------------------------------"
echo -e ""
echo -e ""
fi
