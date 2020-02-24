Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7242EC35671
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 13:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4717220828
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 13:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K26Q4XaS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4717220828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCseB7+N1a5eP/kzDXv95yzp2I1yheL1SUnr2E2I0T8=; b=K26Q4XaSYxD7ES
	d/WU7LxV51+sRBVzei9XqgqqqeEvaGX2Gg/wYGxFUSEz8LMpXKNuIwUi/48//cgpCTLTYBwryHcq3
	W4p4MA5WS7YPdta0WJguFntD0uxMAgakWImPowl0vShTDr+sR3HEacTDmluGs5vHZY/gOixXKj3ZT
	o1NHO1hRZp/G0f8ssdBlGL0UiL/CbtC2GU87lhawpqR/3HZ9njVHGHM0G0VSjmJ79btQk4+oW3qjx
	mr8ZeHgkuYrYO/fer0zEABWMwC1hnuj3N9Ty8s3FyJPh5oJJOQhuYJI4aWeH1JSygg/MehrJWztvn
	EJf9OCG651tNB8aaB/cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6DZG-0006xE-BB; Mon, 24 Feb 2020 13:14:38 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6DZD-0006wh-Ey
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 13:14:36 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 05:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; d="scan'208";a="255575855"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 24 Feb 2020 05:14:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2020 15:14:20 +0200
Date: Mon, 24 Feb 2020 15:14:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200224131420.GW13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <20200222123240.GD28287@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222123240.GD28287@ravnborg.org>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_051435_515273_44180739 
X-CRM114-Status: GOOD (  18.27  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Feb 22, 2020 at 01:32:40PM +0100, Sam Ravnborg wrote:
> Hi Ville.
> =

> Nice patch - and diffstat looks good:
> >  63 files changed, 217 insertions(+), 392 deletions(-)
> =

> There is an item in the Documentation/gpu/todo.rst that
> describes this.
> Could you drop this from todo.rst in this patch too.

Yeah, missed the TODO. Looks like there's one for hsync
removal as well.

> =

> > diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcd=
e_dsi.c
> > index bb6528b01cd0..6dca5344c0b3 100644
> > --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > @@ -538,7 +538,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_d=
si *d,
> >  	 */
> >  	/* (ps/s) / (pixels/s) =3D ps/pixels */
> >  	pclk =3D DIV_ROUND_UP_ULL(1000000000000,
> > -				(mode->vrefresh * mode->htotal * mode->vtotal));
> > +				(drm_mode_vrefresh(mode) * mode->htotal * mode->vtotal));
> >  	dev_dbg(d->dev, "picoseconds between two pixels: %llu\n",
> >  		pclk);
> >  =

> =

> This just caught my eye while browsing the patch.
> It looks like a backward way to get the clock.

Yep. I'll cook up a patch to switch this to ->clock.

> =

> But patch is fine, it was just a drive-by comment.
> =

> Whole patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> (with or without removal of todo item added)
> =

> 	Sam

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
