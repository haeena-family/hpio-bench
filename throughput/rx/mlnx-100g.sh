#!/bin/bash


target=172.16.0.174
sshcmd="ssh -i ~/.ssh/id_rsa_nopass $target"

ppktgen="/home/upa/work/hpio/tools/ppktgen"

hpiodev="/dev/hpio/enp3s0"
cpumask="3fff0003fff"

dpdk_port=0
moongen="~/work/MoonGen/build/MoonGen"
moongen_txudp="~/work/MoonGen/examples/tx-udp.lua"
timeout=30

source run_rx-ppktgen_tx-moongen.sh


for pktsize in 60 128 256 512 1024 1500; do
for bulknum in 1 4 8 16 32 128; do
        prefix="output-hpio/result_rx_cnx5_hpio"
        values="pktsize-${pktsize}_bulknum-${bulknum}_percpu-on"
        output=${prefix}_${values}.txt
        rx_ppktgen_tx_moongen hpio $pktsize $bulknum $output

done


bulknum=1

prefix="output-raw/result_rx_cnx5_raw"
values="pktsize-${pktsize}_bulknum-${bulknum}_percpu-off"
output=${prefix}_${values}.txt
rx_ppktgen_tx_moongen raw $pktsize $bulknum $output

prefix="output-udp/result_rx_cnx5_udp"
values="pktsize-${pktsize}_bulknum-1_percpu-off"
output=${prefix}_${values}.txt
rx_ppktgen_tx_moongen udp $pktsize $bulknum $output "-p off"

prefix="output-udp/result_rx_cnx5_udp"
values="pktsize-${pktsize}_bulknum-1_percpu-on"
output=${prefix}_${values}.txt
rx_ppktgen_tx_moongen udp $pktsize $bulknum $output "-p on"

done
