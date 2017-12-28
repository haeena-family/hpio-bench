set terminal pdf color fontscale 1
set output "graph/graph-tx-vs-bulknum.pdf"


set grid ytic
set ylabel "throughput (Mpps)"
set size ratio 0.6

set xlabel "# of batched packets"

set xrange [0:]
set yrange [0:]

set key at 2.3,49.5

plot	"dat/hpio_pktsize-60_cpunum-1_vs_bulk.dat"	\
	using ($0):2:xtic(1) with lp title "hpio(1c)",		\
	"dat/hpio_pktsize-60_cpunum-4_vs_bulk.dat"	\
	using ($0):2 with lp title "hpio(4c)",		\
	"dat/hpio_pktsize-60_cpunum-8_vs_bulk.dat"	\
	using ($0):2 with lp title "hpio(8c)",		\
	"dat/hpio_pktsize-60_cpunum-16_vs_bulk.dat"	\
	using ($0):2 with lp title "hpio(16c)"		\

