#!/bin/bash

mkdir -p dat

echo Generate rx throughput vs bulk num

for nic in x550 cnx4; do 

for ts in on off; do

dat=dat/${nic}_hpio_hwtstamp-${ts}_vs_bulk.dat
rm -f $dat
touch $dat
for bulknum in 1 4 8 16 32 128; do
	txt=output/${nic}_hpio_bulk-${bulknum}_hwtstamp-${ts}.txt
	./parser.py $bulknum $txt >> $dat
done

done

done
