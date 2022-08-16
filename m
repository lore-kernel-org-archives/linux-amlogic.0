Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B45C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9ph86sEEJwLmUVeZDWILKSlWZPqP0Dz40Un5AZ0X+M=; b=ec/y1cmKrwzVYxMui4PpCw2SEb
	3ht55r+NU/UDBKmIrhlifbFusqeDYAJro229QVjmyH/AlPQxaIHp8HhdTv0Ua8llACU2vuilsEDX9
	PbdEGWvLzdHYnLnCnNpav1HCeCoJKIxY8x/Bu3WDz03xAuOBV4b20u0MPpmAXYP3jX20h+WIjNh3T
	O9O5b3IkEaPcldbhFGV+r295rKm2UtmfOLWyNq/t9aNtMKJ19dPcTaOd/bT60de8h0/v2Oat12GdY
	dR/aB4pZNN6dLsLkNtFuTXOZIF8IjNLMTDbM+BQPDIC1wCJrfGW50mqKfx5MBShsUNj6JUzRS6ueX
	Fvx4Nymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNwgs-002tFG-Cs; Tue, 16 Aug 2022 13:33:06 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNwaj-002ptd-PE; Tue, 16 Aug 2022 13:26:47 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 5CE8E5803AB;
	Tue, 16 Aug 2022 09:26:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 09:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660656400; x=1660663600; bh=6KRBUJsiPT
	0Yqq99Qd4HjijhehzFziPzaGTFO/r87og=; b=QVKXFUaEMpeOCZt8CPmRhhx4jD
	n3HREMCFZowMzY7fllUlDBLcOFgCk5+QnKChBKXWzj4AEqHu+UW9YmfiRMf1JPLY
	tnO8lVKSmY5GOZOKcu9vHCq/RxCTZ/djiE3/o1CRLDd6pG/DWZLUcsEWD3MZH+rn
	KGJUAZyv8MdVGcfJQF5Jz/hfTaTIb8aW1PjLZ72Zpjf1hylipdcBvOLHSSnFxMdv
	2S7TOiToRua6xc+y+DD4OqVGOGbXZDkaRkYHK2K90YJl4HHbGy4YRwHiOVamT9XW
	nSQ8vjTaLT4xEbqWlKUenfk7G0i77ur8LuIEhrmB5Za1tZqqtATUU6e5ofrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660656400; x=1660663600; bh=6KRBUJsiPT0Yqq99Qd4HjijhehzF
	ziPzaGTFO/r87og=; b=rnH/F/tbCVxd66ER/LqD/NI4fMt6jCC3HQiaoXe71MDc
	fsRO2/lydPWAf9mff+RtOR4aFE2xbHRVN2ixQHawqdcfRQ8RaPuz558KXzcgLwxC
	vT4s0tPlOYXTG7a8/UkuLHbghD3YUHJIUnhBtDlTjIJqjxamY0/lUycST5KHtTSF
	MlgqPz5dZdUNX6h1YlKpywhhPqPhh8c0N4jU49vhU30WVT7NVU5sAbR0P1rRtVej
	9OfivJneRSU0bVxKyA6vyjL5HugfpAfAsEBu6vG2OMWWIUgbznauiENtLblN0geb
	sG/Q8XjvXl0V8vW+UXiSfWErbVqF4Fpg6QIiLt0JBw==
X-ME-Sender: <xms:D5v7Yl5sepc90rtkcN8Yxvc9t2Igtf_8EBHb3rdn6367DTXFlg13fg>
    <xme:D5v7Yi60Gi8sTwlranKbbR8CL2rTkixR0SauL1HcDwQ2myzVJ9ZsAHn8ntWlUe9Sm
    1l7oLSYPlJYMgAIg7c>
X-ME-Received: <xmr:D5v7YsdjCAJOQTAnxGMmx7gHnjGYQnxRiGfr6XR5O-wNXGhEFGkXY_UM9F8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:D5v7YuKxjjm6qEV4PpTQNDTztJSQiMStlJW4xKB9WgCmhZE8_9CAug>
    <xmx:D5v7YpKNLuqNCov24bFcAUOxC5qko_CWES6lgkh4XFeRv4Tnu2gglg>
    <xmx:D5v7YnwPgig-ip10xUAcx4onXCfpOKapSef7CM_M_Mlffmrbnh_2lA>
    <xmx:EJv7Yp4NI_C7Ds6uBTK2Hnu5t-cLN6sdVeSktkmVT39y0nOKgTkXOQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 09:26:39 -0400 (EDT)
Date: Tue, 16 Aug 2022 15:26:36 +0200
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
Message-ID: <20220816132636.3tmwqmrox64pu3lt@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_062645_946751_27639DFC 
X-CRM114-Status: GOOD (  20.70  )
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
Content-Type: multipart/mixed; boundary="===============1856696413608986854=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1856696413608986854==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tlrvphkdkfvwysw"
Content-Disposition: inline


--2tlrvphkdkfvwysw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> Thanks for your patch!
>=20
> On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-li=
nes
> > modes in the drivers.
>=20
> Nit: strictly speaking these are not analog modes, but the digital
> variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> 13.5 MHz sampling frequency for pixels.
>=20
> In analog modes, the only discrete values are the number of lines, and
> the frame/field rate (fixing the horizontal sync rate when combined).
>=20
> The number of (in)visible pixels per line depends on the available
> bandwidth.  In a digital variant (which is anything generated by a
> digital computer system), the latter depends on the pixel clock, which
> can wildly differ from the 13.5 MHz used in the BT.656 standard. (e.g.
> Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC)).
>=20
> So I think we probably need some way to generate a PAL/NTSC-compatible
> mode based not only on resolution, but also on pixel clock.

This would also fix the comments made by Jani and Thomas, so I quite
like the idea of it.

I'm struggling a bit to find how would could implement this though.

=46rom what you were saying, I guess the prototype would be something like

struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_clock,
       						unsigned int lines,
						unsigned int frame_rate)

But I have zero idea on what the implementation would be. Do you have
some resources for this you could point me to?

Thanks
Maxime

--2tlrvphkdkfvwysw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvubDAAKCRDj7w1vZxhR
xZZ+AP0f5hhgfzUf7q/FEIjfZQKIV6tN7iJX9ovg2oPpWOy6wAEA1rruwJYSqo6M
knKWWD6nHN4r5wgC+HL9aAySp8ehvwE=
=PTwU
-----END PGP SIGNATURE-----

--2tlrvphkdkfvwysw--


--===============1856696413608986854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1856696413608986854==--

