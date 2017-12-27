

set terminal pdf color fontscale 1
set output "graph/graph-tstamp-transpose.pdf"

set xlabel "timestamp (nsec)"
set ylabel "packet number"
set size ratio 0.6

set xrange [0000:20000]
#set yrange [0:]

set key left top

plot	"dat/x550-hpio-hw.dat"	\
	using 1:($0) with lp lw 1.5 ps 0.8 title "hpio",	\
	"dat/x550-raw-sw.dat"	\
	using 1:($0) with lp lw 1.5 ps 0.8 title "raw",	\
	"dat/x550-udp-sw.dat"	\
	using 1:($0) with lp lw 1.5 ps 0.8 title "udp"	\

