#!/bin/sh
# chkconfig: 2345 99 01
# description: SoftEther VPN Client
DAEMON=/usr/local/vpnclient/vpnclient
LOCK=/var/lock/subsys/vpnclient
TAP_ADDR1=192.168.100.150
TAP_ADDR2=192.168.110.150
TAP_ADDR2=192.168.120.150
test -x $DAEMON || exit 0
case "$1" in
start)
$DAEMON start
touch $LOCK
sleep 1
sbin/ifconfig vpn_tamiuzz1 $TAP_ADDR1
sbin/ifconfig vpn_tamiuzz1 $TAP_ADDR2
sbin/ifconfig vpn_tamiuzz1 $TAP_ADDR3
;;
stop)
$DAEMON stop
rm $LOCK
;;
restart)
$DAEMON stop
sleep 3
$DAEMON start
sleep 1
sbin/ifconfig vpn_tamiuzz1 $TAP_ADDR1
sbin/ifconfig vpn_tamiuzz2 $TAP_ADDR2
sbin/ifconfig vpn_tamiuzz3 $TAP_ADDR3
;;
*)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac
exit 0
