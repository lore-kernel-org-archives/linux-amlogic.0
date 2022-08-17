Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00B9C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj01HtaIhBt5xwEluHshE699+G8JgEOzm2nxw8vFR3g=; b=uUyg+oBhb0oN71jJruC4rau+NS
	UqTX3iNKofo5RqbJAaAzzWv+jBjJ+FevqnT6PWrS0vc5iW4Z1+YRLRmZ1IEsmfbUBUfYeT8SA6dcT
	RbImZvOrjoiEKb1tvXZFlMdiKhPOUM0nVsIIbueVKDDCA8vfeOPbqTXe26wpUS/7ldaDs3TbjF4t7
	5s/94XqtAvumH3bj9eNA0hEI0xn6Fpd9VSw3fefC0OYGpp/sqJ9Tn7+9+VRskHOhzqwIX4EElykI0
	5dXzB8rkESAvv5TdhxP8golJOHXy2d/XiqCRE6t1mMba7rA3M4uvJne0hdtghj+FreLLTQ7DIxKgC
	Ge6AGBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOH0u-001FM6-VF; Wed, 17 Aug 2022 11:15:09 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOH0r-001F1L-Ra; Wed, 17 Aug 2022 11:15:07 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5E94E580DA3;
	Wed, 17 Aug 2022 07:15:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 07:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660734900; x=1660742100; bh=7/MyY+LBb7
	xbVEmhuCyBhoCzY/9cxkCFf1VHHVrX6CY=; b=grrDb7phnJ8YS7DoYmClhDowva
	mf0hyZG1cElbLmCByi9qZfwQST1mrUurzidSCbpXzLfvUzrbTrOQioCAKC7U2Fwp
	jm+jENEKf8Vy1T/MorGsNClgSxDglsVgGyCX7UfoFeVFnLOETgr0/p9hs3QB88dR
	sbSoRPnGd69728/P/mt+7Fh+vWebfjlS/I7UsqjhGtn17DbWdnP/EkpsYqbQNwVv
	WQtJ4vAXXBVssg+IMz+GS+lG3ddEwQCPDgiFnLFA9ysgfKqwRZXwt8UFyXWB1BS0
	kUzrjtDuamQLJjwF4qqcj5aFreTij0nTlG0h1GIxKPYZ2AhmjLEmwgoC2u/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660734900; x=1660742100; bh=7/MyY+LBb7xbVEmhuCyBhoCzY/9c
	xkCFf1VHHVrX6CY=; b=1EjiYV1IDT9sKd5r3mLzkdKwMFMlonp4bEctBDecRUya
	ZlpnqtUdldGetHD37riEiUUvZGlMEqu124iAqLMJ5iN2ONf2abY5VWp06pRbQ+/6
	6W4ZKgtun/ru5zgTMT/ePki4t9Z1FsEfCzHeI5zEz+PrbhaFCGLsggAXU5MVBu5U
	+FwyikIohL0SBGOuk1IfHbASHFnJCiOCRnZThfHbBprg6joaAp7F8MNh+k1pj/jf
	DyTXjPYwQFQehxwbJdfXESh1FquX9og/rEOuQMKCTlBFZrFevsqr6cgA4gaTkM4X
	WlmugzAHmc7tzr6NIUDl6X9UGByCvf/IOiJ6IMjRHQ==
X-ME-Sender: <xms:ss38Ymz6QIJVROnLxmIjqn_3TMnD9ZLFHefJCfGNyBCHaTEh0d9E8A>
    <xme:ss38YiTELaLWGqYanHfSD6VWKyMUjfqc07lsrLPsN3Xf25xqqj0yBtjUnChpOnajr
    92MoarTmCFXFjH7m0g>
X-ME-Received: <xmr:ss38YoUzRSzcuNOADkP7kR5ntYkzbd9ylNolSoNBKiyDhA78E3ttDGbQ-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ss38YsjZPx_G1Zc8tP9aygClJLiL_P6juc2jFveN0GQgc0P9nQkhuw>
    <xmx:ss38YoAufRzR7_QR2U-zba1HO11VCExDDNMadtbPaaWeyOFbRlviRA>
    <xmx:ss38YtJo-vfEDw0s84F9ypKZ1-0zVXkz8garCQi-_Nfg8XoGqLnY2A>
    <xmx:tM38Yqy6P1AyJ75RZnKbU9oqLErBbDheLyu7DSvqoX3-T7Z68V_Beg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:14:57 -0400 (EDT)
Date: Wed, 17 Aug 2022 13:14:54 +0200
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
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220817111454.pn2iltvyo2drebq7@houat>
References: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat>
 <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
 <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_041506_329774_7A469DB6 
X-CRM114-Status: GOOD (  27.11  )
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
Content-Type: multipart/mixed; boundary="===============5120202798610788889=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5120202798610788889==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gu5whptxg6eujuan"
Content-Disposition: inline


--gu5whptxg6eujuan
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd=
720p60"), or
> > > > > > > > > handle them through "@<refresh>".  The latter would impac=
t "[PATCH v1
> > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate =
function", as
> > > > > > > > > currently a named mode and a refresh rate can't be specif=
ied both.
> > > > > > > >
> > > > > > > > I think the former would make more sense. It simplifies a b=
it the
> > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > >
> > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode pro=
perty as a
> > > > > > > > > command-line option" uses a separate "tv_mode" option, an=
d not the main
> > > > > > > > > mode name, I think you want to add them here.
> > > > > > > >
> > > > > > > > It's a separate story I think, we could have a named mode h=
d720p50,
> > > > > > > > which would be equivalent to 1280x720,tv_mode=3Dhd720p
> > > > > > >
> > > > > > > So where's the field rate in "1280x720,tv_mode=3Dhd720p"?
> > > > > >
> > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=3Dhd720p
> > > > >
> > > > > Above you said "I think the former would make more sense", so that
> > > > > should be "1280x720,tv_mode=3Dhd720p50"?
> > > >
> > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=3D=
hd720p
> > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=3Dhd720p
> > >
> > > I disagree: hd720p50 and hd720p60 are different TV modes.
> >
> > I agree, and I don't see how that command-line doesn't express that?
>=20
> Oh, I see what you mean: yes, it expresses that.
> But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> where the TV mode specifies both number of lines and frame rate.

Only if we're using a named mode, and naming is hard :)

Honestly, I'd be inclined to drop the hd* for now from this series. I
don't have a hardware to test it with, for some we don't even have
drivers that could implement these modes, we don't have a spec to work
=66rom, it looks like a recipe for failure :)

Maxime

--gu5whptxg6eujuan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvzNrgAKCRDj7w1vZxhR
xZPiAP9cuj5zZR8NRJHbKfFO0mr9fc31dj4wR+Gpelf6U7ZzwQEAvGoAg1Oi6hb0
Hui+aaNLN6Rq3Vi1HR7q65YsP3trIwM=
=i1o+
-----END PGP SIGNATURE-----

--gu5whptxg6eujuan--


--===============5120202798610788889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5120202798610788889==--

