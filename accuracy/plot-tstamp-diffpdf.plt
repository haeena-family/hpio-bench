#set terminal postscript eps enhanced
set terminal pdf color fontscale 1
set output "graph/graph-tstamp-pdf.pdf"

set yrange [0:0.02]
#set xrange [10000000:14000000]
#set size 0.8,0.5
#set logscale
set xlabel "Interpacket delay (nsecond)"
set ylabel "Probability [%]"
#set title "CDF"
# set format x "10^{%L}"
set style data points

#set label 1 at graph 0.1,first 0.7 "Standard deviation = XXX ns"

plot "pdf/diffpdf-x550-hpio-hw.dat" title "x550-hpio-hw" w boxes, \
     "pdf/diffpdf-x550-raw-sw.dat" title "x550-raw-sw" w boxes,   \
     "pdf/diffpdf-x550-udp-sw.dat" title "x550-udp-sw" w boxes

