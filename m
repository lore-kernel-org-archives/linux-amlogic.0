Return-Path: <SRS0=v4K1=EY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A581C5519F
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 14:56:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195CD246F9
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 14:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqWXNAm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 195CD246F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JQYhbFqHiig4hMpUznK/JjU25gmg5gN2gERsmTPDlYc=; b=iqWXNAm9NcZrS77pBDvy3nfBV
	xRcXAwN3uDTGNMG+GYqtMnXxwCw+dSpm41SS2+G/4RZKlQBlqf08mARK7bAylxMGerlcen1iS5l8+
	ZJSwd+gh/DzWXOG9b7k7oVCw9a6hH2Jd2zI/irrIiyJzNLbTnQinuQTWdlWlmCgGWYrOiCK/qRwSw
	8BP+oCHFZPMN708FEOSYMqyiqhBPsYeIilXEbUGrnjnM5sBZBTGu3ZeNbMFyawfS3xQHkHqqb3cDC
	wsEeyAD7ffooaZ3ZEhoHn9+ZijWUc02fVz325CNApTqsQwp+3OuSIFTFqtoAg1VVzCBw5ooeq3wtQ
	HRRUOvQ2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfOsZ-0007xS-6g; Wed, 18 Nov 2020 14:56:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfOsQ-0007u7-0I
 for linux-amlogic@lists.infradead.org; Wed, 18 Nov 2020 14:56:07 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kfOsN-0002X4-U8; Wed, 18 Nov 2020 15:56:03 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kfOsI-00042j-Hp; Wed, 18 Nov 2020 15:55:58 +0100
Message-ID: <97c6e913bcc1472e2d0f2ff1709e03aefd795d85.camel@pengutronix.de>
Subject: Re: [PATCH] soc: amlogic: replace devm_reset_control_array_get()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yejune Deng <yejune.deng@gmail.com>, khilman@baylibre.com, 
 narmstrong@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com
Date: Wed, 18 Nov 2020 15:55:58 +0100
In-Reply-To: <1605667700-16681-1-git-send-email-yejune.deng@gmail.com>
References: <1605667700-16681-1-git-send-email-yejune.deng@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_095606_107213_88541FE9 
X-CRM114-Status: GOOD (  14.79  )
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

On Wed, 2020-11-18 at 10:48 +0800, Yejune Deng wrote:
> devm_reset_control_array_get_exclusive() looks more readable
> 
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
> ---
>  drivers/soc/amlogic/meson-ee-pwrc.c     | 3 +--
>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> index ed7d2fb..50bf5d2 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -413,8 +413,7 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
>  			dev_warn(&pdev->dev, "Invalid resets count %d for domain %s\n",
>  				 count, dom->desc.name);
>  
> -		dom->rstc = devm_reset_control_array_get(&pdev->dev, false,
> -							 false);
> +		dom->rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
>  		if (IS_ERR(dom->rstc))
>  			return PTR_ERR(dom->rstc);
>  	}
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index 8790627..b4615b2 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -304,7 +304,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>  		return PTR_ERR(regmap_hhi);
>  	}
>  
> -	rstc = devm_reset_control_array_get(&pdev->dev, false, false);
> +	rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
>  	if (IS_ERR(rstc)) {
>  		if (PTR_ERR(rstc) != -EPROBE_DEFER)
>  			dev_err(&pdev->dev, "failed to get reset lines\n");

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
