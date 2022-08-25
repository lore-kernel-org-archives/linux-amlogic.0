Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A03C28D13
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebsAQZ3yaV0grZQqHMiXsQJEyxFTcjnXWSUH+uzy+4E=; b=Y/RnRP+jNpLiVdMLBSXZAOLNrP
	nqu6z9tVxlxP/yfqvkjc3XAR1Kbx4clB+wHPfQGpP61GS/dOD21UjLRJ7yTObd89Q43JYhXiMqE1e
	0t/l0Uu1H8WQbug6bFgNZLMz34aAmiONpwujrQoLvFHu/3rN2M7K2OJsrrSjskmSiyaptLfnSO9gD
	L5GBdDTGmqWx/LbiaeC7G40uY1YT6+oa6fIQxinhHlHGABiMoko0HGHvhwfj2W33XwSOHJaDZKnZn
	PdnCIzO1gMz1XxCoh8sPfIWYqmYk+pwWgcfrlmO0tVDXYC7d08lrBn2/9D9ZM5fZMlCT6Lqqh0o0p
	nH4ACP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRDAR-00EzJ3-Ml; Thu, 25 Aug 2022 13:45:07 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD9Z-00EyUc-4c; Thu, 25 Aug 2022 13:44:14 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 19B495801FA;
	Thu, 25 Aug 2022 09:44:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 25 Aug 2022 09:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1661435052; x=1661442252; bh=AjAS+mxokB
	mADly8X+bwM1z4OrzJr2RjjjUhIDL33q8=; b=aBX2Pd5RY+tOBxJp7Q9Kg9QlAE
	xXlvpoCjmRubOY7P6I+BHGd97QgDL2AVDpf/PUw0n7ySzAAszNwsNCpT3/6eJzEW
	ZBFbOi70av8ROP3lP1CdNz7yZvvHR/yrhtbwEMZXtNh1HL3cI89A8wGRa9C3E9UV
	A+c4wlyqASoo87i0QjufCH7CVRVRSRpTF4nNZ+0z8qGhWYKmg0+XYW0ib5ztTETf
	xuwCqRc6LcdjmDg3dNjTRco2xb/pl71VGwBtufxCc+xvEUJIhri0VnpUdOWsAqo7
	mhYCwDVlz5GLR452UO+zMhnOwRTjRxovWcbVEQ9qzK6llfkPNdv4zxVP50SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661435052; x=1661442252; bh=AjAS+mxokBmADly8X+bwM1z4OrzJ
	r2RjjjUhIDL33q8=; b=wbLRi+/MnqRVf8XYD5hMxddwmSfrpNixFPg+0EmqSYBx
	jwROxs3/NjSL4LioG7sMaH+N8R/T1ro+6MeZQhmS/n89Q/3oJvLaXlNTeOANhQYk
	W6i066GwHdY+6za9liIVlBS/mMTKwUJ1LVKqRc24ThfkFz4zMBCsNU6xG4okTCZj
	YEXbQS0vrV4RKuYPBM0zprcS2is85jC2ukDCfYhR0kK7Ci75uG10EPLAzpz1TczY
	IyS3ORjSCMDrsJNgVegd7cn6gWbb4OlQlwBobnbEIt9Wo5ghJpCHAuM/FaSTEeen
	BqUrteGdd4JGYA9bRf2PwsmPhm2ZQTF1aKqCLfAkvA==
X-ME-Sender: <xms:q3wHYwJEFPKwRD-bJ0WNXQpQ6u0YGXCm5ZZAHqJAbi145PikINxAlw>
    <xme:q3wHYwLdiP1ka_ZE7YIIi9kgJ_cUq0KUIcUngIQW9aUxkAVprI2YOaS0NAaO1vNIv
    0HUL2DMMQ5V3h-Hhxs>
X-ME-Received: <xmr:q3wHYws-Dltmw0Gwp92UWSQjXICrzHSGC5rZK5B0Dvbc7RqFM0P7kaZ1mIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
    ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q3wHY9a41ZGeJtSzfcaj6aGoJPhwlf8ciS6VwRTvQfHeJUCOksk2RA>
    <xmx:q3wHY3a7m1F_nSW3ahQtqPfda5UN-wj-3jRwNvzxCt-5sJwCBzpMtA>
    <xmx:q3wHY5BxaU8J5xmINtViC1twyVZYYENBvV6Erv1zpi7DQAOGQbFhlQ>
    <xmx:rHwHY0KHVaeKaL82Q-OroPeXq2HQX9yNggQVAJkSmXZDju0qAhQ1cA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 09:44:10 -0400 (EDT)
