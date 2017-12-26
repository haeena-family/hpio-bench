#!/bin/bash

echo Generate tx throughput VS bulk num dat, pkt size 60

for cpunum in 1 4 8 16; do

	dat=dat/hpio_pktsize-60_cpunum-${cpunum}_vs_bulk.dat
	rm -f $dat
	touch $dat

for bulknum in 1 4 8 16 32 64 128; do
	
	pref=output-hpio/result_tx_cnx5_hpio
	txt=${pref}_pktsize-60_bulknum-${bulknum}_cpunum-${cpunum}.txt
	echo $txt

	./parser.py $bulknum $txt >> $dat
done
done



echo Generate tx throughput VS cpu num dat, pkt size 60

for bulknum in 1 16 32 64; do

	dat=dat/hpio_pktsize-60_bulknum-${bulknum}_vs_cpunum.dat
	rm -f $dat
	touch $dat

for cpunum in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
	
	pref=output-hpio/result_tx_cnx5_hpio
	txt=${pref}_pktsize-60_bulknum-${bulknum}_cpunum-${cpunum}.txt
	echo $txt
	./parser.py $cpunum $txt >> $dat

done
done

# Raw socket
dat=dat/raw_pktsize-60_bulknum-1_vs_cpunum.dat
rm -f $dat
touch $dat
for cpunum in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
	pref=output-raw/result_tx_cnx5_raw
	txt=${pref}_pktsize-60_bulknum-1_cpunum-${cpunum}.txt
	echo $txt
	./parser.py $cpunum $txt >> $dat
done

# UDP socket
dat=dat/udp_pktsize-60_bulknum-1_vs_cpunum.dat
rm -f $dat
touch $dat
for cpunum in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
	pref=output-udp/result_tx_cnx5_udp
	txt=${pref}_pktsize-60_bulknum-1_cpunum-${cpunum}.txt
	echo $txt
	./parser.py $cpunum $txt >> $dat
done

