From: davem@davemloft.net (David Miller)
Date: Wed, 29 Aug 2018 18:03:51 -0700 (PDT)
Subject: [PATCH] Revert "net: stmmac: Do not keep rearming the coalesce
 timer in stmmac_xmit"
In-Reply-To: <20180824090440.13411-1-jbrunet@baylibre.com>
References: <20180824090440.13411-1-jbrunet@baylibre.com>
Message-ID: <20180829.180351.2286550022392793882.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Aug 2018 11:04:40 +0200

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ff1ffb46198a..9f458bb16f2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3147,16 +3147,13 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	 * element in case of no SG.
>  	 */
>  	priv->tx_count_frames += nfrags + 1;
> -	if (likely(priv->tx_coal_frames > priv->tx_count_frames) &&
> -	    !priv->tx_timer_armed) {
> +	if (likely(priv->tx_coal_frames > priv->tx_count_frames)) {
>  		mod_timer(&priv->txtimer,
>  			  STMMAC_COAL_TIMER(priv->tx_coal_timer));
> -		priv->tx_timer_armed = true;
>  	} else {
>  		priv->tx_count_frames = 0;
>  		stmmac_set_tx_ic(priv, desc);
>  		priv->xstats.tx_set_ic_bit++;
> -		priv->tx_timer_armed = false;
>  	}
>  

I think we should definitely revert this because it is racey on so many
different levels.

Yes, the scheduling of the timer only occurs here and it thus protected
by the ->xmit lock.

However, the timer itself runs and ends asynchronously to this piece
of code here.  This kind of logic only works if you tightly synchronize
the full execution of the timer with the same long, _AND_ you make the
timer resample the parameters to see if there is work still to do.

The TSO xmit code doesn't have the tx_timer_armed logic.

And finally, yes, this thing locks assuming a single queue.  This code
is seriously faulty on multi-queue and will access the TX ring of an
arbitrary queue only holding netif_tx_lock().

This stuff is really broken, so I'm reverting.  Someone has to fix the
per-queue locking in stmmac_tx_timer() too.
