#!/bin/bash


target=172.16.0.174
sshcmd="ssh -i ~/.ssh/id_rsa_nopass $target"

ppktgen="/home/upa/work/hpio/tools/ppktgen"

hpiodev="/dev/hpio/enp3s0"
cpumask="3fff0003fff"
src_mac="ec:0d:9a:7d:83:06"
src_ip="10.0.0.1"
dst_mac="ec:0d:9a:7d:84:4e"
dst_ip="10.0.0.2"

dpdk_port=0
moongen="~/work/MoonGen/build/MoonGen"
moongen_pktcnt="~/work/MoonGen/examples/cnt.lua"
timeout=30

source run_tx-ppktgen_rx-moongen.sh


for pktsize in 60 128 256 512 1024 1500; do
for bulknum in 1 4 8 16 32 64 128; do 
for cpunum in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do

	prefix="output/result_tx_cnx5_hpio"
	values="pktsize-${pktsize}_bulknum-${bulknum}_cpunum-${cpunum}"
	output=${prefix}_${values}.txt

	tx_ppktgen_rx_moongen hpio $pktsize $cpunum $bulknum $output

done
done
done
