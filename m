Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DF6C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJcSU2q7/ve4AleLp7Go8/PoN88PBQE+ADji4mnKauE=; b=BzdxkHazO5Wt5AhQYqDYlmdV8A
	1FSqnACM3GwOUGsS+6SUYfHnWcGU9yyzUfMhGY42Nvk67EL6CKAwf7r+wBOMD1n5w5FlcH7+4sM1i
	buhH1f2/DzBAbeFZqIV3Pz159kwbjtSnDCM8NQCeyV/yHPXqC2wvQBocPDE2TQPMkxtBTfFADpIJv
	z5cS/+3PMlEYKFl6dZH7bGlf/PEXbWchw4Maqw0kjhr+al499czuSszFYg+YeotmDkc4OjP8OFZ/B
	ZyID8tr+i4oew59fkpGbM2AOm44yOWxjw7XSTlQ/p8HJuWKIPOUqn8z5oXSXFYYg0wrw74YZUMUqt
	z5oljGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Vfa-007u4U-Nv; Tue, 06 Dec 2022 10:59:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2VfY-007tuQ-3k
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 10:59:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2VfK-0005ym-O2; Tue, 06 Dec 2022 11:59:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2VfJ-002fzi-29; Tue, 06 Dec 2022 11:59:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2VfI-0030Pn-WD; Tue, 06 Dec 2022 11:59:09 +0100
Date: Tue, 6 Dec 2022 11:59:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <20221206105908.jzcdnast3yw22eel@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
MIME-Version: 1.0
In-Reply-To: <Y3usiUm1K+5xCWhY@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_025924_179192_F1D698EF 
X-CRM114-Status: GOOD (  20.28  )
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
Content-Type: multipart/mixed; boundary="===============3474347971892153084=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3474347971892153084==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hvvxc4ne753xzl2h"
Content-Disposition: inline


--hvvxc4ne753xzl2h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lee,

On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> On Mon, 21 Nov 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > Hello Lee,
> >=20
> > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > On Fri, 18 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > >=20
> > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > >=20
> > > > The probe function doesn't make use of the i2c_device_id * paramete=
r so it
> > > > can be trivially converted.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >=20
> > > After a week or so, please collect-up all the tags you have received
> > > and submit a per-subsystem set for me to hoover up, thanks.
> >=20
> > For mfd I'd do:
> >=20
> > 	git checkout mfd/for-next
> > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> > 	git send-email --to .... --cc .... mfd/for-next
>=20
> That's just crazy enough to work.
>=20
> Thanks for the tip.

On irc you said you'd care for application of these patches ("I plan to
attempt the b4 solution"), they didn't land in next yet. Do you need a
reminder? Something else?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hvvxc4ne753xzl2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOPIHkACgkQwfwUeK3K
7AmjoQf/R+Cz88Y6JYJaJNiuO2BsSVbordLmmvYb2tbJ7oPvvlbQHPNrsbAJM5Tj
w3pD7D1b1cWANAudg2jXWP62kOP2TSisMBDipdXp0WpCMx2iCCd4cb6FbRCNu9Us
hgqJY/MjNglBbmo3fYVt/aA+k4IJDN/LywG5ADmHA/tWpGrSNcDv79dnoG06FD83
4GLB+Pap3eaS5iYD7x7g/JKBi6SFlyYv0zs7tFTJ4E3+M80gYqMKrqE9rWsJ6HQN
whwLW1MXg5hXyZgx3zrBahCCtoMclmMamZYo6YCsK5NsJlFd3RmrD0oAmTN9+Ukw
h1V49+VNTFz/84aK29CnYgi82dZmuA==
=uRDQ
-----END PGP SIGNATURE-----

--hvvxc4ne753xzl2h--


--===============3474347971892153084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3474347971892153084==--

