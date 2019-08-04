set terminal pdf color fontscale 0.9
set output "graph/graph-tx-vs-pktsize-bps.pdf"


set grid ytic
set ylabel "throughput (Gbps)"
set size ratio 0.5

set xlabel "packet size (byte)"

set xrange [0:]
set yrange [0:]

set key below

plot	"dat/hpio_bulknum-1_cpunum-1_vs_pktsize.dat"	\
	using ($0):($2 * 8 * $1 / 1000):xtic(1) with lp title "hpio(1b,1c)",	\
	"dat/hpio_bulknum-4_cpunum-4_vs_pktsize.dat"	\
	using ($0):($2 * 8 * $1 / 1000):xtic(1) with lp title "hpio(4b,4c)",	\
	"dat/hpio_bulknum-32_cpunum-4_vs_pktsize.dat"	\
	using ($0):($2 * 8 * $1 / 1000):xtic(1) with lp title "hpio(32b,4c)",	\
	"dat/hpio_bulknum-32_cpunum-8_vs_pktsize.dat"	\
	using ($0):($2 * 8 * $1 / 1000):xtic(1) with lp title "hpio(32b,8c)",	\
	"dat/raw_bulknum-1_cpunum-16_vs_pktsize.dat"	\
	using ($0):($2 * 8 * $1 / 1000):xtic(1) with lp title "raw(1b,16c)",	\
	"dat/udp_bulknum-1_cpunum-8_vs_pktsize.dat"	\
	using ($0):($2 * 8 * $1 / 1000):xtic(1) with lp title "udp(1b,8c)"	\

