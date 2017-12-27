#!/bin/bash
#
# measure X550
#
target=172.16.0.174
sshcmd="ssh -i ~/.ssh/id_rsa_nopass $target"


source run-moongen.sh

dpdk_port=2
dst_mac=a0:36:9f:b3:22:a4
src_mac=a0:36:9f:af:12:9c
dst_ip=10.0.2.1
src_ip=10.0.2.2
interval=0
moongen_timeout=40
ppktgen_timeout=30
bulknum=32
dev=enp130s0f0

io_mode=hpio
ts_mode=none

nicname=x550


for bulknum in 1 4 8 16 32 128; do

sudo /home/upa/work/hpio/tools/hwtstampcfg set rx 0 dev $dev

run_moongen $dpdk_port $dst_mac $src_mac $dst_ip $src_ip \
	$interval $moongen_timeout
sleep 6

run_ppktgen $dev $io_mode $bulknum $ppktgen_timeout	\
	"-t $ts_mode" > output/${nicname}_hpio_bulk-${bulknum}_hwtstamp-off.txt

echo sleep 15
sleep 15
echo sleep end


sudo /home/upa/work/hpio/tools/hwtstampcfg set rx 1 dev $dev

run_moongen $dpdk_port $dst_mac $src_mac $dst_ip $src_ip \
	$interval $moongen_timeout
sleep 6

run_ppktgen $dev $io_mode $bulknum $ppktgen_timeout	\
	"-t $ts_mode" > output/${nicname}_hpio_bulk-${bulknum}_hwtstamp-on.txt

sleep 15

done
