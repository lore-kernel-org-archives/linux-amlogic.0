Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05EC606A32E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u7nP/oRq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HGbB2D8d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nHkYb2imas2mPHz8iIqIFlaVwA6Hu5hwwYBfniI8NSw=; b=u7nP/oRq/Tq6UwhLrPrAmlvWqp
	XHVqQauM4P6VbkeBX/+tU4z1ddw3WrlJyny2P/P+Jl+74UeXtkND0j24HmZGnZ1Bkfvt9Jo+X9hL0
	1mZGCDeNWbBIrCgViMOlZzgIcvyk/4VhMayvgSsdfnTP3j5I/KusJu+x88+thGaVeaToiYsZBhIck
	k9IuJ8vuz+yvjLWOX5++IafZ0pMWVY6mn8Lxapwc0Z7ai+j2poy7xP8fjrSagEJUUkzs7OrrwOwaS
	Ev8spg0EtUTmK7xdUKDWm+4+KuXeWaHbERR1YZTOw4cyOWJBgUW8dsqOnmzCo7jWLsr0Qeig44Evt
	mNuzzQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVEo-0000000CRwj-3xEG;
	Thu, 26 Nov 2026 08:53:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVEn-0000000CRwR-10Yg;
	Thu, 26 Nov 2026 08:53:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52D3A60D6F;
	Thu, 26 Nov 2026 08:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D431F000CA;
	Thu, 26 Nov 2026 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795683231;
	bh=nzEKGWM8XJphHX6pI/ArHGtfH8d9j0dSK2RH8XdKPD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HGbB2D8dDi8WEhaIq3D5hivqa4ok6pf476MsWCWGtQf5SRgtyxnAWKscKqkY40j+o
	 84oHtK2D94U0vboMk/gXQV6IHfJ37g1xEV0SSahxoUFBzBreEJSVlWbslpzGLbC6kS
	 3x7cGKmzYUvdPnuxOW+Wz51xGtSZ5uYpWT00NJVv/7S1wEZKGhaooAWvTO7PFdqm79
	 +JZrNFvQcI6N1lgA8QVMHfukPEmtY9TfArBzQmHKU6ayesucR0KBNoXDrxIiTOrZ5y
	 /6nNJwhLQ4yJnyZhvOOEZ5Y4TuIAy9SxYtBtlYKXGGlMgczNEUe+HVQsKgvZudyiUX
	 2T0CTuapbNqMA==
Date: Thu, 26 Nov 2026 08:53:40 +0000
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mmc@vger.kernel.org, Hiroshi.DOYU@nokia.com, aaro.koskinen@iki.fi,
	adrian.hunter@intel.com, aidanmacdonald.0x0@gmail.com,
	alcooperx@gmail.com, allen.lkml@gmail.com, apelete@seketeli.net,
	aubin.constans@microchip.com, bcm-kernel-feedback-list@broadcom.com,
	chenhuacai@kernel.org, christian.loehle@arm.com, djakov@kernel.org,
	drzeus@drzeus.cx, florian.fainelli@broadcom.com,
	geert+renesas@glider.be, hkallweit1@gmail.com,
	jan.glauber@gmail.com, jarkko.lavinen@nokia.com,
	jbrunet@baylibre.com, jh80.chung@samsung.com, josua@solid-run.com,
	juha.yrjola@nokia.com, kamal.dasu@broadcom.com,
	khilman@baylibre.com, krzysztof.kozlowski@oss.qualcomm.com,
	lars@metafoo.de, lgs201920130244@gmail.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	martin.blumenstingl@googlemail.com, mirq-linux@rere.qmqm.pl,
	neil.armstrong@linaro.org, niklas.soderlund+renesas@ragnatech.se,
	oakad@yahoo.com, paul@crapouillou.net, pb@handhelds.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, pramod.gurav@linaro.org,
	riteshh@codeaurora.org, rric@kernel.org, sameo@openedhand.com,
	shawn.lin@rock-chips.com, support@cavium.com, tony@atomide.com,
	u.kleine-koenig@baylibre.com, ulfh@kernel.org,
	wsa+renesas@sang-engineering.com, yoshihiro.shimoda.uh@renesas.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 00/13] mmc: Assorted bug fixes across MMC host drivers
Message-ID: <20261126085340.GC38590@joneslee-macbookpro.roam.internal>
References: <20261123191703.179283-1-lee@kernel.org>
 <bc602723-07fb-4af9-9201-272dd0fe759e@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc602723-07fb-4af9-9201-272dd0fe759e@web.de>
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

On Wed, 25 Nov 2026, Markus Elfring wrote:

> ...
> > Lee Jones (13):
> >   mmc: cavium: Remove MMC slots before destroying slot platform devices
> >   mmc: cavium: Prevent slot_pdev[] out-of-bounds write during probe
> >   mmc: sdhci-msm: Resume runtime PM before accessing registers on remove
> >   mmc: meson-gx: Fail request when descriptor chain DMA mapping fails
> >   mmc: jz4740: Skip DMA cleanup in PIO mode during post_req
> >   mmc: renesas_sdhi: Guard host->cmd access in internal DMAC issue work
> >   mmc: tifm_sd: Synchronise timeout handler with request completion
> >   mmc: omap: Shut down cover timer before disabling cover BH work
> >   mmc: renesas_sdhi: Disable internal DMAC BH work items on release
> >   mmc: jz4740: Apply DMA max_seg_size limit to unified tx-rx channel
> >   mmc: dw_mmc: Disarm central watchdog when ending a request
> >   mmc: renesas_sdhi: Fix SDIO manual tap correction in SDR104 mode
> >   mmc: sdhci-brcmstb: Handle absent optional sdio_freq clock in probe
> ...
> 
> How do you think about to sort (and group) desired adjustments
> by affected software components?

This is new to me.  What guidance says to do that?

Making your own rules up and spraying them at contributors wastes people's time.

-- 
Lee Jones

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
