set terminal pdf color fontscale 1
set output "graph/graph-vs-cpunum.pdf"


set grid ytic
set ylabel "throughput (Mpps)"
set size ratio 0.6

set xlabel "# of CPU cores"

set xrange [0:]
set yrange [0:]

set key c r

plot	"dat/hpio_pktsize-60_bulknum-1_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(1)",	\
	"dat/hpio_pktsize-60_bulknum-16_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(16)",	\
	"dat/hpio_pktsize-60_bulknum-32_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(32)",	\
	"dat/hpio_pktsize-60_bulknum-64_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(64)",	\
	"dat/raw_pktsize-60_bulknum-1_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "raw socket",	\
	"dat/udp_pktsize-60_bulknum-1_vs_cpunum.dat"	\
	using ($0):2:xtic(1) with lp title "udp socket"	

