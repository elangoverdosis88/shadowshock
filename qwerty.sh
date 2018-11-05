#!/bin/bash



# go to root
cd




# install wget and curl
apt-get update;apt-get -y install wget curl;
apt-get install gem
apt-get install git
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime






# remove unused
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;



# update
apt-get update;apt-get -y upgrade;

# install shadowshock
apt-get install python
apt-get install python-pip
apt-get install sudo
apt-get install git
apt-get install pip

pip install git+https://github.com/shadowsocks/shadowsocks.git@master
# password shadowshock
sudo ssserver -p 8388 -k 12345678 -m aes-256-cfb --user nobody -d start











# update apt-file
apt-file update








 















# cronjob
echo "1 */12 * * * root service dropbear restart" > /etc/cron.d/dropbear
echo "0 23 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/disable-user-expire
echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "0 1 * * * root echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a" > /etc/cron.d/clearcacheram3swap
echo "*/3 * * * * root /usr/bin/clearcache.sh" > /etc/cron.d/clearcache1



# swap ram
dd if=/dev/zero of=/swapfile bs=1024 count=4096k
# buat swap
mkswap /swapfile
# jalan swapfile
swapon /swapfile
#auto star saat reboot
wget $source/debian7/fstab
mv ./fstab /etc/fstab
chmod 644 /etc/fstab
sysctl vm.swappiness=10
#permission swapfile
chown root:root /swapfile 
chmod 0600 /swapfile
cd


# finishing

service cron restart








service webmin restart

cd
rm -f /root/.bash_history && history -c


echo "=======================================================" | tee -a log-install.txt
cd ~/
rm -f /root/qwerty.sh





