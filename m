Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE74C00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ktHGYWDnFsapdQRfjlTx8NKLkIplQqlFAZSMXdSdWo=; b=xO8xxdjkw/CzavHPeYoqHM6VWN
	7a42nwwp+vEIeECwVychOKaR5bDO1q0aeuH9fjtz8xF/u2eOLAdTGKHPaGR5VXue+W6cb9Nmkkm0l
	rwTyLWtE6+xPNtg2HBlxVaZGU7PfV/0XfaghfxhpjJVWWp67fhFuEGT1/M5CwfAP6TlJaym2CzbLy
	SlOyklWZ8nZUjOxJmvKa6delhedsHs9ESdrQXFLHWNs7L8PSN74fjbPqiATnQUpAyapzKjx+Czs3w
	FVwKYHwlY3Vsz6BR88TtzjGY+udlvh+Br2VUbIYNx8RcPT2PGRZsdPKBJXLG+G69ng/SvwJeMc4EF
	QcWODKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVUO-00DByZ-5A; Mon, 15 Aug 2022 08:30:24 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVUD-00DBnr-KW; Mon, 15 Aug 2022 08:30:15 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1B9C65805B4;
	Mon, 15 Aug 2022 04:30:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 15 Aug 2022 04:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660552208; x=1660559408; bh=RA5kw03+WB
	AXnGH4vH/n/ZMFMILVebJisUqvkOeE43M=; b=DVbua1mRF33kH9w/O355c52UXa
	R37aIM29S8U5nFIswhVh3S1KzVMaRHFkrJumjiSzfEe73pmgrGHP/XOjRVW66/VG
	N3QH0I79a0TpfsaafoT+GBGAsdAMd709ZCpWajcuJcua0fdBc3Fh4CKPbxxxlx7Q
	bGJx3hBtpz6GbTxeYzMMBryViTChP6YkrFqUBYWh9q1GR7GfIQE00sCk7/6+dDtd
	uo+rLaPyhbNm3xCH7fMU5m1+kDzjr8KwAPtDFe82uzEB5ll7gz0Cox5zEsJJ86DX
	SQo9O2h+yeN75pP7cjUtxqiK5ysUpoB7ggRUyEme9XxK0bL0OgZsGU7CgbMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660552208; x=1660559408; bh=RA5kw03+WBAXnGH4vH/n/ZMFMILV
	ebJisUqvkOeE43M=; b=HbD9vCTkb+dEYIAuIpXto4lTqguTRzigb2zedkkpl+jb
	PpCVKrmzgqmuM+1QY8AAC/TQpZ95qCcPjzE4UUmWv2IGC3NDUZ3BthaQ7IZ0XqUg
	CBNMUFaHlxu6n9rBf9niKZZmge8ufbeIy5vIwQQWvmNeKHqyiGeWeccr+1ztKJ2P
	iWFC75XpK7dJtgUEVnvz6wUY6NIlM5Nr1B8ksLnfjAqHyG8L3f1bYQQID5WN0tA7
	2/ubEhQPaF9cBUKrOdmDnG/6mItBQZMoXBDXvpH7GjxpMXeP2qHWSuOu3GsrJuAI
	pBbfqno1ILKYUVnMvx1e1ef665zwVkXul3gzG/EuIg==
X-ME-Sender: <xms:DwT6YmlaqgoGj3rd9g0xA6dBUendmwC8SSq4tGWYLy74f5EF7GyU6g>
    <xme:DwT6Yt3whEYBF1OOu3egQKQH0A9bfd8aa6efrO2z1coh4wN8UmwTmeoOFU2GxJ3h7
    kMbi_EnY24KgQpC3Jw>
X-ME-Received: <xmr:DwT6Ykp0HSBN6R43g7b18UEAaCRQm9PdNPw8U0zdlzlnleGsshrNQUUad559>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DwT6YqlrIMgmSHXbJ3aObSDrjee1DNKa14wvckdoAdtxiYR1NCKWMQ>
    <xmx:DwT6Yk1xl2CqThy3NwvDQqGh4iN1oq31OiTqxQb3eIb4BUqZSp_tZA>
    <xmx:DwT6YhsIKerepeTFgj4K20JDC3LnTnF8pdUimfYelf5idBY9Lm3Kwg>
    <xmx:EAT6YindEcgZw6YGtsCD2CIZmh4o-alqMqIAtZEQAlNjcMnlu8sSDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 04:30:06 -0400 (EDT)
Date: Mon, 15 Aug 2022 10:30:04 +0200
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
Subject: Re: [PATCH v1 14/35] drm/atomic-helper: Add an analog TV
 atomic_check implementation
Message-ID: <20220815083004.4zei3raab7uqehqf@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech>
 <10a2f71c-d943-4965-1f15-d84145769ccf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <10a2f71c-d943-4965-1f15-d84145769ccf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_013014_266611_9CB16DAC 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1658406082398853634=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1658406082398853634==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3blbnbsxxj3gnoe3"
Content-Disposition: inline


--3blbnbsxxj3gnoe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jul 29, 2022 at 07:16:31PM +0200, Mateusz Kwiatkowski wrote:
> I'm pretty sure that PAL-60 and SECAM-60 should be tied to the 480i mode.
> Those are non-standard "norms" that use 60 Hz sync (which is largely
> synonymous with 480i in the analog TV world) with PAL/SECAM color encoding.

Understood, I've changed it.

Maxime

--3blbnbsxxj3gnoe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvoEDAAKCRDj7w1vZxhR
xSaoAP917KRrvUvrHF4D7EakrA32d9JtkzDYQ4YvSsQNyQebUwEA4QYkvJjSsUY2
HL6BrTQmByiQ2K+kmlv7ynXMH5TMxwM=
=29xc
-----END PGP SIGNATURE-----

--3blbnbsxxj3gnoe3--


--===============1658406082398853634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1658406082398853634==--

