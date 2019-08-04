set terminal pdf color fontscale 0.8
set output "graph/graph-rx-vs-pktsize-bps.pdf"


set grid ytic
set ylabel "throughput (Gbps)"
set size ratio 0.5

set xlabel "packet size (byte)"

set xrange [0:]
set yrange [0:]

set key below Left


plot	"dat/hpio_bulknum-1_percpu-off_vs_pktsize.dat"	\
	using ($0):($2 * $1 * 8 / 1000):xtic(1) with lp title "hpio(1b)",	\
	"dat/hpio_bulknum-16_percpu-off_vs_pktsize.dat"	\
	using ($0):($2 * $1 * 8 / 1000):xtic(1) with lp title "hpio(16b)",	\
	"dat/hpio_bulknum-32_percpu-off_vs_pktsize.dat"	\
	using ($0):($2 * $1 * 8 / 1000):xtic(1) with lp title "hpio(32b)",	\
	"dat/hpio_bulknum-128_percpu-off_vs_pktsize.dat"	\
	using ($0):($2 * $1 * 8 / 1000):xtic(1) with lp title "hpio(128b)",	\
	"dat/raw_bulknum-1_percpu-off_vs_pktsize.dat"	\
	using ($0):($2 * $1 * 8 / 1000):xtic(1) with lp title "raw(1b)",	\
	"dat/udp_bulknum-1_percpu-off_vs_pktsize.dat"	\
	using ($0):($2 * $1 * 8 / 1000):xtic(1) with lp title "udp(1b)",	\
	"dat/udp_bulknum-1_percpu-on_vs_pktsize.dat"	\
	using ($0):($2 * $1 * 8 / 1000):xtic(1) with lp title "udp(1b)-all-cpu"	\
