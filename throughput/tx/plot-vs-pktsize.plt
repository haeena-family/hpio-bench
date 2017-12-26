set terminal pdf color fontscale 0.95
set output "graph/graph-vs-pktsize.pdf"


set grid ytic
set ylabel "throughput (Mpps)"
set size ratio 0.6

set xlabel "packet size (byte)"

set xrange [0:]
set yrange [0:]

set key top right

plot	"dat/hpio_bulknum-1_cpunum-1_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(1b-1c)",	\
	"dat/hpio_bulknum-4_cpunum-4_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(4b-4c)",	\
	"dat/hpio_bulknum-32_cpunum-4_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(32b-4c)",	\
	"dat/hpio_bulknum-32_cpunum-8_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(32b-8c)",	\
	"dat/raw_bulknum-1_cpunum-1_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "raw(1b-16c)",	\
	"dat/udp_bulknum-1_cpunum-1_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "udp(1b-8c)"	\

