Return-Path: <SRS0=v4K1=EY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7BCC6369E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 14:56:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5CE246F9
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 14:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hV3g+pBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D5CE246F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ome0Ux3WF1sTDG5nRSjyVeA9doLhke2C3J6klGDh6s=; b=hV3g+pBW6TNz8/7fRPQYjWsU5
	BBISiHIxPWkJI+4ASBFhchsgZd+dt/2sNPqPO5ah736WTYcaoPAD3r5oreSIoHKT4u9VJT9qFLnbz
	Hcd08Rem30rq5sIvn8zTvIvBMAkecxkpT0E89YjK7PhXYG1x9giF7t8sGHsmct49t/2ZAEZzXiWOx
	gevG2osuaK/Yn9B2yVFum2d101IBKDxh9c5nX6PI2xyTmZOOn18AkUHH2tyX6fep/ap59y0q5vNmU
	w1PUK9OVSC4v81yzpOsiTClZNcEMGQb6WbHsTy3MkhX7fHJpQLb5JYyIecdhSpsYuHIgvG/q6/vq+
	q8RbYpoRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfOsc-0007z4-C0; Wed, 18 Nov 2020 14:56:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfOsQ-0007ug-MU
 for linux-amlogic@lists.infradead.org; Wed, 18 Nov 2020 14:56:07 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kfOsH-0002Vs-7t; Wed, 18 Nov 2020 15:55:57 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kfOsF-00042W-RT; Wed, 18 Nov 2020 15:55:55 +0100
Message-ID: <16613681b429ff814089d8529061b1c906bbb288.camel@pengutronix.de>
Subject: Re: [PATCH] phy: amlogic: replace devm_reset_control_array_get()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yejune Deng <yejune.deng@gmail.com>, kishon@ti.com, vkoul@kernel.org, 
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, lorenzo.pieralisi@arm.com,
 repk@triplefau.lt
Date: Wed, 18 Nov 2020 15:55:55 +0100
In-Reply-To: <1605666995-16462-1-git-send-email-yejune.deng@gmail.com>
References: <1605666995-16462-1-git-send-email-yejune.deng@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_095606_786752_8E94DF84 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Yejune,

On Wed, 2020-11-18 at 10:36 +0800, Yejune Deng wrote:
> devm_reset_control_array_get_exclusive() looks more readable
> 
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
> ---
>  drivers/phy/amlogic/phy-meson-axg-pcie.c       | 2 +-
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> index 377ed0d..3204f02 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> @@ -155,7 +155,7 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
>  
> -	priv->reset = devm_reset_control_array_get(dev, false, false);
> +	priv->reset = devm_reset_control_array_get_exclusive(dev);
>  	if (IS_ERR(priv->reset))
>  		return PTR_ERR(priv->reset);
>  
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> index 08e3227..bab6345 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> @@ -418,7 +418,7 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_disable_clk_ref;
>  
> -	priv->reset = devm_reset_control_array_get(dev, false, false);
> +	priv->reset = devm_reset_control_array_get_exclusive(dev);
>  	if (IS_ERR(priv->reset))
>  		return PTR_ERR(priv->reset);
>  

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
