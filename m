Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F51C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Dec 2023 20:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT6P6W//J8CqeYBBSyG5GPUqJgWsG101JQ7gLUdolLU=; b=RHnVmxrK8Xmg1Zk1rv3NAgLAj1
	pgXV3LtueW3ZDEAu9V4I1pKJZBTtjQInJ6WrCV8fVKwEL9MbUwrM2LzuLtfTNpyqEDXNNTkDsbhkp
	8sWyExCF+m9u1oFSxpzfwqSvLPa8SRfXg3K0HoGCNtD2KGOIZbHDpFtmUvUw9WLTjLyXWake/4PLS
	cf+zWqY5h8ogL8dWp45hR0tEUJsWFnTpOtnUGQFwrIM8mp+D5SP14VgAgcMsCrjg+EoaL7FyUd1pc
	zoeFSDmcfpz3CQK1X/BRLmAe8FFvmvI4n37IxBhugIl0sdOstI2VC2T9dHSY/1dBoUETONTjM1/OP
	0SqGwn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9S6-00Cif3-19;
	Tue, 12 Dec 2023 20:34:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD9S3-00CidX-07
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Dec 2023 20:34:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD9Rx-0003vB-Q5; Tue, 12 Dec 2023 21:33:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD9Rx-00FQ7M-7K; Tue, 12 Dec 2023 21:33:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD9Rw-001sD2-UN; Tue, 12 Dec 2023 21:33:52 +0100
Date: Tue, 12 Dec 2023 21:33:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pwm: meson: Simplify using dev_err_probe()
Message-ID: <20231212203352.wl3rzob75fct4lov@pengutronix.de>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
 <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
 <ZXcpswXxb1oQldp5@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZXcpswXxb1oQldp5@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_123359_079657_EF01BA30 
X-CRM114-Status: UNSURE (   9.20  )
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
Content-Type: multipart/mixed; boundary="===============2611589408709087495=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2611589408709087495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="guvbhg2l75sxu7tf"
Content-Disposition: inline


--guvbhg2l75sxu7tf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Mon, Dec 11, 2023 at 04:24:35PM +0100, Thierry Reding wrote:
> It all adds up in the end and keeps me from doing other things.

If that means you'd be glad to give up the PWM maintainer job, I'd
happily take over this post.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--guvbhg2l75sxu7tf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV4w68ACgkQj4D7WH0S
/k5SoAf9EwwocC3g0tzyS34LMplwo3g493B3KjpWEfjKrQfSTLU0gbTb6BJH8AeX
bdwuibpcxFBfBNJ41T0V8z2G9j1nWB8+TEKj8WDuUV6jmu8wP5TjXe7acBd5SR9f
WJCbuei2OpWIovqasuWpmFkc6tfUfbupmRw7WbdnbMgj0k39/c6dZ935W+vcAy8w
SFkPTWOdyzEe+hQEk2WuquyBebDQZwS2HIbzGuPg/H7BwIE+XYd9wRgnA0Mg0xpV
lHVConqd5P7GYwrjQj4bU4YAzdScaGHUADvG45MNgJIjRyykrpzl2f9iorGMjliW
3CkcpJFjQlOYPUo93f4iQg1fvkTQkg==
=58Vq
-----END PGP SIGNATURE-----

--guvbhg2l75sxu7tf--


--===============2611589408709087495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2611589408709087495==--

