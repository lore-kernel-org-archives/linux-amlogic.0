Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C4AC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 15:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIALqJA/oJdTYjEAeVyAlnWvf5hatNMUsUEoa8BRW5k=; b=QoV0xPIirwAuO3uafgyQipOAlI
	MI6Wr4fRQQVWyji2AlzGl7DLHHjLOZr6/7wCYkxYliSuuSAdG7UQLzvjSGwPZFSuGXFRZkelZfaAF
	+hmhnt9chwdjnQ47RnmjJ3YMUXY0aScOljrrY5wyDOKCdIXjIarVfwPngi7hevtmSIM0LQslIZjl3
	l/wdmmgVOM+OUj4U66L5Vt5Bn5powEY08WkTPc8wqIJQ5eD9KUzc5MSSJn9QPV0p516qO1XQzdxzl
	LJQUXPZ4bkPeQDnwobBIlOhg6DJNqtcnZ9+9XYqOWJQQ4TIyloVK2FoEOziXl5djFBA1BHUnUiBE5
	uJ4h74fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8eu-00F97K-QB; Mon, 21 Nov 2022 15:24:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8Px-00F0vZ-4f
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 15:09:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ox8Po-0002S9-BK; Mon, 21 Nov 2022 16:08:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ox8Pm-005frj-7u; Mon, 21 Nov 2022 16:08:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ox8Pm-000bEb-7V; Mon, 21 Nov 2022 16:08:54 +0100
Date: Mon, 21 Nov 2022 16:08:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <20221121150854.3mwczqtbusawho4m@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
MIME-Version: 1.0
In-Reply-To: <Y3tvypIDVdCYxAVB@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_070905_215505_34C2E1F4 
X-CRM114-Status: GOOD (  18.08  )
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
Content-Type: multipart/mixed; boundary="===============4253730988441937766=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4253730988441937766==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p5ojcz3xuvysnogu"
Content-Disposition: inline


--p5ojcz3xuvysnogu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> On Fri, 18 Nov 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/mfd/khadas-mcu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> After a week or so, please collect-up all the tags you have received
> and submit a per-subsystem set for me to hoover up, thanks.

For mfd I'd do:

	git checkout mfd/for-next
	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
	git send-email --to .... --cc .... mfd/for-next

to accomplish that. I can do that, but feel free to do it yourself at a
moment that suits you (of course without the send-email part and maybe
adding -l and -s to b4 am).

For backlight the patch range is 585-593.

Cheers,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--p5ojcz3xuvysnogu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN7lIMACgkQwfwUeK3K
7AmS1gf/YEGBTS5ayE/EOyPU3hXmMOhVXdOaQuQZ42Du6c9FfpQiZ8xL5NOdJCQp
cPqinv55VE8CeMWUvPty4S1NqJD7XD5SEOobLCwM5lxyfnMwjQ+xZTufnqFr2Dev
xP7a3eRkj9t2prnIBkeKqLosulBdk3V2l0NUBSLDnnIm5DILE/5mUclvIKlsJhKq
SK2UGwG2sLPkkvE+biOVxNGvEPN7JsZcVKHeriq5G0BKiPyYe+MTL9Uo+hPJSEnY
iEahy2aFzmFCSRgc51YS0Ubeou3wkvhbTdiZq9l855P/xW08tc70ysdnTPFlK70O
CuN/EWg40LnpzHD7vQ9eQf+g1m7A0w==
=AYjL
-----END PGP SIGNATURE-----

--p5ojcz3xuvysnogu--


--===============4253730988441937766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4253730988441937766==--

