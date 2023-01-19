Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008C3C004D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 17:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khWS8KCYO2jUnhxIU9SRpu1iFczJZcrZ17xS0EkW65Y=; b=h1GsKSJbNbvCUf
	T6Ru8JJBYDGBfkA5M7kqs4nh9o3G65FzD84EH5O4aNsQfSrEwtsIv9idr3Qvt8DV1Cqnneap9p2Ai
	9Z9t8/3IAAZIgTBu55UgPQi5vlFJhCqPo8KsUmROuXZH8mCTASfvRVp32KJfmQ6xn13GmJx5RMOtY
	+U8LKIdOrh+rBucKcyXuUFusm9jfk8lpwJdpa0GqCNcnC8NFp522aIS81Qol2/Ow5y0akooCJ3Y/D
	V0TrBV+wO3UTDB+kd6v8elkY39adioaOeJprg4p2u/TNVXDnrMlzD143AcB5jBLmKSYwG1699sDwU
	BZReWHWXJDqaYGl9yv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYY9-006E8l-Se; Thu, 19 Jan 2023 17:18:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYY7-006E5m-2b
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 17:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=goNppuvMsvAqTs2f6LDSEjPwHmSsgV4gH7uC2Dwvo8A=; b=JlTJVlLtDX5VBm3jpr+T7LKb8s
	R8oUOd9OnwmO+diUvmHieYRV+PDwhqRgzuzFstpbcFeYi6IBjBBcT/0z7umETLxwcSrd1ZllMScRL
	NsSeERJrV65F4oxWbeUwsqe5ORDdSBFu8ohfpsHXGaIVxjEvl9TB+OAIFwvV+KUGKzmU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pIYY1-002c22-I1; Thu, 19 Jan 2023 18:17:57 +0100
Date: Thu, 19 Jan 2023 18:17:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: mdio: add amlogic gxl mdio mux support
Message-ID: <Y8l7Rc9Vde9J45ij@lunn.ch>
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-3-jbrunet@baylibre.com>
 <Y8dhUwIMb4tTeqWN@lunn.ch>
 <1jmt6eye1m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jmt6eye1m.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_091803_187644_5A974C8F 
X-CRM114-Status: GOOD (  31.13  )
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

> >> +
> >> +	/* Set the internal phy id */
> >> +	writel_relaxed(FIELD_PREP(REG2_PHYID, 0x110181),
> >> +		       priv->regs + ETH_REG2);
> >
> > So how does this play with what Heiner has been reporting recently?
> 
> What Heiner reported recently is related to the g12 family, not the gxl
> which this driver address.
> 
> That being said, the g12 does things in a similar way - the glue
> is just a bit different:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/mdio/mdio-mux-meson-g12a.c?h=v6.2-rc4#n165
> 
> > What is the reset default? Who determined this value?
> 
> It's the problem, the reset value is 0. That is why GXL does work with the
> internal PHY if the bootloader has not initialized it before the kernel
> comes up ... and there is no guarantee that it will.
> 
> The phy id value is arbitrary, same as the address. They match what AML
> is using internally.

Please document where these values have come from. In the future we
might need to point a finger when it all goes horribly wrong.

> They have been kept to avoid making a mess if a vendor bootloader is
> used with the mainline kernel, I guess.
> 
> I suppose any value could be used here, as long as it matches the value
> in the PHY driver:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/meson-gxl.c?h=v6.2-rc4#n253

Some Marvell Ethernet switches with integrated PHYs have IDs with the
vendor part set to Marvell, but the lower part is 0. The date sheet
even says this is deliberate, you need to look at some other register
in the switches address space to determine what the part is. That
works O.K in the vendor crap monolithic driver, but not for Linux
which separates the drivers up. So we have to intercept the reads and
fill in the lower part. And we have no real knowledge if the PHYs are
all the same, or there are differences. So we put in the switch ID,
and the PHY driver then has an entry per switch. That gives us some
future wiggle room if we find the PHYs are actually different.

Is there any indication in the datasheets that the PHY is the exact
same one as in the g12? Are we really safe to reuse this value between
different SoCs?

I actually find it an odd feature. Does the datasheet say anything
about Why you can set the ID in software? The ID describes the
hardware, and software configuration should not be able to change the
hardware in any meaningful way.

> >> +	/* Enable the internal phy */
> >> +	val |= REG3_PHYEN;
> >> +	writel_relaxed(val, priv->regs + ETH_REG3);
> >> +	writel_relaxed(0, priv->regs + ETH_REG4);
> >> +
> >> +	/* The phy needs a bit of time to come up */
> >> +	mdelay(10);
> >
> > What do you mean by 'come up'? Not link up i assume. But maybe it will
> > not respond to MDIO requests?
> 
> Yes this MDIO multiplexer is also the glue that provides power and
> clocks to the internal PHY. Once the internal PHY is selected, it needs
> a bit a of time before it is usuable. 

O.K, please reword it to indicate power up, not link up.

     Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
