

set terminal pdf color fontscale 1
set output "graph/graph-tstamp.pdf"

set ylabel "timestamp (nsec)"
set xlabel "packet number"
set size ratio 0.6

set xrange [0000:10000]
#set yrange [0:]

set key left top

plot	"dat/x550-hpio-hw.dat"	\
	using ($0):1 with lp lw 1.5 ps 0.4 title "hpio",	\
	"dat/x550-raw-sw.dat"	\
	using ($0):1 with lp lw 1.5 ps 0.4 title "raw",	\
	"dat/x550-udp-sw.dat"	\
	using ($0):1 with lp lw 1.5 ps 0.4 title "udp"	\

