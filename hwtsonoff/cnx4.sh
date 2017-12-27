#!/bin/bash
#
# measure X550
#
target=172.16.0.174
sshcmd="ssh -i ~/.ssh/id_rsa_nopass $target"


source run-moongen.sh

dpdk_port=1
dst_mac=7c:fe:90:0b:c6:ac
src_mac=90:e2:ba:5d:8d:c8
dst_ip=10.0.1.1
src_ip=10.0.1.2
interval=0
moongen_timeout=40
ppktgen_timeout=30
bulknum=32
dev=enp129s0f0

io_mode=hpio
ts_mode=none

nicname=cnx4


for bulknum in 1 4 8 16 32 128; do

sudo /home/upa/work/hpio/tools/hwtstampcfg set rx 0 dev $dev

run_moongen $dpdk_port $dst_mac $src_mac $dst_ip $src_ip \
	$interval $moongen_timeout
sleep 6

run_ppktgen $dev $io_mode $bulknum $ppktgen_timeout	\
	"-t $ts_mode" > output/${nicname}_hpio_bulk-${bulknum}_hwtstamp-off.txt
sleep 15


/home/upa/work/hpio/tools/hwtstampcfg set rx 1 dev $dev

run_moongen $dpdk_port $dst_mac $src_mac $dst_ip $src_ip \
	$interval $moongen_timeout
sleep 6

run_ppktgen $dev $io_mode $bulknum $ppktgen_timeout	\
	"-t $ts_mode" > output/${nicname}_hpio_bulk-${bulknum}_hwtstamp-on.txt
sleep 15

done
