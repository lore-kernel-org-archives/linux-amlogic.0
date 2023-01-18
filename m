Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D3BC00A5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 03:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFZM7z33a67BpV64+5MFQzCMeF4ys5KuZf8SRfxvgUo=; b=xNB4WL/q+YAVcK
	cv1MtsRsHmImghkZr1UAxqwAG9R5SnZlvYVeSJlVar5ZN3msfQd/Ws+mLVqpEhAhs+JmARZqX0RNI
	9Ey/JMtl4p0hBPIRM+HrY8viAwK/kSbxbbag8uf/6ZtN8uJM28Ghr7c7cdEKQBscLW+smep3I2kBv
	kuEZZY4QyEcSj9HE91OeXTfHDXFUOuKKHkFhPZ/L4M53eVlsGWz02hb18FhaNNq713S82Zmo8cADz
	5r0EenUZr9O1n07wLmS85x1wGCDQ3pTvxRDQCMCs/sPxpf36T74jdNYY3PQGytxptydxMQ+6GUPP0
	lQap2Puj7rZGOBd9HByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyiu-00GdvY-Nm; Wed, 18 Jan 2023 03:02:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyir-00Gdv8-DW
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 03:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YpFIqPtiW9OaArCWKSRp3L+DqFNQiRH+JQ1OhEOlGjI=; b=rxrXmtzX8EDhlqVUNG11/gu1vH
	shFj+DiZINeRAGuhzhZj7Z2VUE5toQKxh0HgQcmt+heR4x5DTEyzFKc6lh71kxN6eGIEI8+yRV3IT
	0AlvXJeiM81lkLXQZ0jFMd9iA2i7kJ+imPcrq1MpLFWrGxrPOFK9H2F29MwKxWx5wuIE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pHyip-002OEV-MM; Wed, 18 Jan 2023 04:02:43 +0100
Date: Wed, 18 Jan 2023 04:02:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: mdio: add amlogic gxl mdio mux support
Message-ID: <Y8dhUwIMb4tTeqWN@lunn.ch>
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116091637.272923-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_190245_491325_BEC06C3F 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> +static int gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
> +{
> +	u32 val;
> +
> + 	/* Setup the internal phy */
> +	val = (REG3_ENH |
> +	       FIELD_PREP(REG3_CFGMODE, 0x7) |
> +	       REG3_AUTOMDIX |
> +	       FIELD_PREP(REG3_PHYADDR, 8) |
> +	       REG3_LEDPOL |
> +	       REG3_PHYMDI |
> +	       REG3_CLKINEN |
> +	       REG3_PHYIP);
> +
> +	writel_relaxed(REG4_PWRUPRSTSIG, priv->regs + ETH_REG4);
> +	writel_relaxed(val, priv->regs + ETH_REG3);
> +	mdelay(10);

Probably the second _relaxed() should not be. You want it guaranteed
to be written out before you do the mdelay().

> +
> +	/* Set the internal phy id */
> +	writel_relaxed(FIELD_PREP(REG2_PHYID, 0x110181),
> +		       priv->regs + ETH_REG2);

So how does this play with what Heiner has been reporting recently?
What is the reset default? Who determined this value?

> +	/* Enable the internal phy */
> +	val |= REG3_PHYEN;
> +	writel_relaxed(val, priv->regs + ETH_REG3);
> +	writel_relaxed(0, priv->regs + ETH_REG4);
> +
> +	/* The phy needs a bit of time to come up */
> +	mdelay(10);

What do you mean by 'come up'? Not link up i assume. But maybe it will
not respond to MDIO requests?

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
