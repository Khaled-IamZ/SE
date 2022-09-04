#!binsh
# chkconfig 2345 99 01
# description SoftEther VPN Server
DAEMON=usrlocalvpnclientvpnclient
LOCK=varlocksubsysvpnclient
TAP_ADDR=192.168.30.150
test -x $DAEMON  exit 0
case $1 in
start)
$DAEMON start
touch $LOCK
sleep 1
sbinifconfig vpn_myadapter $TAP_ADDR
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
sbinifconfig vpn_myadapter $TAP_ADDR
;;
)
echo Usage $0 {startstoprestart}
exit 1
esac
exit 0