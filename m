From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 17 Aug 2018 09:32:34 +0200
Subject: [v3, net-next, 02/12] net: stmmac: Do not keep rearming the
 coalesce timer in stmmac_xmit
In-Reply-To: <9d0be5db11478d00a9194065abcf137b4d537c0a.1526651009.git.joabreu@synopsys.com>
References: <9d0be5db11478d00a9194065abcf137b4d537c0a.1526651009.git.joabreu@synopsys.com>
Message-ID: <7c15f9477adbf69c6eb57a2a89273f7afc51574e.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-05-18 at 14:55 +0100, Jose Abreu wrote:
> This is cutting down performance. Once the timer is armed it should run
> after the time expires for the first packet sent and not the last one.
> 
> After this change, running iperf, the performance gain is +/- 24%.

Hi Guys,

Since v4.18, we are getting a serious regression on Amlogic based SoCs.
I have tested this on amlogic's: 
* gxbb S905 p200 (Micrel KSZ9031 - 1GBps)
* axg A113 s400 (Realtek RTL8211F - 1GBps)

Both SoCs use the synopsys gmac with stmmac driver.

I first noticed that running NFS root filesystem became unstable but I could not
understand why. Then, running a download as simple test with iperf3 (from an
initramfs) will break the 'network' in matter of seconds.

I don't know exactly what breaks but bisect clearly assign the blame to this
change. Reverting the change solve this problem.

I'll be happy to make more tests to help understand what is happening here.

In the meantime, should we consider reverting this patch ?

Best Regards
Jerome

> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: Vitor Soares <soares@synopsys.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |    1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    5 ++++-
>  2 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 42fc76e..4d425b1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -105,6 +105,7 @@ struct stmmac_priv {
>  	u32 tx_count_frames;
>  	u32 tx_coal_frames;
>  	u32 tx_coal_timer;
> +	bool tx_timer_armed;
>  
>  	int tx_coalesce;
>  	int hwts_tx_en;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d9dbe13..789bc22 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3158,13 +3158,16 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	 * element in case of no SG.
>  	 */
>  	priv->tx_count_frames += nfrags + 1;
> -	if (likely(priv->tx_coal_frames > priv->tx_count_frames)) {
> +	if (likely(priv->tx_coal_frames > priv->tx_count_frames) &&
> +	    !priv->tx_timer_armed) {
>  		mod_timer(&priv->txtimer,
>  			  STMMAC_COAL_TIMER(priv->tx_coal_timer));
> +		priv->tx_timer_armed = true;
>  	} else {
>  		priv->tx_count_frames = 0;
>  		stmmac_set_tx_ic(priv, desc);
>  		priv->xstats.tx_set_ic_bit++;
> +		priv->tx_timer_armed = false;
>  	}
>  
>  	skb_tx_timestamp(skb);
