

set terminal pdf color fontscale 1
set output "graph/graph-tstamp-diff.pdf"

set ylabel "timestamp delta (usec)"
set xlabel "packet number"
set size ratio 0.6

set xrange [100:200]
#set yrange [9998000:10005000]
set yrange [9998:10005]

set key top right invert

plot	"dat/diff-x550-udp-sw.dat"	\
	using ($0):($1/1000) with lp lt 3 lw 1.5 ps 0.7 title "udp",	\
	"dat/diff-x550-raw-sw.dat"	\
	using ($0):($1/1000) with lp lt 2 lw 1.5 ps 0.7 title "raw",	\
	"dat/diff-x550-hpio-hw.dat"	\
	using ($0):($1/1000) with lp lt 1 lw 1.5 ps 0.7 title "hpio"	\

