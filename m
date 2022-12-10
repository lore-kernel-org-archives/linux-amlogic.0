Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B4C4332F
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Dec 2022 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNYrDmYVQzOEoe2VcT4LZ11Fx9mi25qpsa8AibivvYs=; b=JZF51qlj9Q82syoRcbSiOAO1YJ
	kIz6gaHKPNE3iHTBlsoI7LCjf8eS2gGLRT0/X57/pdbctSxRQ1lhx6KUksCH8mYG95Koo0NaVTqsK
	V5qX6CdG298od9aj7F+3nXjZSa84JC0iaTsl9Lareu873XBSQzgmjEUqYGjB/LCvk1/Cjz67XOANm
	PwNoD/GTqtJK1CdD+IVGGzXoVvlKjiXXDogo1ZFASngukCRqUPeha0axlJsCiF/pBa+ycvh8Kb6c3
	ssq+gkIN7Hv6GKkyb35k3uuWadx69RvV8JBlAYgYpkvEO9pR4fQ7RM+sNRLSCX+C5LK2dwcn9kEF2
	bIaY6tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p48Y9-007Lr9-HG; Sat, 10 Dec 2022 22:42:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p48Y4-007L4y-OX
	for linux-amlogic@lists.infradead.org; Sat, 10 Dec 2022 22:42:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p48Xi-0008S6-Bo; Sat, 10 Dec 2022 23:42:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p48Xe-003fjR-2X; Sat, 10 Dec 2022 23:41:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p48Xe-0046bD-4d; Sat, 10 Dec 2022 23:41:58 +0100
Date: Sat, 10 Dec 2022 23:41:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <20221210224154.733cd5qnrkpexq22@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y5OtCjQOQjjltGPa@smile.fi.intel.com>
 <20221210091833.vdfir63nq4kpj5cm@pengutronix.de>
 <Y5TyrO5maz5VYic3@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <Y5TyrO5maz5VYic3@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_144224_802938_12F34CFA 
X-CRM114-Status: GOOD (  16.29  )
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
Content-Type: multipart/mixed; boundary="===============7916682172092476122=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7916682172092476122==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7qhswmbpkvtzgvtu"
Content-Disposition: inline


--7qhswmbpkvtzgvtu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Sat, Dec 10, 2022 at 10:57:16PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 10, 2022 at 10:18:33AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Fri, Dec 09, 2022 at 11:47:54PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 30, 2022 at 04:21:37PM +0100, Uwe Kleine-K=F6nig wrote:
>=20
> ...
>=20
> > > I'm wondering why we didn't see a compiler warning about mistyped fun=
ction
> > > prototypes in some drivers.
> >=20
> > I don't understand where you expected a warning. Care to elaborate?
>=20
> intel-lpss.c has the prototype that returns an int. IIRC it was like this

Do you mean drivers/mfd/intel-lpss.c? That one doesn't implement a PWM?!

And drivers/pwm/pwm-lpss.c is adapted by this series.

One of us is confused ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7qhswmbpkvtzgvtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOVCy8ACgkQwfwUeK3K
7Amqbgf7B9CvBJP4sV+MCHwNOkar+hN65y/IFZl8+KJEQzokHbdag/I7vBvxqm0q
cOWhTR13j1UZBW5bl06bB5K03JJLpAqFVemlvCMxww0G9e7f5gJ+UkkFy64Wg5eN
S9IGKBbgBZqZIpEpYNRSatcmsUacaV1aKHKYrOkgrkFno+a3jk9SGNUtdwvLyvwW
6rpJPqUEOQo4dqB3YPj/VZL13P7B92K3qIsBu0lxz20qstp5wjIpMF1Gsky+6Sf+
WgVSbrTrTjMwtDpEfb9/ZMXWohTWu0FeaTliafQxjCiNCIgmejFgLEdmalOZ4NXx
gh5E3k8VT1fe4RAogpC5ofieweL1YA==
=ikaL
-----END PGP SIGNATURE-----

--7qhswmbpkvtzgvtu--


--===============7916682172092476122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7916682172092476122==--

