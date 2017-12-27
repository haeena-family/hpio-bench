#!/bin/bash


./parser.py output/x550-hpio-hw.txt > dat/x550-hpio-hw.dat
./parser.py output/x550-raw-sw.txt > dat/x550-raw-sw.dat
./parser.py output/x550-udp-sw.txt > dat/x550-udp-sw.dat

gnuplot plot-tstamp.plt
