Return-Path: <SRS0=ZEtl=4N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_RHS_DOB,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C855EC35E04
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Feb 2020 15:45:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A20B2082F
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Feb 2020 15:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YnyCnYnJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A20B2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HSELqwyOXTMZ3K7zREcw5fbGfq7aRAY5pATAVJTfYI=; b=YnyCnYnJYFW12M
	v9TnsA39BjkpewRR0fCkzt1tbM49CftpGP01esA2/WMFiC0A2Ba2i/y39NOmGDpQNVA1qB19tvh0I
	zX1+DaG3voyL+z3wsKD7ic0ZBHooX5zVHCzlYyhapc696PubXsspNpOb8zjiCZtHYZC/GJQ25IttT
	5CjtbbXaxMDSgifcuWt40FAw8n4b4hBFDnGckZVcTeEG/6O5coV0zV4ybwDUuJDZLpZx6s8oy1Rxg
	XGwtG+Dnwgj7hkHEDBPfhQxT5UD710ZS30JerrdFh2mRIOaAWjk/Qs86BduZvuzxhpeKShHo5m+QX
	VYWGNrtPsPgYrDwbsU+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6cOf-0002fb-Oh; Tue, 25 Feb 2020 15:45:21 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6cOa-0002f7-Jf
 for linux-amlogic@lists.infradead.org; Tue, 25 Feb 2020 15:45:20 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 07:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="231057172"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 25 Feb 2020 07:45:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Feb 2020 17:45:06 +0200
Date: Tue, 25 Feb 2020 17:45:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200225154506.GF13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CGME20200219203620eucas1p24b4990a91e758dbcf3e9b943669b0c8f@eucas1p2.samsung.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <0f278771-79ce-fe23-e72c-3935dbe82d24@samsung.com>
 <20200225112114.GA13686@intel.com>
 <3ca785f2-9032-aaf9-0965-8657d31116ba@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ca785f2-9032-aaf9-0965-8657d31116ba@samsung.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_074516_698750_E2535A71 
X-CRM114-Status: GOOD (  17.42  )
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 25, 2020 at 04:19:27PM +0100, Andrzej Hajda wrote:
> On 25.02.2020 12:21, Ville Syrj=E4l=E4 wrote:
> > On Mon, Feb 24, 2020 at 03:14:54PM +0100, Andrzej Hajda wrote:
> >> On 19.02.2020 21:35, Ville Syrjala wrote:
> >>> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >>>
> >>> Get rid of mode->vrefresh and just calculate it on demand. Saves
> >>> a bit of space and avoids the cached value getting out of sync
> >>> with reality.
> >>>
> >>> Mostly done with cocci, with the following manual fixups:
> >>> - Remove the now empty loop in drm_helper_probe_single_connector_mode=
s()
> >>> - Fix __MODE() macro in ch7006_mode.c
> >>> - Fix DRM_MODE_ARG() macro in drm_modes.h
> >>> - Remove leftover comment from samsung_s6d16d0_mode
> >> ...
> >>> diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gp=
u/drm/panel/panel-arm-versatile.c
> >>> index 41444a73c980..47b37fef7ee8 100644
> >>> --- a/drivers/gpu/drm/panel/panel-arm-versatile.c
> >>> +++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
> >>> @@ -143,7 +143,6 @@ static const struct versatile_panel_type versatil=
e_panels[] =3D {
> >>>  			.vsync_start =3D 240 + 5,
> >>>  			.vsync_end =3D 240 + 5 + 6,
> >>>  			.vtotal =3D 240 + 5 + 6 + 5,
> >>> -			.vrefresh =3D 116,
> >>
> >> Are you sure vrefresh calculated (from totals and clock) is different
> >> than this field? If not, we risk regressions.
> >>
> >> This case is OK, but there is plenty other cases.
> > IIRC I did spot check a few of them. But which code exactly do you think
> > is abusing vrefresh and thus could break?
> =

> =

> I guess suspect/potential victim is every code which uses
> drm_mode_vrefresh - after this patch the function can return different
> value(if there are differences between provided and calculated vrefresh).
> =

> Quick examples where output of this function matters:
> =

> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp/d=
pu1/dpu_encoder_phys_cmd.c#L387

Already looks quite sketchy due to rounding.

> =

> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/pane=
l-sharp-lq101r1sx01.c#L42

msleep() is in no way accurate so looks rather sketchy as well.

> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/tilcdc/til=
cdc_crtc.c#L810

Another thing that suffers from rounding issues.

So to me these all look like code that someone should fix regardless.

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
