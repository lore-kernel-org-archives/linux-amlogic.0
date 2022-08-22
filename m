Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656D3C28D13
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Aug 2022 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jRbH5EXx0hOs60X5+oh/ElkodYxdtgBd/gyKQc5rlM=; b=RNldcMsxYIzB7k
	r5mpoUslQzFWKq1zL4WHdhqgNiCzFLeqcidCfUgh/u97yfTht91zCkWlGd+o+yRVYs8z7c2IEYPyw
	tZ9G5drBo/I9EIBym77vUY948ywW5YTECBshoizj38cDCXa2gWPCsK/6wdnbF7KuQOSrxYQXCpF6d
	zLEqJIFOSd52RObA3pScqN2EtdW7tt4jMV3RtOD1a3ZY7asg9xPZqV69VQOvE9RuepPm1i1TedTJH
	3NPRZ3XPNyXWzw5MeJRTdRwNT3oeETVZsyN/A7eJazLpRWDcWXyKmJL5m8+5/JHSeHKt9ZxDc4BXk
	dk+pixdawICkyH7UmZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2AU-0066zA-Df; Mon, 22 Aug 2022 07:48:18 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2AO-0066pj-Mh; Mon, 22 Aug 2022 07:48:16 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id A0A70580281;
	Mon, 22 Aug 2022 03:48:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 22 Aug 2022 03:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1661154484; x=
	1661161684; bh=kU6Wak9ut3j71FNKf2BBeHdpI0gagJvWCf5yFVBoM/c=; b=H
	bUPksQAhrtg9+tEqN67qHrIjYx3E3y97nKNFMOxfK9lHY4b0HrFeFzwozV1/UuEk
	jnqKKcP3stC2iPQhWubYR88DpkpCQ+uuMuFjx16zDOnclzYiNDLuggYk0ma1ecqH
	iWU9QgfapN+nXI9i8uiDnSxjt5JQ0TdqPQkalfV8y5CjJrDw5vLmAbP+jVpj8DnB
	e00fXNBJmCfyaUsLab5atJYRR19hsiMzWrcUAp6mAmXg8R0hLFxe8qLanowPSM73
	qxRm1ZhHc0NbjkRMgacLggOo41+6BKIXohNNiHiZRJHUJsgkzYdriS7mbp+x3UKS
	nsizcFAvC+Ux46VqmhIlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661154484; x=
	1661161684; bh=kU6Wak9ut3j71FNKf2BBeHdpI0gagJvWCf5yFVBoM/c=; b=u
	w8EINgU0Xp5GQ1lo0oDnlD4M/3g7NrEmQW26OlQO6syTa+PG3Mg9ydwcYBiOHF46
	/FIvYYYKzJ1H7bRCJZE6ylyiqNjP54dWpgjBgYyd1OO83wKp0MpsFbUGnqfm8j8u
	QzFH+F9F0je0NoE2TbLidJmmTOfr7n4Djzrpo0CXy00gS8AdWsGHvBD0Tbz9YOw4
	h/9V+JwELqdfASTX2ADBR+PMZmtCcIkiM30mB3CPlg6uo9qJIFaGUyrO+fa6CeDz
	6oraXWrl7eAXPVXj96Vqqi0vmkritmpm6oNtSE4T2trpYRb6JVf4kIXT1Vbq5Krm
	WKHp8GO5PibBRxF51f3YQ==
X-ME-Sender: <xms:szQDY32-2c5mWR1G6LxeX0Vg7R3v1CLjTsw2XvN3mxrjkZXBQxpRXQ>
    <xme:szQDY2GFDP3KlWF34_cFVKizKKs3AWrYs9Q6vZenN070CU510oF2QPdSKmgrHCNfL
    NcroseR0DtwkaxouIo>
X-ME-Received: <xmr:szQDY35I9gju5RuUA5mCnt-8ZEN5A8t_TQMzhO7xKy8Bf_-ZrT77_cSEAek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiiedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgr
    gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
    frrghtthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedv
    vdeiledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:szQDY819CXMEtZQrV0_neGd6rhjyRqdXcgvkSrSflAOfQMUjguxR9Q>
    <xmx:szQDY6GCUH1QFarSCmhw55TTNlA9OuQjfAtYBXUkE-DiVJOwqpOjgA>
    <xmx:szQDY9_g9jurhG8LSKWZHyrOCyfYXnKQN_sPCEwC2Nq6ucBlxHumIA>
    <xmx:tDQDYz3bSMaJOuQoZ4cxJb4caJ73u13HBUwmHbOAwYXx3L6nBBs47A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 03:48:02 -0400 (EDT)
