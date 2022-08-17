Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1375AC25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2Uanwg2Mv3hOXbpV5cbtNrcCmQI7w3V4kKowLv+DAQ=; b=C7jc1Qwkpk5ECHywtJ/nOLLrPb
	b1jKNe0fNC6zNcaYUpg3KuoLOWYbZtfH9PlZ2FHlWJq2rn+g6sSG3ksuZXHNn8kOYMW8EfES1rKiI
	jdgrmwDpQpBti3/c1ezHCxcqCr2eECseIZHSvYZgAbIV+KdGMShL9s/mwBoLYL5cdMsubf7VvZLr2
	UHUeaDZYrCIPF4anp4SdXSZck/O2d7NDt8SonDpHbqDLDAB9b8V0y9jtu7h6WEckxcWQyWNvFQWdF
	NmuojX/GcNRt17DIz0DZ191H6OUsjWHvy+kZoHyTJ+jAyxhG0a+1i2f27j/agLcenwRdgn2QEEVPf
	MUkHagRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODsT-00E30z-8e; Wed, 17 Aug 2022 07:54:13 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODsE-00E2US-Br; Wed, 17 Aug 2022 07:54:01 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id 75D7F2B0647A;
	Wed, 17 Aug 2022 03:53:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 17 Aug 2022 03:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660722834; x=1660730034; bh=H7AMF4kZE2
	hOLEr28TVkQrVEDPRpXPajEymRGpT0zuY=; b=VekMXPHqujdEVZpBIpN79E+lff
	1H4NFvjSrep9AFQbJUTuRXgh+NaV8q1zMs/5fTBGWFQG/nhnGjgxCZpTLcbaO2qk
	yVKq5W21fIJ9S0XmxRG1PwTEGV2zqCSbfuaiKrwDA8pZYKlXFxqbI033TvlvMnjl
	H4bqWQwFR4UD33MEt0/0htul9s0JX1UilhvUiJu+xr+sECciKyrjwITasOapHnkE
	t/oC9LFiNxRcylIgLbETNXkRy+xdOO6cATUoD3/J9M2TMDIvJYGZ7CSP/Zg9V81l
	X1yD9HhnGOU2lvRbVZhSUIjMteOIMlH7yR4KA7Pqf62rp6KvBAnvIUDWYbUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660722834; x=1660730034; bh=H7AMF4kZE2hOLEr28TVkQrVEDPRp
	XPajEymRGpT0zuY=; b=fM8BqqoCCmnHUEEV4QhP1Xvmbfp/msYYVT77ftKhx5IR
	29ftNAgDXPWu67vBjBfmHJqlUPQm0psZpTW41ELXNNaeApmxA46qI6EzN7NwGngn
	/OLMWHMeMYWIoW7BbhjcqECv9h4HWSks1q03kjR22NHiIIJOlD4y+OWv3HARgqQs
	w/kIz6HscEPj3PD944TsbMktD7Nbu9ZdLdSJVV7AtyFiIUorX2RZuyrCnYuQlypU
	7Fhz5gTgemp4FqiSIBcmVWy0Zr3veReOCjC0AxbsGRejUQcy436aC4pY0lv0m7Pu
	4s+SgpUdF/3g0q5BkxKzCfEl0HAD/34vZfmtuZq8Cw==
X-ME-Sender: <xms:kZ78YmU8KAGJLFcYMDQSS8pgZqxptw9N-PgMq1JOHfWOC4-oVrMGrQ>
    <xme:kZ78YimRdi_yVT8NngQEvi90JqKCrgtAk4XVX9oiLCsK9bFsWA1T1cCqkHIVSxMIE
    889tniyxK8bGRiulZY>
X-ME-Received: <xmr:kZ78Yqb8EhO8iXCsixF6nzx98hxId96DRgIqIl34ojgGbEtV8gL5lqbYmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
    fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kZ78YtUi_k-2n9qOML_KW-3BlyEf4zMTK8RPeLiYT8uvG94O6XLbDw>
    <xmx:kZ78Ygn3H3Fvzsbm3dQjc-U_RwYV1eqiO3X4OhcNtuOeUd5zc_r2sQ>
    <xmx:kZ78YifhwO143SUZ4cb2EPKMWXAQGmcJyNz9H_4sL21a2s80E4CSKA>
    <xmx:kp78YiVtdOHOoRRJiJOWnhBAJaV6sekXMscUNymMrAa9IAOesMH7WB3c7rA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 03:53:53 -0400 (EDT)
Date: Wed, 17 Aug 2022 09:53:51 +0200
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
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220817075351.4xpsqdngjgtiqvob@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_005358_485680_646C99E7 
X-CRM114-Status: GOOD (  34.13  )
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
Content-Type: multipart/mixed; boundary="===============8416914934882328675=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8416914934882328675==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctmqbrja2753ufff"
Content-Disposition: inline


--ctmqbrja2753ufff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 05:00:38PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > Multiple drivers (meson, vc4) define the analog TV 525-lines and 62=
5-lines
> > > > modes in the drivers.
> > >
> > > Nit: strictly speaking these are not analog modes, but the digital
> > > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> > > 13.5 MHz sampling frequency for pixels.
> > >
> > > In analog modes, the only discrete values are the number of lines, and
> > > the frame/field rate (fixing the horizontal sync rate when combined).
> > >
> > > The number of (in)visible pixels per line depends on the available
> > > bandwidth.  In a digital variant (which is anything generated by a
> > > digital computer system), the latter depends on the pixel clock, which
> > > can wildly differ from the 13.5 MHz used in the BT.656 standard. (e.g.
> > > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC)).
> > >
> > > So I think we probably need some way to generate a PAL/NTSC-compatible
> > > mode based not only on resolution, but also on pixel clock.
> >
> > This would also fix the comments made by Jani and Thomas, so I quite
> > like the idea of it.
> >
> > I'm struggling a bit to find how would could implement this though.
> >
> > From what you were saying, I guess the prototype would be something like
> >
> > struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_cloc=
k,
> >                                                 unsigned int lines,
> >                                                 unsigned int frame_rate)
> >
> > But I have zero idea on what the implementation would be. Do you have
> > some resources for this you could point me to?
>=20
> Horizontally, I think you should calculate left/right margins and
> hsync length to yield timings that match those for the BT.656 PAL/NTSC
> modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
> requested, you want to calculate left', right', and hslen' for
>=20
> | <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hslen' -=
-> |
>                         @ 14 MHz
>=20
> so they match the timings for left, right, and hslen for
>=20
> | <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hslen --=
-> |
>                         @ 13.5 MHz
>=20
> As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
> you want to make sure to align the center of the visible part.

So I guess in that example if we want to center it, left =3D=3D right and
left' =3D=3D right'? What about the sync length?

> Vertically, it's simpler, as the number of lines is discrete.
> You do have to take into account interlace and doublescan, and
> progressive modes with 262/312 lines.

So we only have to deal with 525 and 625 lines total (without taking
interlace and doublescan into account), right?

I guess we still have the same question, we probably want to center it,
so top =3D=3D bottom, but what about the vsync length?

Maxime

--ctmqbrja2753ufff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvyejwAKCRDj7w1vZxhR
xcu6AP93cHMTNRRfPsacynbiMt5NcO8eI/W3VyqQnewI23mFIQEA2IRU57HVlr7Q
XOvH5VN6C7Xaplea0Zs4gC+zyOmyLwo=
=MlUC
-----END PGP SIGNATURE-----

--ctmqbrja2753ufff--


--===============8416914934882328675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8416914934882328675==--

