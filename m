Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB4EC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQnANmSjQqFlXNyeNtq2LhPd2IpPddrhPF6Hhk4PF18=; b=SZ2zHAfmHFihh6/HLvm0qZ+xHt
	Qwsfut8KwgY55+Kb0E4BLJFIFeApkn/ksn8M9oACQ1X5iNoaoGZ1ixPjtKsfQFzofOIEk8ZHZsv7I
	Z6EEfT+s664PGGy4d03RUZ0NZnMMBFMHTgYCNAlcuESF2Iu3wIuXPI/5vhXsE+BdX45LgcLOMwBJd
	yx96PapL7BKZN5RjN5G6JoOqIjJFco5eKltBI/nd0Fy54Wy/hEd2ywlvp/k0dULwJkXd67AhJb6h3
	aCxgXVwZgsPhtxdzGzo4uw33KT4KP3z5gOA/Ot7EwIld73xz3pBVNn/vITT2vXULuri7VTBsT/tct
	8qdrGB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCh80-0059e0-1H;
	Mon, 11 Dec 2023 14:19:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCh7p-0059cB-13
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Dec 2023 14:19:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCh7k-0007Fo-M2; Mon, 11 Dec 2023 15:19:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCh7i-00F7b9-Bz; Mon, 11 Dec 2023 15:19:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCh7i-000yeq-2o; Mon, 11 Dec 2023 15:19:06 +0100
Date: Mon, 11 Dec 2023 15:19:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pwm: meson: Simplify using dev_err_probe()
Message-ID: <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZXbsDRslZNKCeJF9@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_061913_362283_ADF2E052 
X-CRM114-Status: GOOD (  32.10  )
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
Content-Type: multipart/mixed; boundary="===============2638854645735672158=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2638854645735672158==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hhisbyqw576pf5g6"
Content-Disposition: inline


--hhisbyqw576pf5g6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Dec 11, 2023 at 12:01:33PM +0100, Thierry Reding wrote:
> On Fri, Dec 08, 2023 at 08:06:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Fri, Dec 08, 2023 at 04:52:57PM +0100, Thierry Reding wrote:
> > > This is a lot of churn for very little gain.
> >=20
> > We seem to have different conceptions of churn. Each hunk here is an
> > improvement for both SLOC count and usefulness of the generated error
> > message.
> >=20
> > 	failed to register somename: -5
> >=20
> > is worse than
> >=20
> > 	error EIO: failed to register somename
> >=20
> > , isn't it?
>=20
> That's entirely subjective.

It's not. You and me both know that -5 is EIO. But there are quite a few
people who don't. And for other error codes I'm not that fluent. (Do you
know -2 and -19?) Also some constants are architecture specific, so e.g.
-11 is -35 on alpha.

> I think the first version is just fine. I,
> and I suspect most developers will, know what to do with either of those
> error messages.

Error messages aren't only for (kernel) developers. If you don't know
that the kernel uses negative error numbers as return codes, the
translation of -5 to EIO is even further away than opening
/usr/include/errno.h.
=20
> > > None of these functions are ever going to return -EPROBE_DEFER. And
> > > yes, I know that function's doc says that it is "deemed acceptable to
> > > use" elsewhere. However, the existing error messages are just fine, no
> > > need to churn just for the sake of it.
> >=20
> > We had this disagreement already before. Yes dev_err_probe() is useful
> > for three reasons and this driver only benefits from two of these.
> > That's IMHO still one reason more than needed to justify such a change.
>=20
> I disagree. There are certainly cases where dev_err_probe() can be a
> significant improvement, but there are others where the improvement is
> very minor (if there's any at all) and in my opinion the churn isn't
> justified.

What is churn for you? Many changes? Big changes? For me churn is only a
big amount of changes where a considerable part cancels out if it was
squashed together. For you this concept seems to be broader.

> Otherwise we'll just forever keep rewriting the same code
> over and over again because somebody comes up with yet another variant
> of mostly the same code.

If there is an improvement in each adaption that's fine for me.
=20
> > And if you think that a function should only be used if all advantages
> > are useful for the caller, let us reconsider if we really need capture
> > support in the pwm framework as only two of the 68 drivers make use of
> > it.
>=20
> That's a ridiculous argument and you know it. You are comparing apples
> to oranges.

I would have been surprised if it had convinced you, but I honestly
think there is a (admittedly small) point.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hhisbyqw576pf5g6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV3GjwACgkQj4D7WH0S
/k6u8Qf/VhM38H7LuLbaZ1vmo0VZRs1iiUKpDrtmhH8Ny5D9kDty4S985Qo2w4F/
j2pa1OxZupWEsre8B8n7Tpa9V4xvR3Njmos5oBYt7qUWIJSg8QTAdKFuJXgJmmsN
Nvx1HW6KWq/2n2GXDB5MI1aL6UNDNBu6Q2vKuvRQO5YVZcjfCpHJEEzz5Yrt6PkQ
SgMtno3XCdxkvQWXK6KJTWARyHpZDbO5PwOiE113QoPGzjlRPSXTmehtJuV3TVWZ
ES/0GXx/jE9kfMrSet0UEx8RAkrH9bJiBudsG0UHLuYI0aCDpmH0OT8dj5q/tPG8
G6E+ejkXVIFGwsHfMPHQQiW8r7Nw+w==
=7uQS
-----END PGP SIGNATURE-----

--hhisbyqw576pf5g6--


--===============2638854645735672158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2638854645735672158==--

