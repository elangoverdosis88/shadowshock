#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;

MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

	source="https://raw.githubusercontent.com/elangoverdosis88/cinta"


# go to root
cd




# install wget and curl
apt-get update
apt-get -y install wget curl
apt-get install gem
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime










# remove unused
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;



# update



# update apt-file
apt-file update

# update
apt-get update
apt-get -y upgrade

# install shadowshock
apt-get install python
apt-get install python-pip
apt-get install sudo
apt-get install git
apt-get update
apt-get -y upgrade

pip install git+https://github.com/shadowsocks/shadowsocks.git@master
# password shadowshock
sudo ssserver -p 8388 -k 12345678 -m aes-256-cfb --user nobody -d start



cd
# cronjob
echo "02 */12 * * * root service dropbear restart" > /etc/cron.d/dropbear
echo "00 23 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/disable-user-expire
echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "00 01 * * * root echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a" > /etc/cron.d/clearcacheram3swap
echo "*/3 * * * * root /usr/bin/clearcache.sh" > /etc/cron.d/clearcache1








cd
rm -f /root/.bash_history && history -c


# info


echo "=======================================================" | tee -a log-install.txt
cd ~/
rm -f /root/shadow.sh





