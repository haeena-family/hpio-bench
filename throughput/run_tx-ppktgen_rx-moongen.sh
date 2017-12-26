

function tx_ppktgen_rx_moongen() {
	io_mode=$1
	pktsize=$2
	cpunum=$3
	bulknum=$4
	output_file=$5

	echo Run Moongen at $dst_ip with dpdk_port $dpdk_port
	$sshcmd sudo $moongen $moongen_pktcnt $dpdk_port \
		-t $(( $timeout + 5)) -q 4 > $output_file &
	sleep 5
	
	echo Run ppktgen
	sudo $ppktgen -i $hpiodev -m tx -o $io_mode -T $timeout \
		-d $dst_ip -D $dst_mac	\
		-s $src_ip -S $src_mac	\
		-l $pktsize -b $bulknum -n $cpunum -M $cpumask
	sleep 10
}

