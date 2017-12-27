#!/bin/bash

mkdir -p dat

./parser.py output/x550-hpio-hw-wirerate.txt > dat/x550-hpio-hw.dat
./parser.py output/x550-raw-sw-wirerate.txt > dat/x550-raw-sw.dat
./parser.py output/x550-udp-sw-wirerate.txt > dat/x550-udp-sw.dat

./parser.py output/cnx4-hpio-hw-wirerate.txt > dat/cnx4-hpio-hw.dat
./parser.py output/cnx4-raw-sw-wirerate-rx-off.txt > dat/cnx4-raw-sw.dat
./parser.py output/cnx4-udp-sw-wirerate-rx-off.txt > dat/cnx4-udp-sw.dat

./parser.py output/cnx4-hpio-hw-wirerate-pktsize-1024.txt > \
	dat/cnx4-hpio-hw-pktsize-1024.dat
./parser.py output/cnx4-raw-sw-wirerate-pktsize-1024.txt > \
	dat/cnx4-raw-sw-pktsize-1024.dat
./parser.py output/cnx4-udp-sw-wirerate-pktsize-1024.txt > \
	dat/cnx4-udp-sw-pktsize-1024.dat


./parser-diff2.py output/cnx4-hpio-hw-wirerate-pktsize-1024.txt > \
	dat/diff-cnx4-hpio-hw-pktsize-1024.dat
./parser-diff2.py output/cnx4-raw-sw-wirerate-pktsize-1024.txt > \
	dat/diff-cnx4-raw-sw-pktsize-1024.dat
./parser-diff2.py output/cnx4-udp-sw-wirerate-pktsize-1024.txt > \
	dat/diff-cnx4-udp-sw-pktsize-1024.dat

./parser-diff.py output/x550-hpio-hw.txt > dat/diff-x550-hpio-hw.dat
./parser-diff.py output/x550-raw-sw.txt > dat/diff-x550-raw-sw.dat
./parser-diff.py output/x550-udp-sw.txt > dat/diff-x550-udp-sw.dat

gnuplot plot-tstamp.plt
gnuplot plot-tstamp-cnx4.plt
gnuplot plot-tstamp-cnx4-pktsize-1024.plt
gnuplot plot-tstamp-diff.plt
gnuplot plot-tstamp-diff-cnx4.plt
