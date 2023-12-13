Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5B6C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Dec 2023 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zPuthSEVMB9z1z/6r2lnoqAolJKyzm0fLnDlYsqems=; b=aZ6QR7PcHN8Km+foXuyWdgNY8H
	3s1BaEmW1F2GUKmWMIF10Ef0MqNg6ovCkFFTFsbqz3yEaYhzX31SFYynRg/m+9XWqZE+Pyahf+06S
	Ti3sVuP7ozYdrkSlPNVWbwNzu2HjKsI6fdcAJKLCZwfW+pcGDEo1Hie5uQMigaDes940314mPh6/n
	IPKx3ccqHPrZ3DYIMQRaKwAw6a4YJKctrS2UN4TI/7FzBObxTWroExerNSqzxU969VgER5wNxkHB5
	nTD+AW0VZVJD4oU6BHoYUVH6C3pBB5SbRWiOEXUQciGqXUlQFbQW3M7ZassWW/dYd1qlnOsc6jo33
	Z2k0uENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJu8-00DwQi-35;
	Wed, 13 Dec 2023 07:43:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJu5-00DwQ3-35
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Dec 2023 07:43:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rDJtY-0004Gd-0a; Wed, 13 Dec 2023 08:43:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rDJtU-00FWLL-P0; Wed, 13 Dec 2023 08:43:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rDJtU-002ABM-E7; Wed, 13 Dec 2023 08:43:00 +0100
Date: Wed, 13 Dec 2023 08:43:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Johan Hovold <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Daniel Vetter <daniel@ffwll.ch>, Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
MIME-Version: 1.0
In-Reply-To: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_234337_998821_8562B3EB 
X-CRM114-Status: GOOD (  28.36  )
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
Content-Type: multipart/mixed; boundary="===============4657103670582419806=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4657103670582419806==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kisx23oblvlyq6g2"
Content-Disposition: inline


--kisx23oblvlyq6g2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,

On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
> > that and don't check the return value. This series fixes the four users
> > that do error checking on the returned value and then makes function
> > return void.
> >=20
> > Given that the changes to the drivers are simple and so merge conflicts
> > (if any) should be easy to handle, I suggest to merge this complete
> > series via the clk tree.
>=20
> I don't think it's the right way to go about it.
>=20
> clk_rate_exclusive_get() should be expected to fail. For example if
> there's another user getting an exclusive rate on the same clock.
>=20
> If we're not checking for it right now, then it should probably be
> fixed, but the callers checking for the error are right to do so if they
> rely on an exclusive rate. It's the ones that don't that should be
> modified.

If some other consumer has already "locked" a clock that I call
clk_rate_exclusive_get() for, this isn't an error. In my bubble I call
this function because I don't want the rate to change e.g. because I
setup some registers in the consuming device to provide a fixed UART
baud rate or i2c bus frequency (and that works as expected). In this
case I won't be able to change the rate of the clock, but that is
signalled by clk_set_rate() failing (iff and when I need awother rate)
which also seems the right place to fail to me.

It's like that since clk_rate_exclusive_get() was introduced in 2017
(commit 55e9b8b7b806ec3f9a8817e13596682a5981c19c).

BTW, I just noticed that my assertion "Most users \"know\" that
[clk_rate_exclusive_get() returns zero unconditionally]" is wrong. As of
next-20231213 there are 3 callers ignoring the return value of
clk_rate_exclusive_get() and 4 that handle (imaginary) returned errors.
I expected this function to be used more extensively. (In fact I think
it should be used more as several drivers rely on the clk rate not
changing.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kisx23oblvlyq6g2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV5YIMACgkQj4D7WH0S
/k7/RggAjp1m69DfJuvZJPTz1BVN/QlcAYFKE67kz4Lu/Vi8sPzVy1FXzAAykl2u
Q7T74qF7Vldxi+bO7DXnFWZ2VHr2x+sLPrXGLe/88Utp2wTY7MOhc7V1HdRMPE1v
wrwLKcLJMUrrHtCCr++moQSXMriYDcAI/bbfNfSZyVlM+J5NM6p+Cpbh34CqGpoT
5uC+HCwX3YDR1Tb17muwRNq+mUOy3kcmvcYwJEaVn33oIkL8e8wjGu5pdS14Jc1y
+eOosCPjbshViy380fMM3E5EY+mLR7xBux0GyNpiXzdKlSbtFptF+nVwgB7u6FgF
+PM61W3oCo4oQRqlCO74T0dDOoV9yA==
=Ss4M
-----END PGP SIGNATURE-----

--kisx23oblvlyq6g2--


--===============4657103670582419806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4657103670582419806==--

