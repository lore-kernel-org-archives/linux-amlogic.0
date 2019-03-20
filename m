Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D290EC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 10:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEB32075C
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 10:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqMOaQ6n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEB32075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1/DBvHzcpjouQq2FdcoYSsCoo9WQItH7+QfKG4NJds=; b=NqMOaQ6nJ5gyKX
	m66eajE/paRY8W7yXQWV94ILcaVEvDetOl2laFxJ1u5ahKx0BdzNVY48iE5VIu9RkSw2bpgmGtGWW
	ho5sCrJpDsLFfy5uIk3khgWpksI+u2Tvzf/eBEBng2Mk/k6pEaIJQC81gjnTvOUnkPpvXv+niH2az
	6vP3VE29+sHqogiB46o6+6JppVxw+MDtaioMbBqGepzZ+FjZg3e4S8TJXYaCEQN14Wrj1LFoGCuFl
	60F92dbhh8rnT/iCt3ErE0Ys7ABTesDNuFiA4+4bL0Wc34+S2PTvwVQBQSa2CR0mZMjgxqC8Lclc6
	u+X/dwL0ihwMJaVafW4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6YXq-0004oa-Jn; Wed, 20 Mar 2019 10:34:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6YXn-0004nj-N8
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 10:34:01 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1h6YXj-0007SN-LU; Wed, 20 Mar 2019 11:33:55 +0100
Message-ID: <1553078035.7071.5.camel@pengutronix.de>
Subject: Re: [PATCH] reset: meson-audio-arb: Fix missing .owner setting of
 reset_controller_dev
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Axel Lin <axel.lin@ingics.com>
Date: Wed, 20 Mar 2019 11:33:55 +0100
In-Reply-To: <20190318140352.31979-1-axel.lin@ingics.com>
References: <20190318140352.31979-1-axel.lin@ingics.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_033359_910505_D325E363 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-18 at 22:03 +0800, Axel Lin wrote:
> Set .owner to prevent module unloading while being used.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/reset/reset-meson-audio-arb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
> index 91751617b37a..c53a2185a039 100644
> --- a/drivers/reset/reset-meson-audio-arb.c
> +++ b/drivers/reset/reset-meson-audio-arb.c
> @@ -130,6 +130,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
>  	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);
>  	arb->rstc.ops = &meson_audio_arb_rstc_ops;
>  	arb->rstc.of_node = dev->of_node;
> +	arb->rstc.owner = THIS_MODULE;
>  
>  	/*
>  	 * Enable general :

Thank you, applied to reset/fixes.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
