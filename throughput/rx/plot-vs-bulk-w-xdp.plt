set terminal pdf color fontscale 1
set output "graph/graph-rx-vs-bulknum-w-xdp.pdf"

set grid ytic
set ylabel "throughput (Mpps)"
set size ratio 0.6

set xlabel "# of bulked packets"

set xrange [0:]
set yrange [0:]

set key top left

plot	"dat/hpio_pktsize-60_vs_bulk.dat"	\
	using ($0):2:xtic(1) with lp title "hpio",	\
	"dat/hpio_pktsize-60_xdp-on_vs_bulk.dat"	\
	using ($0):2:xtic(1) with lp title "hpio with xdp" 
