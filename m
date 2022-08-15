Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9837CC00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eQP5xPCBW3l0/c+CglIKcYJt8DvtN/h1ogxCDy77y4=; b=Vw2+iDc+FfkIqc6i50KLY/zOG3
	cuMjFOoNHny9sgFF5Dn2tnjT3hXnEgfi+H2fH+jg33A/4b9ObQtEQ6Oa8bGF2nZ3Drv4HkmzyHVUZ
	jj9/ecfySHFRy8f/r/veR/lMdHb24zPggnDcmwifYzjvvKSC9hS5YMBnyOMmyRVglIOQTgm1EBT2s
	LFip1jKr4BmpaL5VVe5ynoHukgZk0y3PkKFcOBHulvZ5g2o9y296fYlJf5dUBiR8jVL/9/ftRiH+a
	I6NJZ7aSLwAijRUp0hyT9Pauwj9Tk7JSZSgmMUgQN7U+PXRiGRIn3/pr8V4Zho1eg9OwjCSgjpdwf
	bsIvGWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUef-00CdJ7-GA; Mon, 15 Aug 2022 07:36:57 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUdb-00Ccld-Mw; Mon, 15 Aug 2022 07:35:53 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id F351C5804E8;
	Mon, 15 Aug 2022 03:35:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 03:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660548949; x=1660556149; bh=w9cQgkryOZ
	rTMuW8XbykeJZc+OJXgmDOa/70G6lboNg=; b=a5Ds27l9BT9gOjMBPCN8BzkuxZ
	JYLjsFx9gxDEY5jvI8+yLp7UJhD8WWmUdMHgdMOd1+jOTTL6z6nO8sE7C04QdVFr
	WKsmIChwrzUXFabb1EMJXVQUvs36XecJXmNqauTih8YUfEcCmz9tGvqhOxKqqKcj
	V8PxpauTR8IPSeHQMXP8A1pOzhALkkV1LapqiQ18CfJBZ5Myw3Oub8ZkCER5t6de
	DGF7ZEZAWC9+fYOH2qU0+/iopU/2mhJ+BdQA+1f9d3uq5a0rZ+HwzKciVD4pdXgQ
	leyj4feuLXBwYeqpUYKFT7cHsJfnGIXzODBJ4ELoFiRSvbxzpycNVsH8UrUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660548949; x=1660556149; bh=w9cQgkryOZrTMuW8XbykeJZc+OJX
	gmDOa/70G6lboNg=; b=EtirkQGRowRlx/E866o7sqMqyKYnM9kxioAwm+IzTakk
	qlysK9fam5BbvguehMYjkavviohBTL9rUlcSWF2QqgNO0MugdbsK1LeJVco4qE7z
	yuHH7FtGIqkC0iPFYWP3Zju9/czFX8FIaPHUOv17FKKmKwI0HDJ+gjyObV+csWXM
	B6XLw8tA4p4xn1EgA3TC4FfCsCMOEYtEgaoPMf4Ws4DyenyhpoE/C3YkXYJUGQBA
	xbuxhiYH+MYXdh4rLmhAfUSRRDZzxQRmVesNvIjYZwZlgRZQIBjq5hnm1zu8uc7H
	cNAC7YU2FuVXeXa2CE5pv/tdOanE4QGLbhHMLc7yAA==
X-ME-Sender: <xms:VPf5YkviSOqdHKUdvcs1SXcxJhlbX9TTPl83EHIUA76kTVmZhX1Drg>
    <xme:VPf5YhfYcStHwnAkwix3KC95sbwd-jA-74C10AdbCECQM-4kSuALUPIp4srJ_3doN
    TQQdpUXOPhXHBdnztE>
X-ME-Received: <xmr:VPf5YvwDMuZwU5LqS0XYHVoq5U6sOBZzZE7EcfAYtjzt17ehmmSHAXx_WYeu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepieehffffvefgiedthfeiieeutdfgffekhfehgfehgfeiuddutdfftdek
    ffehheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
    vggthh
X-ME-Proxy: <xmx:VPf5YnOGE2wUjkjwKlwnIAjpuJJkfd3fcKFVwCxNC_uXGB8_BV8m4w>
    <xmx:VPf5Yk9VY3eyUyHkM2fxUhvHM2io7DxqyN4nPkFEGaZA3Phol2aI4g>
    <xmx:VPf5YvXoqru6zervnrA9nNxiFD2Q-50dEcJeCLOf-R7gOTrUr9_z4Q>
    <xmx:Vff5Ygv-y_nAn6ggoJu4LcrIVWBPql4muCx5Ua5DRqmGS2UUTNJk3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 03:35:48 -0400 (EDT)
Date: Mon, 15 Aug 2022 09:35:46 +0200
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
Subject: Re: [PATCH v1 03/35] drm/atomic: Add TV subconnector property to
 get/set_property
Message-ID: <20220815073546.4isrl7o3bt5g23pk@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
 <6e47ce2d-25c7-7254-703d-2a1d3bb64373@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <6e47ce2d-25c7-7254-703d-2a1d3bb64373@tronnes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_003551_994477_8581DC07 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: multipart/mixed; boundary="===============0945835092083288353=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0945835092083288353==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u67ey6tc73oyu5na"
Content-Disposition: inline


--u67ey6tc73oyu5na
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

Thanks for your review

On Mon, Aug 08, 2022 at 02:30:42PM +0200, Noralf Tr=F8nnes wrote:
> Den 29.07.2022 18.34, skrev Maxime Ripard:
> > The subconnector property was created by drm_mode_create_tv_properties(=
),
> > but wasn't exposed to the userspace through the generic
> > atomic_get/set_property implementation, and wasn't stored in any generic
> > state structure.
> >=20
> > Let's solve this.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> I just realised that this and the select_subconnector property isn't
> used by any drivers. Do you plan to use them? Maybe they don't need to
> be wired up at all.

I'm not sure really

It's true that the subconnector and select_subconnector fields in the TV
connector state aren't used by any driver, but the ch7006 and nouveau
will update the property content through a call to
drm_object_property_set_value

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i2c/ch7006_d=
rv.c#L217
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/disp=
nv04/tvnv17.c#L185

I think it could still be useful to report it in the connector state, if
only for consistency?

Maxime

--u67ey6tc73oyu5na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvn3UgAKCRDj7w1vZxhR
xbmZAQD5nsl1fKLqTQPIrC0VdS9xyWDxecKIIygi1DB180AxtgEA6DpFUfV8x3sb
JZ8Mmo3OvmOSy7NnGeEzHLlA/1/Mtg0=
=joBf
-----END PGP SIGNATURE-----

--u67ey6tc73oyu5na--


--===============0945835092083288353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0945835092083288353==--