Date: Mon, 22 Aug 2022 09:48:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Message-ID: <20220822074800.qzyctchqn5usr55g@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_004813_756056_30937502 
X-CRM114-Status: GOOD (  31.96  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Sun, Aug 21, 2022 at 06:33:12PM +0200, Noralf Tr=F8nnes wrote:
> Den 29.07.2022 18.34, skrev Maxime Ripard:
> > Hi,
> > =

> > Here's a series aiming at improving the command line named modes suppor=
t,
> > and more importantly how we deal with all the analog TV variants.
> > =

> > The named modes support were initially introduced to allow to specify t=
he
> > analog TV mode to be used.
> > =

> > However, this was causing multiple issues:
> > =

> >   * The mode name parsed on the command line was passed directly to the
> >     driver, which had to figure out which mode it was suppose to match;
> > =

> >   * Figuring that out wasn't really easy, since the video=3D argument o=
r what
> >     the userspace might not even have a name in the first place, but
> >     instead could have passed a mode with the same timings;
> > =

> >   * The fallback to matching on the timings was mostly working as long =
as
> >     we were supporting one 525 lines (most likely NSTC) and one 625 lin=
es
> >     (PAL), but couldn't differentiate between two modes with the same
> >     timings (NTSC vs PAL-M vs NSTC-J for example); =

> > =

> >   * There was also some overlap with the tv mode property registered by =

> >     drm_mode_create_tv_properties(), but named modes weren't interacting
> >     with that property at all.
> > =

> >   * Even though that property was generic, its possible values were
> >     specific to each drivers, which made some generic support difficult.
> > =

> > Thus, I chose to tackle in multiple steps:
> > =

> >   * A new TV norm property was introduced, with generic values, each dr=
iver
> >     reporting through a bitmask what standard it supports to the usersp=
ace;
> > =

> >   * This option was added to the command line parsing code to be able to
> >     specify it on the kernel command line, and new atomic_check and res=
et
> >     helpers were created to integrate properly into atomic KMS;
> > =

> >   * The named mode parsing code is now creating a proper display mode f=
or
> >     the given named mode, and the TV standard will thus be part of the
> >     connector state;
> > =

> >   * Two drivers were converted and tested for now (vc4 and sun4i), with
> >     some backward compatibility code to translate the old TV mode to the
> >     new TV mode;
> > =

> > Unit tests were created along the way. Nouveau, ch7006 and gud are
> > currently broken for now since I expect that work to be reworked fairly
> > significantly. I'm also not entirely sure about how to migrate GUD to t=
he
> > new property.
> > =

> > Let me know what you think,
> > Maxime
> > =

> =

> I don't know if it's related to this patchset or not, but I do get this:
> =

> pi@pi4t:~ $ sudo dmesg -C && sudo modprobe -r vc4 && sudo modprobe vc4
> && dmesg
> [  430.066211] Console: switching to colour dummy device 80x30
> [  431.294788] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> [  431.295115] vc4-drm gpu: bound fec13000.vec (ops vc4_vec_ops [vc4])
> [  431.295467] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> [  431.295804] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops
> [vc4])
> [  431.298895] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> [  441.444250] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
> timed out
> [  441.446529] Console: switching to colour frame buffer device 90x30
> [  451.684321] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  451.684347] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] commit wait
> timed out
> [  461.924255] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  461.924281] vc4-drm gpu: [drm] *ERROR* [CONNECTOR:45:Composite-1]
> commit wait timed out
> [  472.164006] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  472.164031] vc4-drm gpu: [drm] *ERROR* [PLANE:61:plane-1] commit wait
> timed out
> [  482.403877] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  482.403903] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
> [  492.643799] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
> timed out
> [  492.647073] vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device

Module unloading/reloading has been janky for a while.

I've fixed it up recently but it doesn't surprise me that there's still
some situation that won't work. Is it on a Pi3?

Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
