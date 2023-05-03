Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDAAC77B78
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 May 2023 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0rG0HfEKb3nmrCNrRWj8QjdbKNe0USutEIB7CtuO1g=; b=RimgoN+tQHyvI4Adj92zeE+BAA
	V6ows8gZBIXBoqB3sbK4me66E/MVB5m9BrRlqUrYWzgpLp5n8FMPtIwbJ1VpYUxGF2LGwKFJ0t4PU
	D/aiJ5kaSzwCK3jd57KSwxR7YbvHndUFORmGrcJKf4x8Crn5Mfen/7/aCb6iW/t+WC6wKzLF5ferr
	TQi9wS8l/nMEMX+N40oEx0EZsnsvGYgWKyEhyCR0Q1gICF/hMYjcVXuppcBRUlVuDdrmBfAphhaqF
	Vjb5CyvRmZ/jF630BU9EbI0mb8D7rR8PFFWGRK0nRUqbnrNh3oNHt7gtWFypNZraVeGKY4vhBe5T7
	Rv3RatTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puJ1r-005in5-1y;
	Wed, 03 May 2023 20:24:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puJ1o-005im9-30
	for linux-amlogic@lists.infradead.org;
	Wed, 03 May 2023 20:24:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1puJ1i-0005fz-7Y; Wed, 03 May 2023 22:24:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puJ1g-000uKP-NG; Wed, 03 May 2023 22:24:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puJ1f-0013Mf-Rp; Wed, 03 May 2023 22:24:35 +0200
Date: Wed, 3 May 2023 22:24:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH] pwm: pwm-meson: fix handling of period/duty if greater
 than UINT_MAX
Message-ID: <20230503202435.qbifdbl5a7soj3kx@pengutronix.de>
References: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_132444_995942_0C8FAF10 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Type: multipart/mixed; boundary="===============0554674322069708392=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0554674322069708392==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fluqfvpoezloyp5b"
Content-Disposition: inline


--fluqfvpoezloyp5b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hello,

On Wed, May 03, 2023 at 09:58:17PM +0200, Heiner Kallweit wrote:
> state->period/duty are of type u64, and if their value is greater than
> UINT_MAX, then the cast to uint will cause problems. Fix this by
> changing the type of the respective local variables to u64.
>=20
> Fixes: b79c3670e120 ("pwm: meson: Don't duplicate the polarity internally=
")
> Cc: stable@vger.kernel.org
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fluqfvpoezloyp5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRSwwIACgkQj4D7WH0S
/k50Sgf9EUWXO3l8kCIMdkm7aFMBe7XeGeanIn6U09GFEX4nY/VIIuBmGBJgnPbY
OYE/f2t2xq51gQqssP/XM/jpxYPEzay6xbvn6Yf4Y1+FGx6qMkmxP1c5MgBGz8ch
kTqyxNuy7MMk1BmexxffUytJpRh/YIn0v+s+dXx6OJJWwmfhRhDm35hMDMrPI778
qCBaoyRJBEdv/TulmkMdjQ+I9BFyio9C766hlfcOeD82CUYts1QYwdS48mpRFmu4
ttDVQS+uC1ZhY9yf2S4T15jsaR5g5Df2EzzyN/8eJQrhP8FwCVHMd0ydyZxguBvN
BXqyME/XiuY8NvvHQAor5xLRt1idQQ==
=enU3
-----END PGP SIGNATURE-----

--fluqfvpoezloyp5b--


--===============0554674322069708392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0554674322069708392==--

