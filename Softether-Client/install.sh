#--------------------------------------------------
#Softether auto install script
#Centos 7
#Created Aug 25, 2021
#Softether Client Version for AUG 2021 v4.38-9760-rtm-2021.08.17
#Coded by Khaled A. Moneim
#Open Source Project From https://www.softether.org/
#From university of Tsukuba, Japan
#--------------------------------------------------
#Login with root permission or execute #sudo su
#Script start
#--------------------------------------------------
#Updating centos version
cd /root
#yum update -y
yum groupinstall "development tools" -y
yum install wget -y
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnclient-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
tar zxf softether-vpnclient-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
cd vpnclient
make
cd ..
mv vpnclient /usr/local
cd /usr/local/vpnclient/
chmod 600 *
chmod 700 vpnclient
chmod 700 vpncmd
./vpnclient start
wget https://raw.githubusercontent.com/Khaled-IamZ/VPN/main/vpn-client.sh --no-check-certificate
mv vpn-client.sh /etc/init.d/vpnclient
cd /etc/init.d/
chmod 755 vpnclient
chkconfig --add vpnclient
/etc/init.d/vpnclient start
cd /usr/local/vpnclient
echo ---------------------------------------------
echo  -e "\033[32;5mVPN CLIENT INSTALLED SUCCESSFULLY!\033[0m"
echo "SoftEther auto installer by Khaled A. Moneim"
echo "vpncmd is at /usr/local/vpnclient"
echo ---------------Commands----------------------
echo /etc/init.d/vpnclient start - to start
echo /etc/init.d/vpnclient restart - to restart
echo /etc/init.d/vpnclient stop - to stop
echo ---------------------------------------------

#End of script