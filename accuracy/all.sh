#!/bin/bash


./parser.py output/x550-hpio-hw-wirerate.txt > dat/x550-hpio-hw.dat
./parser.py output/x550-raw-sw-wirerate.txt > dat/x550-raw-sw.dat
./parser.py output/x550-udp-sw-wirerate.txt > dat/x550-udp-sw.dat

./parser-diff.py output/x550-hpio-hw.txt > dat/diff-x550-hpio-hw.dat
./parser-diff.py output/x550-raw-sw.txt > dat/diff-x550-raw-sw.dat
./parser-diff.py output/x550-udp-sw.txt > dat/diff-x550-udp-sw.dat

gnuplot plot-tstamp.plt
gnuplot plot-tstamp-diff.plt
