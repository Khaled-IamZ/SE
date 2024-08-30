#!/bin/sh
# chkconfig: 2345 99 01
# description: SoftEther VPN Client
DAEMON=/usr/local/vpnclient/vpnclient
LOCK=/var/lock/subsys/vpnclient
TAP_ADDR1=10.10.100.100
test -x $DAEMON || exit 0
case "$1" in
start)
$DAEMON start
touch $LOCK
sleep 1
sbin/ifconfig vpn_tamiuzz1 $TAP_ADDR1
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
;;
*)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac
exit 0
