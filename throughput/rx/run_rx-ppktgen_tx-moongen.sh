




function rx_ppktgen_tx_moongen() {
        io_mode=$1
        pktsize=$2
        bulknum=$3
        output_file=$4
	ppktgen_options=$5

        echo Run Moongen at $dst_ip with dpdk_port $dpdk_port
        $sshcmd sudo $moongen $moongen_txudp $dpdk_port \
                -t $(( $timeout + 10)) -q 2 -s ${pktsize} &
        sleep 5

        echo Run ppktgen
        echo $ppktgen -i $hpiodev -m rx -o $io_mode -T $timeout \
                -M $cpumask -b $bulknum $ppktgen_options 
	echo output $output
        sudo $ppktgen -i $hpiodev -m rx -o $io_mode -T $timeout \
                -M $cpumask -b $bulknum $ppktgen_options > $output
        sleep 10
}

