Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7894C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbIMmmqtQ9kGgj36elem4i9G3eM/yzUo4qCgtdsLHNI=; b=1QIm0LT8h87LRTao+qTkI/LAqc
	lUKMRhoPQbUUvN2nG5QQmk0CPUWjYyw7ktfaQHrVwPfdIoYG5hAvDPWWu5z0CVpkYEXYleRs0tle8
	cajm3Fgcfyz0sBbVhree8PrpXsnTzyecn31kVo8G7cNdELe6IjaYawCtbfk/TeKktZLa21sSOmJAx
	dBl4TQcm6AuptTL7CS2D9L/xb4ITrNRqhp9x5NV5fCo8dGMBHcvhLuFtLzOTPeTg6MXgH/is1zRIm
	S4QARRKjaC0UgXsI35PAAQL4GFf0/HKx/HMrj5bk7VChgF3FYlFjXrce462Xe6wBDHgsrhjrs2End
	zpo5xcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvZE-002Djz-GE; Tue, 16 Aug 2022 12:21:08 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvZ9-002Dd6-2G; Tue, 16 Aug 2022 12:21:07 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1CB1158040B;
	Tue, 16 Aug 2022 08:21:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 08:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660652461; x=1660659661; bh=6XLImf6D+u
	ceaDHdtwK+6f06L2Vn5a6E/RxhQgeCM3Q=; b=kexpck3CQZ0ElJThDTOQn44AzH
	8rR9jah9MWJU/TxAjZD3W5IdNrro8d3oe92deiJXvqX7ccuj0Zhl9rzStuw4KB/J
	1WzDxddqdMma54Ujb/j4ldVoBl1tmqWrtu/dOS2orS6opeEIlWc+4a3Fpzc2J4eN
	hzUV9oHihVAuMbIDL/bTMMCKIF9GKt9BD+G0vbzXnTV5msk2B0C4k7j+uvfy1G/f
	3ljZdqa0RXOVJYfuget5K31tpi1j/KokQBB4mLJkY5R4iTwu/6BZBzSPx5teuViE
	pUjiz2b+YukKvsNwW0lLgw7RZ59NIlZSQAvTvbz5EzR6JhopVseT581SnF3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660652461; x=1660659661; bh=6XLImf6D+uceaDHdtwK+6f06L2Vn
	5a6E/RxhQgeCM3Q=; b=RiG9AYB4Rh8oJH8nXRdnWyg1t8YNWMwRp+sCCYFHS43e
	ovLwo+W+rX2GTLM5PHUx+FmfE7VuI9padh5Clhf1WdBo+fYi/umQpjTQ3bOBK8lL
	zMKx75aSgPmoyPma/+DHD9V4RFym0Kne8Uzju3PvL1eeGz35Pp1H9/XBInor30U5
	1GnHyEyIzjSoBVZc6XaYj+1GOA4gH5LBY31eTfABPb/MlPCoKptGssDwnBDTx1qs
	UJzE2gjPGjQtU6gAHBmhz2vZ16JreGBOKXFGlCdwHiuldjyTYj3UyP1ER+7+C29P
	LEY/PxqQoAyNF9yS/jZqos+H8NzqEqFXg443pSa4lw==
X-ME-Sender: <xms:q4v7Ys6aP__5QCMFUO25bBV2G7JDvWby3ENM_fIs5yF_kPK9wOtDXg>
    <xme:q4v7Yt4ZCHVfcY9dhK9TP4oIWwsvVjjLwfmUabehVA02DQWzJdIz7w7FWwmDH6Cia
    wx9LmJ-Qzm1wV-Y97A>
X-ME-Received: <xmr:q4v7YrfPuG8yHdsiV1zoE1Cx1HGVTxHTLUMpAs_M2HK4GKdLjxyjjuyL7Bc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
    geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:q4v7YhJH5g-sSvIY6rkOl6DMIxeVtuoI_NjXdVZgmDrD7-sigy8lmQ>
    <xmx:q4v7YgIzwgWlPkY9C_SPaURJ0GIWUFAtE4lG8X88Gldi0kiFa06BRQ>
    <xmx:q4v7YiwgQjDuZo7g0n86ZxM797iVdPO59xB_iMSMrZbI16_rCP4cAw>
    <xmx:rYv7Yg400P-RBy5vHEPL_kEqm8A33uMzt14unJ6sJkk-EylfjyC3xA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 08:20:59 -0400 (EDT)
Date: Tue, 16 Aug 2022 14:20:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,	Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>,	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,	linux-sunxi@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 07/35] drm/modes: Only consider bpp and refresh before
 options
Message-ID: <20220816122056.w6suecaizdoss2sv@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
 <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_052103_416490_86DB3E95 
X-CRM114-Status: GOOD (  24.46  )
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
Content-Type: multipart/mixed; boundary="===============8327412780562450455=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8327412780562450455==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d5ua5726mqkqg3lm"
Content-Disposition: inline


--d5ua5726mqkqg3lm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thanks for your review

On Fri, Aug 12, 2022 at 03:25:39PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > Some video=3D options might have a value that contains a dash. However,=
 the
> > command line parsing mode considers all dashes as the separator between=
 the
> > mode and the bpp count.
> >
> > Let's rework the parsing code a bit to only consider a dash as the bpp
> > separator if it before a comma, the options separator.
> >
> > A follow-up patch will add a unit-test for this once such an option is
> > introduced.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Thanks for your patch!
>=20
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1819,20 +1819,22 @@ bool drm_mode_parse_command_line_for_connector(=
const char *mode_option,
> >
> >         name =3D mode_option;
> >
> > +       /* Locate the start of named options */
> > +       options_ptr =3D strchr(name, ',');
> > +       if (options_ptr)
> > +               options_off =3D options_ptr - name;
> > +       else
> > +               options_off =3D strlen(name);
> > +
> >         /* Try to locate the bpp and refresh specifiers, if any */
> > -       bpp_ptr =3D strchr(name, '-');
> > +       bpp_ptr =3D strnchr(name, options_off, '-');
>=20
> Probably you still want to add a check that the next character
> is actually a digit, cfr. my "[PATCH v2 5/5] drm/modes:
> parse_cmdline: Add support for named modes containing dashes"
> (https://lore.kernel.org/dri-devel/2eb205da88c3cb19ddf04d167ece4e16a33094=
8b.1657788997.git.geert@linux-m68k.org)?

I think your patch is orthogonal, and we should merge it anyway.

As a matter of fact, I initially wanted to do something similar but
bailed out to deal with PAL-M and so on. If there's such modes already,
then we should totally support it

Maxime

--d5ua5726mqkqg3lm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvuLqAAKCRDj7w1vZxhR
xS46AQCDoo68eNI5t/JZrITdAKWMGUwSBfFFuOU+V38x2GFqwQEA7EsamAC81DFp
NHD21FgHcTvgUUUJaJo5pResSbjL5g0=
=dh0z
-----END PGP SIGNATURE-----

--d5ua5726mqkqg3lm--


--===============8327412780562450455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8327412780562450455==--

