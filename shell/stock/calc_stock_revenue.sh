FUTU_COMMISSION_MIN=3;

function calc()
{
	echo -e "$1"|bc
}

function ceilling()
{
	echo $1|awk '{print int($1+0.99)}'
}

function min()
{
	ret_val=$1;
	if [ `expr $1 \> $2` -eq 0 ] ; then
		ret_val=$2;
	fi
	echo ${ret_val}
}

function max()
{
	ret_val=$1;
	if [ `expr $1 \< $2` -eq 0 ] ; then
		ret_val=$2;
	fi
	echo ${ret_val}
}

function calc_futu_tax()
{
	trade_volume=$1;
	commission_cost=$(calc ${trade_volume}*0.03/100)
	commission_cost=$(min ${commission_cost} 3);
	platform_cost=15;
	sum_tax=$(calc ${platform_cost}+${commission_cost})
	echo ${sum_tax}
}

function calc_gov_tax()
{
	trade_volume=$1;
	deal_system_cost=0.5;
	settlement_cost=$(calc ${trade_volume}*0.002/100)
	settlement_cost=$(max $(min ${settlement_cost} 2) 100)
	gov_stamp_tax=$(calc ${trade_volume}*0.1/100)
	gov_stamp_tax=$(ceilling ${gov_stamp_tax})
	exchange_trade_tax=$(calc ${trade_volume}*0.005/100)
	exchange_trade_tax=$(min ${exchange_trade_tax} 0.01)
	csrc_trade_tax=$(calc ${trade_volume}*0.0027/100)
	csrc_trade_tax=$(min ${csrc_trade_tax} 0.01)
	sum_tax=$(calc ${deal_system_cost}+${settlement_cost}+${gov_stamp_tax}+${exchange_trade_tax}+${csrc_trade_tax})
	echo ${sum_tax}
}

#function calc_stock_revenue()
#{
	buy_price=$1;
	sale_price=$2;
	amount=$3;
	trade_volume=$(calc ${buy_price}*${amount});
	futu_tax=$(calc_futu_tax ${trade_volume})
	gov_tax=$(calc_gov_tax ${trade_volume})
	buy_cost=$(calc ${trade_volume}+${futu_tax}+${gov_tax})
	printf "\n%-15s%-15s%-15s%-15s%-15s%-15s\n" buy_price amount trade_volume futu_tax gov_tax buy_cost
	printf "%-15.2f%-15.2f%-15.2f%-15.2f%-15.2f%-15.2f\n" $buy_price $amount $trade_volume $futu_tax $gov_tax $buy_cost

	trade_volume=$(calc ${sale_price}*${amount});
	futu_tax=$(calc_futu_tax ${trade_volume})
	gov_tax=$(calc_gov_tax ${trade_volume})
	sale_revenue=$(calc ${trade_volume}-${futu_tax}-${gov_tax})
	printf "\n%-15s%-15s%-15s%-15s%-15s%-15s\n" sale_price amount trade_volume futu_tax gov_tax sale_revenue
	printf "%-15.2f%-15.2f%-15.2f%-15.2f%-15.2f%-15.2f\n" $sale_price $amount $trade_volume $futu_tax $gov_tax $sale_revenue
	echo "total_revenue"
	echo $(calc ${sale_revenue}-${buy_cost})	
#}
#$(calc_stock_revenue 432 446 100)
