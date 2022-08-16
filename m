Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD811C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2J6MJiiTFUo3DphS0mcNxoqmHUXfrqZfSdx1ku6TiU=; b=rOK692T/aMcVBvo6XWzjTYmR27
	RStk8zKVI3+UaXrvT5Ct6bU+fljNPTjxdacmxPL9qfMljk1ANSmE33k8/kUX7bDZW+R441uWidWjm
	r9r5Buu32wPnmfj0KdovFf8eis//+YMGBJPqQ6caCKqcKzwojw/y4YrALwT+k8rahBin6kyWJAyoh
	uXjhBVPtSZyGsyBHfcfg43qnRL7DWwNUnFzmKui4dIkSNhD3831lZE+nv8hxNxdgl5wG+hX2zXSjt
	DBsJSfJzHEHpWRgblBo0Yw0TrdM0YPjGiVkwWpca/VUw19/r3gCFuYfH+TdxGcG30SyXfiKewMjY0
	RoSF/pUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNwtv-0031Ll-7j; Tue, 16 Aug 2022 13:46:35 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNwto-0031Ic-Un; Tue, 16 Aug 2022 13:46:32 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id CF7A85803B8;
	Tue, 16 Aug 2022 09:46:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Aug 2022 09:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660657587; x=1660664787; bh=gHbL+MytjJ
	sZvOVGVzDN1GM9hKYjC7rxGk40WyTKaIo=; b=g5XU3Y09Fp0m6twECmjiDPgoD8
	SlSF+LAfJbkef44m7fWMWdW6HV2pS8Rl6yMS4aqsH+reDeg0xYhJpkyl06HlSiGS
	NhkqwOPuDcU5X5mmwbKdFkJSLfL3xMUbf1VSrJij1t1lgyNtXf4d3JaAEK1djaHV
	955s/W/wAZCpzb/9Dma0gBHmULtU7/xrZL49O6Sp0gQcze1wdeHTgqmhWEurWo86
	CHU43FOJBFSeXSfJftsTiUJx+aHQm5s1GJSuQYoE43+LVuQnW1WzOkmmGyBSOTmm
	FdcDkO+sLNBuPxXgd1oHCa0Z01GatPcRdW5mlyldKfx9mnTSDbuvYIWrZYwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660657587; x=1660664787; bh=gHbL+MytjJsZvOVGVzDN1GM9hKYj
	C7rxGk40WyTKaIo=; b=kmAgyWxk9CRWsdlOPMowrQ81I+xu32+X9sXWngkrs64D
	SpOvcWAlxbw4Z7Ks4uXYyMx5fSC0RmtNSYud9WV7FPvtPCdlXlRCwWUXW8mJVN1G
	RmUrd8KXTue9ZVbBDHQXUwylRMHzD4wm0u60mUJ+imY8cTogoOd734xD19lkT/LJ
	KX8tO6ikVBnZSRUERu3BcC7LJ6/Ux9czDptrE4aGzhssG7V3TWFjaeufH9waKDyN
	SeXuuL4AGKV2dr03uawgCjnZL6ltWaXMrMs1StJtc5ATl112Gbz+Hth1PAp4J3pl
	8r+eaBxJ3JQvPIuuyo2otHLpBAhF80CIdzeSgYQiLA==
X-ME-Sender: <xms:s5_7YqzzZQoAWUgz1kfH2ymHepyDm213uAckzgqFSzuMaMENVi6OvA>
    <xme:s5_7YmRk2xhRYIKNBPL4rKPaaDGM-WL0mlsQMugX_AJhMl-ZzxSU2uvV2BgqwcnOJ
    NyWuvY05qtQfyjYOzg>
X-ME-Received: <xmr:s5_7YsXuK-3JVFMmyMVM2XGYJzmQJN3e8iWhTp0eTeEZkQ8npxP1GXZaUoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
    geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:s5_7YggUuaxFesnjbcsrU2LUladhr5kLaWWzL5KaGVvRylgv9wHsYg>
    <xmx:s5_7YsB7cHZfSR07JuLU_cnuM3OwfsClKgn7QiX8wWN4CQE6hYD60w>
    <xmx:s5_7YhLN-ZJinuVFhhhltyU-kp6lbX_ruN80INBF1QvhJvew5W1rVQ>
    <xmx:s5_7YuxTmg5yDXXc4a6DbirShoBajE24XWu7p0WiFGAumrChOuVWbg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 09:46:26 -0400 (EDT)
Date: Tue, 16 Aug 2022 15:46:24 +0200
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
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
Message-ID: <20220816134624.cmb5s6i6pkdhu3qj@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
 <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_064629_159024_66A0DE74 
X-CRM114-Status: GOOD (  23.45  )
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
Content-Type: multipart/mixed; boundary="===============8101561173150648128=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8101561173150648128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xbotrfh2f6jawwvu"
Content-Disposition: inline


--xbotrfh2f6jawwvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2022 at 03:27:17PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > The current construction of the named mode parsing doesn't allow to ext=
end
> > it easily. Let's move it to a separate function so we can add more
> > parameters and modes.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
> drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
> (https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200=
bb.1657788997.git.geert@linux-m68k.org
> ;-)

Indeed, I forgot about that one, sorry :/

I think I'd still prefer to have the check for refresh + named mode
outside of the function, since I see them as an "integration" issue, not
a parsing one.

It's not the named mode parsing that fails, but the fact that we both
have a valid refresh and a valid named mode.

>=20
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitel=
ist[] =3D {
> >         "PAL",
> >  };
> >
> > +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> > +                                             unsigned int name_end,
> > +                                             struct drm_cmdline_mode *=
cmdline_mode)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> > +               int ret;
> > +
> > +               ret =3D str_has_prefix(name, drm_named_modes_whitelist[=
i]);
> > +               if (ret !=3D name_end)
> > +                       continue;
> > +
> > +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]=
);
> > +               cmdline_mode->specified =3D true;
> > +
> > +               return true;
> > +       }
> > +
> > +       return false;
>=20
> What's the point in returning a value, if it is never checked?
> Just make this function return void?

Yeah, it's something I went back and forth to between the dev, and it's
an artifact.

I'll drop that patch, take your version and move the refresh check to
drm_mode_parse_command_line_for_connector if that's alright for you?

Maxime

--xbotrfh2f6jawwvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvufsAAKCRDj7w1vZxhR
xRvYAP9DR7LzVwd0ITVjjsOrO+BQ9andM/0A4P6qCsx/ywFipQEA+bV9F+NyoFUN
oNXdDnnG7g+hOqMsx28nmzB45wcO6w0=
=uJzR
-----END PGP SIGNATURE-----

--xbotrfh2f6jawwvu--


--===============8101561173150648128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8101561173150648128==--

