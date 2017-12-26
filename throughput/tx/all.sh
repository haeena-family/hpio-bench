#!/bin/bash

mkdir -p dat

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

for bulknum in 1 4 32 128; do

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




echo Generate tx throughput VS pktsize


for cpunum in 1 4 8 16; do

	# hpio
	for bulknum in 1 4 32; do
	dat=dat/hpio_bulknum-${bulknum}_cpunum-${cpunum}_vs_pktsize.dat
	rm -f $dat
	touch $dat
	
	for pktsize in 60 128 256 512 1024 1500; do
	pref=output-hpio/result_tx_cnx5_hpio
	txt=${pref}_pktsize-${pktsize}_bulknum-${bulknum}_cpunum-${cpunum}.txt
	echo $txt
	./parser.py $pktsize $txt >> $dat
	done
	done


	# raw
	dat=dat/raw_bulknum-1_cpunum-${cpunum}_vs_pktsize.dat
	rm -f $dat
	touch $dat
	for pktsize in 60 128 256 512 1024 1500; do
		pref=output-raw/result_tx_cnx5_raw
		txt=${pref}_pktsize-${pktsize}_bulknum-1_cpunum-${cpunum}.txt
		echo $txt
		./parser.py $pktsize $txt >> $dat
	done

	# udp
	dat=dat/udp_bulknum-1_cpunum-${cpunum}_vs_pktsize.dat
	rm -f $dat
	touch $dat
	for pktsize in 60 128 256 512 1024 1500; do
		pref=output-udp/result_tx_cnx5_udp
		txt=${pref}_pktsize-${pktsize}_bulknum-1_cpunum-${cpunum}.txt
		echo $txt
		./parser.py $pktsize $txt >> $dat
	done

done



echo Generate graphs
gnuplot plot-vs-bulknum.plt
gnuplot plot-vs-cpunum.plt
gnuplot plot-vs-pktsize.plt
