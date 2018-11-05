#!/bin/bash



# go to root
cd



# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install wget and curl
apt-get update;apt-get -y install wget curl;
apt-get install gem
apt-get install git
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime





# set repo
wget -O /etc/apt/sources.list $source/debian7/sources.list.debian7
wget http://www.dotdeb.org/dotdeb.gpg
wget http://www.webmin.com/jcameron-key.asc
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc

# remove unused
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;
apt-get -y --purge remove dropbear*;
#apt-get -y autoremove;

# update
apt-get update;apt-get -y upgrade;

# install shadowshock
apt-get install python
apt-get install python-pip
apt-get install sudo
apt-get install git

pip install git+https://github.com/shadowsocks/shadowsocks.git@master
# password shadowshock
sudo ssserver -p 8388 -k 12345678 -m aes-256-cfb --user nobody -d start





cd

# disable exim
service exim4 stop
sysv-rc-conf exim4 off

# update apt-file
apt-file update

# setting vnstat
#vnstat -u -i $ether
#service vnstat restart


# text wrn
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc $source/debian7/.bashrc

#text gambar
apt-get install boxes
# text pelangi
sudo apt-get install ruby -y
sudo gem install lolcat
 
# install webserver
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf $source/debian7/nginx.conf
mkdir -p /home/vps/public_html
echo "<meta http-equiv="refresh" content="0; url=http://arema-nia.com/" />" > /home/vps/public_html/index.html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf $source/debian7/vps.conf
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
service php5-fpm restart
service nginx restart
cd








# install webmin
cd
#wget -O webmin-current.deb http://prdownloads.sourceforge.net/webadmin/webmin_1.870_all.deb
wget -O webmin-current.deb $source/debian7/webmin-current.deb
dpkg -i --force-all webmin-current.deb
apt-get -y -f install;
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
rm -f /root/webmin-current.deb
apt-get -y --force-yes -f install libxml-parser-perl
service webmin restart
service vnstat restart




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
chown -R www-data:www-data /home/vps/public_html
service cron restart








service webmin restart

cd
rm -f /root/.bash_history && history -c
# echo "unset HISTFILE" >> /etc/profile

echo "=======================================================" | tee -a log-install.txt
cd ~/
rm -f /root/qwerty.sh




echo 3 > /proc/sys/vm/drop_caches
