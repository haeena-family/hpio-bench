

set terminal pdf color fontscale 1
set output "graph/graph-tstamp.pdf"

set ylabel "timestamp delta"
set xlabel "packet number"
set size ratio 0.6

set xrange [0:]
set yrange [0:]

set key left top

plot	"dat/x550-hpio-hw.dat"	\
	using ($0):1 with p pt 3 ps 1 title "hpio",	\
	"dat/x550-raw-sw.dat"	\
	using ($0):1 with p ps 1 title "raw",	\
	"dat/x550-udp-sw.dat"	\
	using ($0):1 with p ps 1 title "udp"	\

