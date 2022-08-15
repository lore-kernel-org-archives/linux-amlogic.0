Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D65C25B0E
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZZv1ROQNIHPbFGydWY4QfaMgOi2BEIiSNCG4ExG1Ao=; b=r8sxXdhcGyUHGhIyFVYg4SsTJ3
	oMRRWsn9OXfQhAcN2i7Jnd7Qe+5CtXhTcjAePtSqmHq1QbXiyV5hmISCQoIQvYihFktil7CUL9Cog
	bKv82wxkqzHqJPAJIUdKeuMdFAlHyvqQfa29df3XwXfHgsjTbO8yE+Ja1Bj/54i02qdDfqyLJm1og
	vKXSbze/ouGZ27wcMj8IN6MUu/UwneYeriM3SLHnrAw65dtzT8RRTC4PmILEs3HAsBZKahxGYSRCz
	h4Hhmy5iBY/8tjPGB++RkhuWfI4YduWlvofjFF7hb6NrDcOBIeHrWM8jlxYu/CUnqW8jlBqninaaF
	mw2dHrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVcC-00DH2T-Rm; Mon, 15 Aug 2022 08:38:28 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVat-00DGF9-QJ; Mon, 15 Aug 2022 08:37:59 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id D88AC580384;
	Mon, 15 Aug 2022 04:37:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 04:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660552626; x=1660559826; bh=oAuXuNlgNL
	w6WNYkkip9f54ivuwSvAVKETMQ5321nLw=; b=JtvTKO088RLfabk/+DMxHb16VK
	n3/KKHJWzmmylfv22KyKsZ2IgQoRY1mQGHOjbIkDa1hNaGvxxgdqisxgc3yjaXdF
	Ebuj615E6/OcnTUSpE5NE6yGsFTuaQ80s0FJv5sMjks/2QdnyRRLACOjujWff5Gz
	Yp+G5AYS1+lG2uu2pqZdHL4pPdXJi3/9dzozjs/ZWXmrlXfbx5SdkNaJis5Q5atw
	UQg/i1i7jCWokrsynR/TqH27lVcS90dLabBKuzrtzLFfCm4/vL9Nu7uYF/zCFHza
	i58/kNh1OhORKfQLCIfASYZ6wK0D1xrRxcdYQmM3ORVR0LXZEMVELsLToRqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660552626; x=1660559826; bh=oAuXuNlgNLw6WNYkkip9f54ivuwS
	vAVKETMQ5321nLw=; b=Jn9Qv8Syu8SeSEzUuzwQwjjDH/H6Vy35jlCSGm/j3HYW
	Lg6orKUGZDBdRoyA/L9Oe8UzwD+9anbe9dpwHfcxBpY8yWLJiQVicnycxzAcmRYP
	2b8Ek8R4bvcU7wpqJxF+LepddhIG3IyubJBFGekHIfKzuvGlKw0bYeNVPWtXPDYN
	rD7cL3SlfPv0kcVHXXrn3loLvtMuB58GuQgOE8aSXh+5CMBRa5GWsaXzgf+M/3uj
	0RFuY32Gh1D+PkvX4fHhh67/ShwzOfKs1Hrx+oxia2bWp0ru0Ye7yKDz24F7wgrQ
	cGE1rixPIb+59RLBshr88h9e2hentsFI5G5ISL/1/Q==
X-ME-Sender: <xms:sAX6YmovB4nAPnBdgQJ_xAaPW0cvNwV21QeAr1xQu_0jefTgBA3Hxw>
    <xme:sAX6YkqIVraw_jqADezR2U3FY1bYJuMeCNARQblF7ehFb96LWKX_AnEM4ngYYFCLv
    OpFPSCuWXD67qIqJ04>
X-ME-Received: <xmr:sAX6YrPb4ig8h2Jbzj783uvoBiREr8hLDfTmnnVocqw8F3Bb0kOMjaVlH3Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefgueeutdefgfevveehjeefgeehvdejjeefheekffduteeutdfgieeiieff
    uedtffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
    tghh
X-ME-Proxy: <xmx:sAX6Yl7J4UEUz-h4ZjuHDS57M2HIS5ub49-CTrcDS6zdF9lYtOzDqQ>
    <xmx:sAX6Yl71-EpBEfkuWCx2lB9xRhRuc1PiIuMRQL7Zix8nhwN8atXcUA>
    <xmx:sAX6YliJAdAgpBX12Iw5w7-7AnALYEkNmRhM5Cd4WXf74TNzde8r4Q>
    <xmx:sgX6YqpGarFWfdUppvtESPvzVQyJbRrXPbr71F_eKxrF5spRqzMrfw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 04:37:04 -0400 (EDT)
Date: Mon, 15 Aug 2022 10:37:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
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
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 24/35] drm/vc4: vec: Add support for more analog TV
 standards
Message-ID: <20220815083702.ipcmdwzkh2fxvdp7@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-24-3d53ae722097@cerno.tech>
 <0e7bebe2-3f45-0a1b-a4b6-bb783f8de7b6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0e7bebe2-3f45-0a1b-a4b6-bb783f8de7b6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_013708_593338_72374A70 
X-CRM114-Status: GOOD (  18.30  )
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
Content-Type: multipart/mixed; boundary="===============3795224239783583801=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3795224239783583801==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xit2556wzwnf3mna"
Content-Disposition: inline


--xit2556wzwnf3mna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 29, 2022 at 07:55:30PM +0200, Mateusz Kwiatkowski wrote:
> Hi Maxime,
>=20
> I think that declaring PAL-B and SECAM-B as the only supported 576i
> norms is a bit random.

Starting with this patch, PAL-N should be supported as well, right?

> Norms B, D, G, H, I, K, K1 and L (for both PAL and SECAM) are
> essentially identical if we're talking about baseband signals, AFAIK
> they only differ when those are modulated as RF signals. I'm not sure
> if there's a point to differentiating those (that's more about patch
> 05/35) unless we need to deal with some device that actually features
> an RF modulator.

What I was aiming for is to have all the cases we have in all the
drivers covered so that we can make that property generic. i915
declares and uses all those variants:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display=
/intel_sdvo.c#L68

Especially since it's i915 and it's pretty much the standard as far as
the uAPI goes, I'd rather avoid any regression there.

> But if we do want to have all those norms separate, then I'd say that
> VC4 should declare support for all of those, and all should map to the
> same VEC settings. Some users from e.g. the UK might think that they
> won't get proper picture if PAL-I is not on the list of supported
> norms. Same goes for e.g. SECAM-D/K in the former Soviet territories,
> and so on.

I'd be open to it, but we can always extend vc4 to support those modes
later on. The work you did to make that easier should make it trivial.

Maxime

--xit2556wzwnf3mna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvoFrgAKCRDj7w1vZxhR
xZnyAP9jXpEvF2lUxvex7zTOvooUq38MKs/KI6lRaxdYOVThegEA6BfLk9GnTPKE
2NpP3lugt4OQILqB7O/cIIoIU2hkxwI=
=X9DV
-----END PGP SIGNATURE-----

--xit2556wzwnf3mna--


--===============3795224239783583801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3795224239783583801==--

