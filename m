Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78650C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:34:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483B52087C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SLA1We0r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Kzvgw3Aa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 483B52087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOBBl5Al7KmQ4zXVphFKId1s6zfZ4koy2xpWclORx2Q=; b=SLA1We0rh+51X4
	eScIP17+9oVszLoP5/3hLGJWWa4nGiaLqBz9vwZ1LSSF01/5zSyHAi2sIJtoiUr0r+7AwUAJN6BPb
	3XweDJcto9JOrEBj3Ucl3bTlkuCyBVAaOxyfBTELs80XY0YL95+bXKqBU1WXEm3AXldXnB2iDHsII
	Mq41DkOkRx02TOe5Dcex6VXcRbwFaGnqSCIpcfJgDkgbBGf+wdN3Yph6JEYtRlk/q/ikkvh+kRuFs
	0XthKdtTtHI+gGIvn5Fv5wR8eu+GO79Tq+R/XpHJ0c5lpjJDOX9ScZMXNmV8p6N6IWVCoDRwo7rH4
	iXzycM15vhnl8gzFY4WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5oeq-0001gK-As; Mon, 18 Mar 2019 09:34:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5oel-0001fH-Ue
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:34:10 +0000
Received: by mail-wr1-x444.google.com with SMTP id t5so16184931wri.7
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=hDC7MDTy7chuvT3CYRtvVKRB25oC64BHrW8HkrSRHxM=;
 b=Kzvgw3Aa4dx8WMMUuEI+TQXXTUuYcIsNoM5H0zoKvRWB1t40YzRv3+KmM2JlvNhI/8
 Rclw57CZAGvJQFS/vErYEwe+gPMYYUb+x/nI+nc3aN5g+DisHoPp04AlOku3xuAT9tQm
 mC0a52jJw2Bg/5IveR5AIqZSIwXyBnUlTm7gxbxYjf+BfEXej3zGqe9D6H5oTjykwRPP
 JelpT2cqELZfl9/May2SBOfOyBPb/Kr8BI8KeAqWwzD9dM7bRh0AZanzK5E4xKmXKLfh
 EGZqaqWf/wNNIxiPyr03lrTzWWVNGjx1HeON2l2OOBHu7SevvF34q6HThHcAt/g4xZFP
 KdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=hDC7MDTy7chuvT3CYRtvVKRB25oC64BHrW8HkrSRHxM=;
 b=HSuS5TgYAlu7j8ut2LLPlHpzhBoncY5vNLAnktmV4FrPdrh7AnY07rqdLsZoZW+tF0
 nfTubX0pJt7SqNIJ37JLmeTIIfqNBQkfuEyj55VNwwPj1b5kUU3VrutmDbLXcU/ERFAF
 qib3tdm/qPN6Qs0pQTd2hRgiIl45bF2RXkmzobWRAtIN7v96WQPf5ElcZr5hODFpJ0JO
 GHvcbRFoVvTWp0DlkEpQ2teBAvvud4VqP3CZV55RBc3/biwU5KL46p6HsC14MSSJVj+b
 nfRIb0jTaogaYw7tImspPaRuIubbeing67QX4bYHZEqyz/7BvIXtZYIQA1D7PK+NMvcr
 FkyQ==
X-Gm-Message-State: APjAAAWkrbH402RdJw4+GlRBRZi4nuwRDj21VYDruFRy/M03aALeuJXi
 Q6uqQ7JtAGpNe+lGWyz4rPp9EA==
X-Google-Smtp-Source: APXvYqyZTwE2E1jAkDUHpd8/2uElbRuBSXyhbjfkplzTOPSqG6ZEC32/dpXi2yK4hLUgLs8QdO5aNg==
X-Received: by 2002:adf:ebce:: with SMTP id v14mr10964916wrn.69.1552901644788; 
 Mon, 18 Mar 2019 02:34:04 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 o8sm2482598wmh.11.2019.03.18.02.34.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 18 Mar 2019 02:34:03 -0700 (PDT)
Message-ID: <5b9b363f00acdcd83cce1a3e7bddda71edac9c06.camel@baylibre.com>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 18 Mar 2019 10:34:02 +0100
In-Reply-To: <20190317161402.GB22226@lunn.ch>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
 <20190317161402.GB22226@lunn.ch>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_023408_047988_18AC40BC 
X-CRM114-Status: GOOD (  23.24  )
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

On Sun, 2019-03-17 at 17:14 +0100, Andrew Lunn wrote:
> On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
> > Add support for the mdio mux and internal phy glue of the g12a SoC family
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/net/phy/Kconfig               |  10 +
> >  drivers/net/phy/Makefile              |   1 +
> >  drivers/net/phy/mdio-mux-meson-g12a.c | 371 ++++++++++++++++++++++++++
> >  3 files changed, 382 insertions(+)
> >  create mode 100644 drivers/net/phy/mdio-mux-meson-g12a.c
> > 
> > diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> > index 071869db44cf..831aa350b1cb 100644
> > --- a/drivers/net/phy/Kconfig
> > +++ b/drivers/net/phy/Kconfig
> > @@ -74,6 +74,16 @@ config MDIO_BUS_MUX_GPIO
> >  	  several child MDIO busses to a parent bus.  Child bus
> >  	  selection is under the control of GPIO lines.
> >  
> > +config MDIO_BUS_MUX_MESON_G12A
> > +	tristate "Amlogic G12a based MDIO bus multiplexer"
> > +	depends on ARCH_MESON || COMPILE_TEST
> > +	depends on OF_MDIO && HAS_IOMEM
> > +	select MDIO_BUS_MUX
> 
> Hi Jerome
> 
> Do you need some clock depends? 

I don't think we need more. ARCH_MESON already selects the necessary clock
parts. As for the COMPILE_TEST, the clock code should be able to compile even
if the common clock framework is disabled.

> 
> > +static int g12a_mdio_switch_fn(int current_child, int desired_child,
> > +			       void *data)
> > +{
> > +	struct device *dev = data;
> > +	struct g12a_mdio_mux *priv = dev_get_drvdata(dev);
> 
> David won't like that you don't have reverse Christmas tree. You need
> to do the assignment to priv in the body of the code. Or can you pass
> data directly to dev_get_drvdata?
> 
> > +static int g12a_mdio_mux_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	struct g12a_mdio_mux *priv;
> > +	int ret;
> 
> Reverse Christmas tree please.

I'll fix these

> 
> 
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	priv->regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(priv->regs))
> > +		return PTR_ERR(priv->regs);
> > +
> > +	priv->pclk = devm_clk_get(dev, "pclk");
> > +	if (IS_ERR(priv->pclk)) {
> > +		ret = PTR_ERR(priv->pclk);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(dev, "failed to get peripheral clock\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Make sure the device registers are clocked */
> > +	ret = clk_prepare_enable(priv->pclk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable peripheral clock");
> > +		return ret;
> > +	}
> > +
> > +	/* Register PLL in CCF */
> > +	ret = g12a_ephy_glue_clk_register(dev);
> 
> On error, you are not disabling the peripheral clock.

Indeed, good catch. Thx

> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	return mdio_mux_init(dev, dev->of_node, g12a_mdio_switch_fn,
> > +			     &priv->mux_handle, dev, NULL);
> > +}
> 
>   Andrew



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
