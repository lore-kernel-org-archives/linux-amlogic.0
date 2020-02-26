Return-Path: <SRS0=KJO1=4O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E0CC4BA12
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 15:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F279D2467D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 15:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGvEH4AG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F279D2467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znfEctKKRVhPwk/Cp4U85WW3V7haOmXKPJ8s578x//U=; b=cGvEH4AGFiaiDc
	NGuibfZXQmo0/YqQO/6RwnJ9fPgeGE/KYSpaxsFjppXFeHLTxM7+zHrRr7Dobk9S3jq7iDNC2WAL6
	LkWPXhDjSmbZiuFZXY/3d6YJFwNS6UrsKt2kXK/tQSOSr5b6LBdG405alxadUYCVO0ggF6VYhZRx8
	m/DVCd0SEnK/c7fN5FMl6/Gi1dpAiMwdWzSX1in3FRzRnsJstTHtLdqP760UECW7qOgsaIDWsL3Pw
	j1DtpRRHZbya86vTdy8wUG2vF+f0j3rkqA15H7GHUdIqhwfWBN0BPv4jbOA9VgqfSShuN+YPPy7PX
	fqvDGyxDOhADIrsrhM+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6yIe-0002p4-K9; Wed, 26 Feb 2020 15:08:36 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6yIb-0002es-4G
 for linux-amlogic@lists.infradead.org; Wed, 26 Feb 2020 15:08:34 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 07:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="350409339"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 26 Feb 2020 07:08:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Feb 2020 17:08:19 +0200
Date: Wed, 26 Feb 2020 17:08:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: 
Message-ID: <20200226150819.GK13686@intel.com>
References: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
 <CACRpkdZ4H5fdWsxsXnsbyxb6fwKbgm0h5a6CdqEjU9w5+z0a7Q@mail.gmail.com>
 <20200226143409.GJ13686@intel.com>
 <CACRpkdZSapEh3sCqGjpnOuX-vbf1C=AjzN7Ryu2v6V5npoWgoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZSapEh3sCqGjpnOuX-vbf1C=AjzN7Ryu2v6V5npoWgoA@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_070833_226138_6B3DF9F1 
X-CRM114-Status: GOOD (  28.50  )
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
Cc: Josh Wu <josh.wu@atmel.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Eric Anholt <eric@anholt.net>,
 nouveau@lists.freedesktop.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Paul Kocialkowski <contact@paulk.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Gustaf =?iso-8859-1?Q?Lindstr=F6m?= <gl@axentia.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Robert Chiras <robert.chiras@nxp.com>, Heiko Schocher <hs@denx.de>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>, Andreas Pretzsch <apr@cn-eng.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Purism Kernel Team <kernel@puri.sm>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 03:56:36PM +0100, Linus Walleij wrote:
> On Wed, Feb 26, 2020 at 3:34 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> > On Wed, Feb 26, 2020 at 01:08:06PM +0100, Linus Walleij wrote:
> > > On Wed, Feb 26, 2020 at 12:57 PM Ville Syrj=E4l=E4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > > On Tue, Feb 25, 2020 at 10:52:25PM +0100, Linus Walleij wrote:
> > >
> > > > > I have long suspected that a whole bunch of the "simple" displays
> > > > > are not simple but contains a display controller and memory.
> > > > > That means that the speed over the link to the display and
> > > > > actual refresh rate on the actual display is asymmetric because
> > > > > well we are just updating a RAM, the resolution just limits how
> > > > > much data we are sending, the clock limits the speed on the
> > > > > bus over to the RAM on the other side.
> > > >
> > > > IMO even in command mode mode->clock should probably be the actual
> > > > dotclock used by the display. If there's another clock for the bus
> > > > speed/etc. it should be stored somewhere else.
> > >
> > > Good point. For the DSI panels we have the field hs_rate
> > > for the HS clock in struct mipi_dsi_device which is based
> > > on exactly this reasoning. And that is what I actually use for
> > > setting the HS clock.
> > >
> > > The problem is however that we in many cases have so
> > > substandard documentation of these panels that we have
> > > absolutely no idea about the dotclock. Maybe we should
> > > just set it to 0 in these cases?
> >
> > Don't you always have a TE interrupt or something like that
> > available? Could just measure it from that if no better
> > information is available?
> =

> Yes and I did exactly that, so that is why this comment is in
> the driver:
> =

> static const struct drm_display_mode sony_acx424akp_cmd_mode =3D {
> (...)
>         /*
>          * Some desired refresh rate, experiments at the maximum "pixel"
>          * clock speed (HS clock 420 MHz) yields around 117Hz.
>          */
>         .vrefresh =3D 60,
> =

> I got a review comment at the time saying 117 Hz was weird.
> We didn't reach a proper conclusion on this:
> https://lore.kernel.org/dri-devel/CACRpkdYW3YNPSNMY3A44GQn8DqK-n9TLvr7uip=
F7LM_DHZ5=3DLg@mail.gmail.com/
> =

> Thierry wasn't sure if 60Hz was good or not, so I just had to
> go with something.
> =

> We could calculate the resulting pixel clock for ~117 Hz with
> this resolution and put that in the clock field but ... don't know
> what is the best?

I would vote for that approach.

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