Date: Thu, 25 Aug 2022 15:44:08 +0200
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
Message-ID: <20220825134408.dioj2lbycl7jm3ld@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <37a76651-a457-e50d-9a05-00ca9ed5d729@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <37a76651-a457-e50d-9a05-00ca9ed5d729@tronnes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_064413_313673_807C7D3F 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Type: multipart/mixed; boundary="===============7160828415894771017=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7160828415894771017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ztityevrt7lawo2u"
Content-Disposition: inline


--ztityevrt7lawo2u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Aug 20, 2022 at 10:12:46PM +0200, Noralf Tr=F8nnes wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 1e9996b33cc8..78275e68ff66 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -143,6 +143,32 @@ enum subpixel_order {
> > =20
> >  };
> > =20
> > +#define DRM_MODE_TV_NORM_NTSC_443	(1 << 0)
> > +#define DRM_MODE_TV_NORM_NTSC_J		(1 << 1)
> > +#define DRM_MODE_TV_NORM_NTSC_M		(1 << 2)
> > +#define DRM_MODE_TV_NORM_PAL_60		(1 << 3)
> > +#define DRM_MODE_TV_NORM_PAL_B		(1 << 4)
> > +#define DRM_MODE_TV_NORM_PAL_D		(1 << 5)
> > +#define DRM_MODE_TV_NORM_PAL_G		(1 << 6)
> > +#define DRM_MODE_TV_NORM_PAL_H		(1 << 7)
> > +#define DRM_MODE_TV_NORM_PAL_I		(1 << 8)
> > +#define DRM_MODE_TV_NORM_PAL_M		(1 << 9)
> > +#define DRM_MODE_TV_NORM_PAL_N		(1 << 10)
> > +#define DRM_MODE_TV_NORM_PAL_NC		(1 << 11)
> > +#define DRM_MODE_TV_NORM_SECAM_60	(1 << 12)
> > +#define DRM_MODE_TV_NORM_SECAM_B	(1 << 13)
> > +#define DRM_MODE_TV_NORM_SECAM_D	(1 << 14)
> > +#define DRM_MODE_TV_NORM_SECAM_G	(1 << 15)
> > +#define DRM_MODE_TV_NORM_SECAM_K	(1 << 16)
> > +#define DRM_MODE_TV_NORM_SECAM_K1	(1 << 17)
> > +#define DRM_MODE_TV_NORM_SECAM_L	(1 << 18)
> > +#define DRM_MODE_TV_NORM_HD480I		(1 << 19)
> > +#define DRM_MODE_TV_NORM_HD480P		(1 << 20)
> > +#define DRM_MODE_TV_NORM_HD576I		(1 << 21)
> > +#define DRM_MODE_TV_NORM_HD576P		(1 << 22)
> > +#define DRM_MODE_TV_NORM_HD720P		(1 << 23)
> > +#define DRM_MODE_TV_NORM_HD1080I	(1 << 24)
> > +
>=20
> This is an area where DRM overlaps with v4l2, see:
> - include/dt-bindings/display/sdtv-standards.h
> - v4l2_norm_to_name()
>=20
> Maybe we should follow suit, but if we do our own thing please mention
> why in the commit message.

Are you suggesting that we'd share that definition with v4l2?

I've tried to share some code in the past between v4l2 and DRM, and it
got completely shut down so it's not something I'd like to try again, if
possible.

Maxime

--ztityevrt7lawo2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwd8qAAKCRDj7w1vZxhR
xbq9AP9Ut8DrTs4R98n7uEJ4qsWpbIOQoxH89Co6dV81OZDd4AD/XTYHIrgOsCVX
KF7npRlfSwUkz5ZgJBgTt5iDHapUmAQ=
=Heqx
-----END PGP SIGNATURE-----

--ztityevrt7lawo2u--


--===============7160828415894771017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7160828415894771017==--

