From: andrew@lunn.ch (Andrew Lunn)
Date: Tue, 5 Dec 2017 19:03:51 +0100
Subject: [RFC PATCH] net: stmmac: enable EEE in MII, GMII or RGMII only
In-Reply-To: <20171205102809.4347-1-jbrunet@baylibre.com>
References: <20171205102809.4347-1-jbrunet@baylibre.com>
Message-ID: <20171205180351.GT12805@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

>  bool stmmac_eee_init(struct stmmac_priv *priv)
>  {
>  	struct net_device *ndev = priv->dev;
> +	int interface = priv->plat->interface;
>  	unsigned long flags;
>  	bool ret = false;
>  
> +	if ((interface != PHY_INTERFACE_MODE_MII) &&
> +	    (interface != PHY_INTERFACE_MODE_GMII) &&
> +	    (interface != PHY_INTERFACE_MODE_RGMII) &&
> +	    (interface != PHY_INTERFACE_MODE_RGMII_ID) &&
> +	    (interface != PHY_INTERFACE_MODE_RGMII_TXID) &&
> +	    (interface != PHY_INTERFACE_MODE_RGMII_RXID))
> +		goto out;

phy_interface_mode_is_rgmii() will make this smaller.

      Andrew
