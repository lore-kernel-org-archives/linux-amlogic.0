Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF57C2BB41
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiII30YVitt2kascN0zfVzdwkxJrbly97Lo324uNf9Y=; b=dpLj+kYs56UJkjY8v8T+s2zgbn
	ww5+4JK9MCCYy57lB4jWpPCVmNvqcQdlq6I281MjUGnWlVgwA0uPUkh+viZRe+MP70RcWnf/Ofwqz
	adJfxdtVqcnoI1tG71egxsuWrFAUYpSbGlCvAoOuZsfCBizJKbRUf8OzIwJ9Zua0IJfmNyiLDYp9k
	BgPV8pykNLOJu92n3d94bLWtpCQ1FT7OOt8T3I8l0vyDEcq7QvSDBHjiIaZuyDRab7BoP23m/JweP
	9wA3S4QbOIx1IXQEha4c+cMqMaalBezUGX1S+OYkj1Inb3lJdf5yRiGh479HFzpIzFTZ2Vhx1h4g9
	Lt734wNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNtCb-000UJ1-Ku; Tue, 16 Aug 2022 09:49:37 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNtCY-000UEP-KP; Tue, 16 Aug 2022 09:49:36 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id B14432B059FF;
	Tue, 16 Aug 2022 05:49:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 16 Aug 2022 05:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660643366; x=1660650566; bh=LDg0F/tdWm
	uuX+5Y52zO8Sqcm7DQL0YcyaqGkQk8adc=; b=GPpFjSOrwZxIYxYGAXsZL6mHjD
	WbjU9v6Cap1kKGhAEqkg57BIGNOPRu2hyTIbMt7feU6DsQpypdeWuoTEyC/buFjX
	rk2MONDaPv9NB3Ig+QokHa5oA98ZpWJoXyFA2tcQfUcu5t+1S+oedTww0kKzo7NU
	yaPmk8EUfi4c2+xNI0YjM1CXGv22lWemlWZl8x5QSycKGykmDH13U0fI3PDII043
	YpYk8UEsy4wk741tnCqA/AvXdH8FUCixrYVSLAe5BpFwv1Fcrvhf/8diiRG5Eu8x
	otMOeoTcNjVRrlmwMvQ5K4xRMgRq1TphmgdkW6PUa8eeezdDTJy7rz/q1Rwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660643366; x=1660650566; bh=LDg0F/tdWmuuX+5Y52zO8Sqcm7DQ
	L0YcyaqGkQk8adc=; b=3Ax3i/frWA1OJ/WVrRDv96/pDYIOq+xB3sBoWFdH93O/
	d+E8N3D5uiix0u5hIsoOzu1B6xy1iuXInlcuUTOQwWfP4rghbaotNkEukW6wnxZz
	3zNWdBo34rrVe2jpV7L+epwEr0ke9uBhMVc3Hh069JCweIrJuRPkMu0ecjkTisvI
	RE4hGsBf5hCU1rE2ChO8nndii3HbsP2eMrL8ty45mv/HhGxkftE/RJUS18iP9QnX
	G6+f6O2nisM/yWvQ19b+sAuJDAMHaskW1WkltLGBUhmrJJ4kPHuqe2so1lLne4XI
	vIE45/4Q+Wc6+MMPDs5WPDbVOWzvXD2mL13r0G6i+A==
X-ME-Sender: <xms:JWj7YmJ2NdSrJApiuS_qsqrvR7DFDeJm9787V7XliSkuq9hHJuVKBw>
    <xme:JWj7YuKPbclW3rHsThJRK-7jLiV_b3I5zfTpWR4g-AnfNzzd6hxjr_cJgTycWkxsp
    VYY8lmhggu0WbWScJY>
X-ME-Received: <xmr:JWj7Ymuno8rq01Nb1Z8-oyF0Irh3B8eOgkhXeL7ahfp9kVf2ihQgcEDCD0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedukeevvdehheeuhefhhfefteeiffefgeffuefgkeetffevgeevgeejteei
    gffghfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
    ohdrthgvtghh
X-ME-Proxy: <xmx:JWj7YrbWn7UHWJgGfNxx5L3ZSRi_2z9w7seKrmSh0e-w89WzmrAYIA>
    <xmx:JWj7YtazAfBfmbhzLNpiqYbkr7bdx71dbJowYgq8817v2UYa5dqsNw>
    <xmx:JWj7YnByepaGyImxjUck4n1YplQ2s7xp7VgiN2rXgIAcWX7lvHGMUA>
    <xmx:Jmj7YqJp35QTIMSU1Q05bl9u74Ce-NNm75OwDKsOOSwtg18qO_VHALNIk_s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 05:49:24 -0400 (EDT)
Date: Tue, 16 Aug 2022 11:49:22 +0200
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
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220816094922.oqhrhefv327zo2ou@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_024934_727283_325FB6A5 
X-CRM114-Status: GOOD (  35.20  )
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
Content-Type: multipart/mixed; boundary="===============2805411682490581835=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2805411682490581835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wxlquavc6w2uimy2"
Content-Disposition: inline


--wxlquavc6w2uimy2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 16.08.2022 10.26, skrev Maxime Ripard:
> > Hi,
> >=20
> > On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>> The TV mode property has been around for a while now to select and ge=
t the
> >>> current TV mode output on an analog TV connector.
> >>>
> >>> Despite that property name being generic, its content isn't and has b=
een
> >>> driver-specific which makes it hard to build any generic behaviour on=
 top
> >>> of it, both in kernel and user-space.
> >>>
> >>> Let's create a new bitmask tv norm property, that can contain any of =
the
> >>> analog TV standards currently supported by kernel drivers. Each drive=
r can
> >>> then pass in a bitmask of the modes it supports.
> >>>
> >>> We'll then be able to phase out the older tv mode property.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>
> >>
> >> Please also update Documentation/gpu/kms-properties.csv
> >>
> >> Requirements for adding a new property is found in
> >> Documentation/gpu/drm-kms.rst
> >=20
> > I knew this was going to be raised at some point, so I'm glad it's that
> > early :)
> >=20
> > I really don't know what to do there. If we stick by our usual rules,
> > then we can't have any of that work merged.
> >=20
> > However, I think the status quo is not really satisfactory either.
> > Indeed, we have a property, that doesn't follow those requirements
> > either, with a driver-specific content, and that stands in the way of
> > fixes and further improvements at both the core framework and driver
> > levels.
> >=20
> > So having that new property still seems like a net improvement at the
> > driver, framework and uAPI levels, even if it's not entirely following
> > the requirements we have in place.
> >=20
> > Even more so since, realistically, those kind of interfaces will never
> > get any new development on the user-space side of things, it's
> > considered by everyone as legacy.
> >=20
> > This also is something we need to support at some point if we want to
> > completely deprecate the fbdev drivers and provide decent alternatives
> > in KMS.
> >=20
> > So yeah, strictly speaking, we would not qualify for our requirements
> > there. I still think we have a strong case for an exception though.
>
> Which requirements would that be? The only one I can see is the
> documentation and maybe an IGT test.

This is the one I had in mind
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements

I overlooked yours obviously, so I'll update my patches to fix it.

Maxime

--wxlquavc6w2uimy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvtoIgAKCRDj7w1vZxhR
xdmCAP0TxNLQ337aCmZF1DrZ9PxgyCBlNhBMtaDX8zJsaRfqJgD+Kw7tZK+ncFk4
xnge3+28RfIGi25dtfBBzpr7m1dc6QA=
=aMK2
-----END PGP SIGNATURE-----

--wxlquavc6w2uimy2--


--===============2805411682490581835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2805411682490581835==--

