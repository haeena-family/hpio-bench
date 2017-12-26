#!/bin/bash

mkdir -p dat

echo Generate rx throughput VS bulk num of hpio, pktsize is 60

dat=dat/hpio_pktsize-60_vs_bulk.dat
rm -f $dat
touch $dat
for bulknum in 1 4 8 16 32 128; do
	pref=output-hpio/result_rx_cnx5_hpio
	txt=${pref}_pktsize-60_bulknum-${bulknum}_percpu-on.txt
	./parser.py $bulknum $txt >> $dat
done




echo Generate rx throughput VS pktsize
for per in on off; do 

dat=dat/udp_bulknum-1_percpu-${per}_vs_pktsize.dat
rm -f $dat
touch $dat
for pktsize in 60 128 256 512 1024 1500; do
	pref=output-udp/result_rx_cnx5_udp
	txt=${pref}_pktsize-${pktsize}_bulknum-1_percpu-${per}.txt
	./parser.py $pktsize $txt >> $dat
done

done



dat=dat/raw_bulknum-1_percpu-off_vs_pktsize.dat
rm -f $dat
touch $dat
for pktsize in 60 128 256 512 1024 1500; do
	pref=output-raw/result_rx_cnx5_raw
	txt=${pref}_pktsize-${pktsize}_bulknum-1_percpu-off.txt
	./parser.py $pktsize $txt >> $dat
done


for bulknum in 1 16 32 128; do 
dat=dat/hpio_bulknum-${bulknum}_percpu-off_vs_pktsize.dat
rm -f $dat
touch $dat
for pktsize in 60 128 256 512 1024 1500; do
	pref=output-hpio/result_rx_cnx5_hpio
	txt=${pref}_pktsize-${pktsize}_bulknum-${bulknum}_percpu-on.txt
	./parser.py $pktsize $txt >> $dat
done
done
