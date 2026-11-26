Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B96606A323
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BR3GR8tZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGLBP+Jk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X2XS2Gph6dHKMKwTQreNKlEJuUpOV8m5uCIjzrBgFNc=; b=BR3GR8tZ9aAVqcFBqwOQddCwzq
	Da1oQJF43yO33KUmUe3YnInuhmGfqxLmSJsVEg/Km/qKyQWSFzDK72qS/HWeTIOoB2ArrdyV7cs5L
	uLq2C/WNZLP91m3asUlfgxaERo1slzaOdoA4Vyp3BrHUsteAeFdIqYfvsXxkXQATexhnDc5iusauD
	m1pdUmo2XaHdvSfTC9ypanRac0QUEu/S8ORAl9ibDLGuuNafNbDyF6e20Tv9AEGT4a5SSTE92W61/
	ij6BQMQRPmQDplOcChZBTwbigYlnqn1gLOEWQFAQBZg4ABClZK2KIlmOuk+ELwc4Zc17dlk5eY5o1
	7GoWClYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXfO-0000000D1As-2rKe;
	Thu, 26 Nov 2026 11:29:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXfM-0000000D1AM-2i4J;
	Thu, 26 Nov 2026 11:29:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF53162B42;
	Thu, 26 Nov 2026 11:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F051C1F000ED;
	Thu, 26 Nov 2026 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692567;
	bh=KzkXaWiJVAGevwCKGmXrszqK2VboCvPIQ4QmMjaaIPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jGLBP+JkU2AJkwG9HWQna8c8E2ZvqeVoV5+VRg7CN6hd6tZtRBknL2TpTaNnOZLkp
	 ++wUEWQMUvtqiKaa0n7aHWor/sUtoYJePQ4+wk8KbuBx+y4dNsrrB1DzOLdxu/fd84
	 7nJ+qaZaEIdV/ui+bWcw7Y9XXykuYFkNX5usk+qZyoZjTWQ8jTuqdAK+/uvAfhfBYm
	 vLD1rwU46gYuEBsyZVKz9IY7OLhaa+QXs5xBMV4s82f/hBfe/3SwdDDBmdRgkcmTu1
	 ImNQEPC/1S4bLzmmUQWpOrLnIUoLzzMnK5BacdDhrKMn8QfcSOGBubn0/jVnTBv2cw
	 Qqj2bkOrMtc0Q==
Date: Thu, 26 Nov 2026 11:29:07 +0000
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mmc@vger.kernel.org, aaro.koskinen@iki.fi,
	adrian.hunter@intel.com, aidanmacdonald.0x0@gmail.com,
	alcooperx@gmail.com, allen.lkml@gmail.com, apelete@seketeli.net,
	aubin.constans@microchip.com, bcm-kernel-feedback-list@broadcom.com,
	chenhuacai@kernel.org, christian.loehle@arm.com, djakov@kernel.org,
	florian.fainelli@broadcom.com, geert+renesas@glider.be,
	hkallweit1@gmail.com, jan.glauber@gmail.com, jbrunet@baylibre.com,
	jh80.chung@samsung.com, josua@solid-run.com,
	kamal.dasu@broadcom.com, khilman@baylibre.com,
	krzysztof.kozlowski@oss.qualcomm.com, lars@metafoo.de,
	lgs201920130244@gmail.com, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	martin.blumenstingl@googlemail.com, mirq-linux@rere.qmqm.pl,
	neil.armstrong@linaro.org, niklas.soderlund+renesas@ragnatech.se,
	oakad@yahoo.com, paul@crapouillou.net, pb@handhelds.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, pramod.gurav@linaro.org,
	rric@kernel.org, sameo@openedhand.com, shawn.lin@rock-chips.com,
	support@cavium.com, tony@atomide.com, u.kleine-koenig@baylibre.com,
	ulfh@kernel.org, wsa+renesas@sang-engineering.com,
	yoshihiro.shimoda.uh@renesas.com, zhoubinbin@loongson.cn
Subject: Re: [00/13] mmc: Assorted bug fixes across MMC host drivers
Message-ID: <20261126112907.GE38590@joneslee-macbookpro.roam.internal>
References: <20261123191703.179283-1-lee@kernel.org>
 <bc602723-07fb-4af9-9201-272dd0fe759e@web.de>
 <20261126085340.GC38590@joneslee-macbookpro.roam.internal>
 <9e76edf9-433e-43ab-a748-8a71804e2b26@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e76edf9-433e-43ab-a748-8a71804e2b26@web.de>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Markus Elfring wrote:

> >> How do you think about to sort (and group) desired adjustments
> >> by affected software components?
> > 
> > This is new to me.  What guidance says to do that?
> > 
> > Making your own rules up and spraying them at contributors wastes people's time.
> Can the following list variant be more helpful eventually?
> 
>   mmc: cavium: Prevent slot_pdev[] out-of-bounds write during probe
>   mmc: cavium: Remove MMC slots before destroying slot platform devices
>   mmc: dw_mmc: Disarm central watchdog when ending a request
>   mmc: jz4740: Apply DMA max_seg_size limit to unified tx-rx channel
>   mmc: jz4740: Skip DMA cleanup in PIO mode during post_req
>   mmc: meson-gx: Fail request when descriptor chain DMA mapping fails
>   mmc: omap: Shut down cover timer before disabling cover BH work
>   mmc: renesas_sdhi: Disable internal DMAC BH work items on release
>   mmc: renesas_sdhi: Fix SDIO manual tap correction in SDR104 mode
>   mmc: renesas_sdhi: Guard host->cmd access in internal DMAC issue work
>   mmc: sdhci-brcmstb: Handle absent optional sdio_freq clock in probe
>   mmc: sdhci-msm: Resume runtime PM before accessing registers on remove
>   mmc: tifm_sd: Synchronise timeout handler with request completion

No.  Stop making up rules!

-- 
Lee Jones

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
