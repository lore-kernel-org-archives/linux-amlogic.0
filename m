Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88873C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQohtfQ/s3xO6HYbNTAUNqxEh6UFsacI11iShcw4ui4=; b=MwYot5oBaeIs7Z0w8/NtGR64IL
	860M2lbxlSHDWjImOnShG16+WHd7zy2sxhRDnX4YsxYUE0/R1B6tB/t13M02txJMXb1f1W+TyNQ4s
	KQggRTxEmX1hs2bnEe3J0cydbw2QyUTKyhYr/QuSx4RL1eUjxARTWlnx21NYM/cDyC1KDcxpy4Jih
	6/bSUgdNipOXpaCgC9X0S47BPayENFfJsEPh5TKT/JiGCK/sBBaZnupMDA+Ht+6d1LGClja+DeOcY
	JoDZTsepo4pu/ztgtAr154B/mwO1Yez4oMWjgqUWlInQQbnidFo1a3Mrqm14VnR4oo5S0EL1qv/RD
	mYQi35VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOwml-007hDO-08; Mon, 06 Feb 2023 08:23:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOwmh-007hCQ-Vy
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 08:23:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pOwmV-0007UW-RW; Mon, 06 Feb 2023 09:23:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pOwmT-0031E8-JC; Mon, 06 Feb 2023 09:23:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pOwmT-001EgH-SY; Mon, 06 Feb 2023 09:23:17 +0100
Date: Mon, 6 Feb 2023 09:23:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Message-ID: <20230206082317.ygvixvhjqppz4nmy@pengutronix.de>
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
 <5b83767e-c53d-316f-df10-45a39dbd9c88@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5b83767e-c53d-316f-df10-45a39dbd9c88@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_002332_043624_8C764730 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Type: multipart/mixed; boundary="===============2281551060273250083=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2281551060273250083==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gsp2ydktkue72wff"
Content-Disposition: inline


--gsp2ydktkue72wff
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 01, 2023 at 09:00:21PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.
>=20
> Reviewed-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

How is supposed to pick up this patch? Does it go in together with the
other patches in this series via amlogic/arm; or is there an expectation
that it enters via PWM?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gsp2ydktkue72wff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPguPAACgkQwfwUeK3K
7AkOvwf+NG231BHr5/rQggvY7H209Cv+4ixSPdKLxn6pTW6QEl7mcyTgSEBmUTjl
eha7nd681AgnKn7Ixktufs8N3JKd8bMMn1ZRjSOeXSwaskOp7rIP5NEdAi39ZkFx
YO6wvvx12MZ7QYDYNoSU8D+bagEUFlatej/cxXKFWzakoeurShg0DlRLPEUdkD3r
GupQs6x9POxYK9hNDLfhFGKtI7hg0m2yjf/8vJvsYOok2Xb1B3yOUHqYsbkyzbuJ
MeBFozyUzserMGaa0nQZqHEntCYMu9SjjNJ9qkg+8ZIkuf1K/Rq1dgUdShWwg7V2
XqT1fLgAhb8hYJ2mMbHcTLIBjR6aHQ==
=JK05
-----END PGP SIGNATURE-----

--gsp2ydktkue72wff--


--===============2281551060273250083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2281551060273250083==--

