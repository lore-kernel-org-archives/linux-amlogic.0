Return-Path: <SRS0=7SbI=RU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D541C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2019 16:14:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ECD720693
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2019 16:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cT4RFPtZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="un6l3eJT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ECD720693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ljuo3i3PjRZj3zusQh0ooVVF63BHpDbYTQ1QeF9oKlE=; b=cT4RFPtZNe8120
	bfSnsRU5emcbuz5xOPhBpEZ/e0JXM0Uqhxx6MxI3f6Gd85lrSvL3a2cyCmqSsLescN7mMcaXuyPMU
	1kUmTiB9ymiwSczRqRnp6feGPDNfLyCv00cO5LbVQUjPwKpm0fdhjCuXXn1YMpFzVReP72X57PSqC
	0qnhhZXXO20ECTKnDJomxN0g65bcqFQcTj83d84BNDMNCvmimJOK3nJTO+Zo0PYNNQVm6motMZRid
	zyriB28oIW1uQ/L8xe1RWNrvd2vz2IIhAdrA0/Fhr0ojRqUe8OvyCSYMBGzCOrL+yQvcRh6LAIg7D
	05oBBWYDSTdOLvSQh8fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5YQM-0007Si-1V; Sun, 17 Mar 2019 16:14:10 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5YQJ-0007KV-6T
 for linux-amlogic@lists.infradead.org; Sun, 17 Mar 2019 16:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ga/d6DAfonYT+aevDO+ynI5XmAxDR8reYVrq9kRGXeU=; b=un6l3eJTOWHqfEoAodPnhb1QTO
 2UAS6okdoMWGsw3GKOuFwNkhe9WV4mOjDBdev5BLLDVsCEdtn/A8OMXo+uuHcAugzwriQknwZjEdW
 IAuCh5mSK6moTSLbZro6PW4tdt+Qc+hZv0mXp50oMDZRRyiE7WO4mwEZKjiPnj51np4I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1h5YQE-00067B-Tr; Sun, 17 Mar 2019 17:14:02 +0100
Date: Sun, 17 Mar 2019 17:14:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
Message-ID: <20190317161402.GB22226@lunn.ch>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314140135.19184-3-jbrunet@baylibre.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190317_091407_392110_40C38A00 
X-CRM114-Status: GOOD (  17.30  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
> Add support for the mdio mux and internal phy glue of the g12a SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/net/phy/Kconfig               |  10 +
>  drivers/net/phy/Makefile              |   1 +
>  drivers/net/phy/mdio-mux-meson-g12a.c | 371 ++++++++++++++++++++++++++
>  3 files changed, 382 insertions(+)
>  create mode 100644 drivers/net/phy/mdio-mux-meson-g12a.c
> 
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 071869db44cf..831aa350b1cb 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -74,6 +74,16 @@ config MDIO_BUS_MUX_GPIO
>  	  several child MDIO busses to a parent bus.  Child bus
>  	  selection is under the control of GPIO lines.
>  
> +config MDIO_BUS_MUX_MESON_G12A
> +	tristate "Amlogic G12a based MDIO bus multiplexer"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on OF_MDIO && HAS_IOMEM
> +	select MDIO_BUS_MUX

Hi Jerome

Do you need some clock depends? 

> +static int g12a_mdio_switch_fn(int current_child, int desired_child,
> +			       void *data)
> +{
> +	struct device *dev = data;
> +	struct g12a_mdio_mux *priv = dev_get_drvdata(dev);

David won't like that you don't have reverse Christmas tree. You need
to do the assignment to priv in the body of the code. Or can you pass
data directly to dev_get_drvdata?

> +static int g12a_mdio_mux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct g12a_mdio_mux *priv;
> +	int ret;

Reverse Christmas tree please.


> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regs))
> +		return PTR_ERR(priv->regs);
> +
> +	priv->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(priv->pclk)) {
> +		ret = PTR_ERR(priv->pclk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get peripheral clock\n");
> +		return ret;
> +	}
> +
> +	/* Make sure the device registers are clocked */
> +	ret = clk_prepare_enable(priv->pclk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable peripheral clock");
> +		return ret;
> +	}
> +
> +	/* Register PLL in CCF */
> +	ret = g12a_ephy_glue_clk_register(dev);

On error, you are not disabling the peripheral clock.

> +	if (ret)
> +		return ret;
> +
> +	return mdio_mux_init(dev, dev->of_node, g12a_mdio_switch_fn,
> +			     &priv->mux_handle, dev, NULL);
> +}

  Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
