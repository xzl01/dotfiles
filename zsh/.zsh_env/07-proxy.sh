if [ -f /etc/wsl.conf ]; then
	# host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
	# set your proxy ip here
	export all_proxy="http://192.168.1.101:7890"
fi
