

set terminal pdf color fontscale 1
set output "graph/graph-tstamp-diff-cnx4.pdf"

set ylabel "timestamp delta (nsec)"
set xlabel "packet number"
set size ratio 0.6

set xrange [100:200]
set yrange [0:10000]
#set yrange [9998000:10005000]
#set yrange [9998:10005]

set key top right invert

plot	"dat/diff-cnx4-udp-sw-pktsize-1024.dat"	\
	using ($0):($1) with lp lt 3 lw 1.5 ps 0.7 title "udp",	\
	"dat/diff-cnx4-raw-sw-pktsize-1024.dat"	\
	using ($0):($1) with lp lt 2 lw 1.5 ps 0.7 title "raw",	\
	"dat/diff-cnx4-hpio-hw-pktsize-1024.dat"	\
	using ($0):($1) with lp lt 1 lw 1.5 ps 0.7 title "hpio"	\

