set terminal pdf color fontscale 1
set output "graph/graph-hwts-onoff-vs-bulk.pdf"

set grid ytic
set ylabel "throughput (Mpps)"
set size ratio 0.6

set xlabel "# of bulked packets"

set xrange [0:]
set yrange [0:]

set key at 5,12

plot	"dat/x550_hpio_hwtstamp-off_vs_bulk.dat"	\
	using ($0):2:xtic(1) with lp title "X550 hwtstamp off",	\
	"dat/x550_hpio_hwtstamp-on_vs_bulk.dat"	\
	using ($0):2:xtic(1) with lp title "X550 hwtstamp on",	\
	"dat/cnx4_hpio_hwtstamp-off_vs_bulk.dat"	\
	using ($0):2:xtic(1) with lp title "CNX4 hwtstamp off",	\
	"dat/cnx4_hpio_hwtstamp-on_vs_bulk.dat"	\
	using ($0):2:xtic(1) with lp title "CNX4 hwtstamp on"	\
