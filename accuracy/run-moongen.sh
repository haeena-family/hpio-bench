

#define sshcmd before source this script

function run_moongen {

	dpdk_port=$1
	dst_mac=$2
	src_mac=$3
	dst_ip=$4
	src_ip=$5
	interval=$6
	timeout=$7

	moongen="~/work/MoonGen/build/MoonGen"                             
	moongen_tx_interval="~/work/MoonGen/examples/tx-interval.lua" 
	options="$dpdk_port -d $dst_mac -s $src_mac -D $dst_ip -S $src_ip"
	options="$options -t $timeout -i $interval"

	echo $moongen $moongen_tx_interval $options  >&2
	$sshcmd sudo $moongen $moongen_tx_interval $options > /dev/null &
}


function run_ppktgen {

	dev=$1
	io_mode=$2
	bulknum=$3
	timeout=$3
	ppktgen_options=$5

	ppktgen="/home/upa/work/hpio/tools/ppktgen"

	echo $ppktgen -m rx -i /dev/hpio/${dev} -o $io_mode	\
		-b $bulknum -T $timeout $ppktgen_options >&2
	sudo $ppktgen -m rx -i /dev/hpio/${dev} -o $io_mode	\
		-b $bulknum -T $timeout $ppktgen_options 
}
