#!/bin/bash
#
# measure CNX4
#
target=172.16.0.174
sshcmd="ssh -i ~/.ssh/id_rsa_nopass $target"


source run-moongen-wirerate.sh

dpdk_port=1
dst_mac=7c:fe:90:0b:c6:ac
src_mac=90:e2:ba:5d:8d:c8
dst_ip=10.0.1.1
src_ip=10.0.1.2
interval=0
moongen_timeout=10
ppktgen_timeout=1
bulknum=32
pktsize=1024
dev=enp129s0f0

io_mode=$1
ts_mode=$2


run_moongen $dpdk_port $dst_mac $src_mac $dst_ip $src_ip \
	$interval $moongen_timeout $pktsize
sleep 10

run_ppktgen $dev $io_mode $bulknum $ppktgen_timeout	\
	"-t $ts_mode"
sleep 5
