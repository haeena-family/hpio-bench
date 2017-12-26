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
	using ($0):2:xtic(1) with lp title "hpio(1-1)",	\
	"dat/hpio_bulknum-4_cpunum-4_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(4-4)",	\
	"dat/hpio_bulknum-32_cpunum-4_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(32-4)",	\
	"dat/hpio_bulknum-32_cpunum-8_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(32-8)",	\
	"dat/raw_bulknum-1_cpunum-1_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "raw(1-16)",	\
	"dat/udp_bulknum-1_cpunum-1_vs_pktsize.dat"	\
	using ($0):2:xtic(1) with lp title "udp(1-8)"	\

