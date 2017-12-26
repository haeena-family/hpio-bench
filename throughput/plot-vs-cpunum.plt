set terminal pdf color fontscale 0.95
set output "graph/graph-vs-cpunum.pdf"


set grid ytic
set ylabel "throughput (Mpps)"
set size ratio 0.6

set xlabel "# of CPU cores"

set xrange [0:]
set yrange [0:]

set key at 15,40

plot	"dat/hpio_pktsize-60_bulknum-1_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(1b)",	\
	"dat/hpio_pktsize-60_bulknum-4_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(4b)",	\
	"dat/hpio_pktsize-60_bulknum-32_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(32b)",	\
	"dat/hpio_pktsize-60_bulknum-128_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(128b)",	\
	"dat/raw_pktsize-60_bulknum-1_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "raw socket",	\
	"dat/udp_pktsize-60_bulknum-1_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "udp socket"	

