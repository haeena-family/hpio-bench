#set terminal postscript eps enhanced
set terminal pdf color fontscale 1
set output "graph/graph-tstamp-cdf.pdf"

set yrange [0:1]
#set xrange [6000000:14000000]
#set size 0.8,0.5
set logscale
set xlabel "Interpacket delay (nsecond)"
set ylabel "CDF"
#set title "CDF"
# set format x "10^{%L}"
set style data points

#set label 1 at graph 0.1,first 0.7 "Standard deviation = XXX ns"

plot "cdf/diffcdf-x550-hpio-hw.dat" title "diffcdf-x550-hpio-hw" w linespoints, \
     "cdf/diffcdf-x550-raw-sw.dat" title "diffcdf-x550-raw-sw" w linespoints,   \
     "cdf/diffcdf-x550-udp-sw.dat" title "diffcdf-x550-udp-sw" w linespoints

