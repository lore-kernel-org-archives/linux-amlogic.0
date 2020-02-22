Return-Path: <SRS0=iFsO=4K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B18C35671
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 12:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89BB0208C4
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 12:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SoX+DCQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89BB0208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5DCiUUTRzAiWxTj9HYu8fB9tRg0I2/TWD1nPeE2ykI=; b=SoX+DCQEbVD/Xy
	FJI30F5cn8uN4B2E4tVRJmFXip8LoZmE511MujPPxKym14KCHQu4eYcs6MZNhiQeseMDyODwXyPED
	XRK+a3idKPMgIM/daeKdiij4NxOaaaaaA8q2kEufJohWIjKTl4RG+PTgB9fJPoDK2O4tbi8YE3p98
	b7yzuwwsOtI+U73WCGd6QfRdzFaMgj+wHbDqmHh30bqlk5FGK5kLsT9R38ZF0g8TMilpBwPJ0pM2R
	sHULM4gMYd1VX4o4EmH/lxXdpJ3eLuyjDPogIs/a0NhmlxLS7cELZUYJM/wxPZ1Xqavy3cu4RDXby
	jtyLpi9odtWUIz68unvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5U06-0001tA-NP; Sat, 22 Feb 2020 12:35:18 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Tzo-0000BT-1U
 for linux-amlogic@lists.infradead.org; Sat, 22 Feb 2020 12:35:01 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8BA26200A0;
 Sat, 22 Feb 2020 13:32:41 +0100 (CET)
Date: Sat, 22 Feb 2020 13:32:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200222123240.GD28287@ravnborg.org>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219203544.31013-5-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=IwXrOhc2p5v2XRWg7c8A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_043500_262700_70D460E1 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, CK Hu <ck.hu@mediatek.com>,
 linux-amlogic@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ville.

Nice patch - and diffstat looks good:
>  63 files changed, 217 insertions(+), 392 deletions(-)

There is an item in the Documentation/gpu/todo.rst that
describes this.
Could you drop this from todo.rst in this patch too.

> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index bb6528b01cd0..6dca5344c0b3 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -538,7 +538,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
>  	 */
>  	/* (ps/s) / (pixels/s) = ps/pixels */
>  	pclk = DIV_ROUND_UP_ULL(1000000000000,
> -				(mode->vrefresh * mode->htotal * mode->vtotal));
> +				(drm_mode_vrefresh(mode) * mode->htotal * mode->vtotal));
>  	dev_dbg(d->dev, "picoseconds between two pixels: %llu\n",
>  		pclk);
>  

This just caught my eye while browsing the patch.
It looks like a backward way to get the clock.

But patch is fine, it was just a drive-by comment.

Whole patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
(with or without removal of todo item added)

	Sam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
