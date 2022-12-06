Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628BC352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRnhGButcKRMmSW8S+gRikwMpQ3KDrM0t4FQz0utt9o=; b=Qrg81Va39cjn0wLV1QDo1JyLV/
	df5kvifbBMpxrNDxJhQuI3/U0UStvRXBw7yYkEsCrchRsojdKH5O3RdqIl5vZPywQ/HdGkV/IMJCD
	YOYpzXdTzC15sLZ1QLl2VZ43+3GWOXyaawVC6+teApMH8bEfZiStjwoX6byC1wU++XBLD4+j03XIq
	ukWLzVOGRcSM1jxkepRB/kys8bVqm3yB5S6juSQx3dCYO1dtvZKoCBpgvTnpdhWgBrWAGRBi3RH7+
	mYMlKniDAJjnZkFiLaSxnhUhJyZpZ1oo3n1vq/pEpf4ogpBPkoXreBXdNFRUb9szpvYfT9EOfiIQd
	/hHFVydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2aus-00F00P-B2; Tue, 06 Dec 2022 16:35:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2auo-00Ezgw-GX
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 16:35:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2auc-0004XL-Gn; Tue, 06 Dec 2022 17:35:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2aua-002jqL-PL; Tue, 06 Dec 2022 17:35:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2aua-0034l9-Mn; Tue, 06 Dec 2022 17:35:16 +0100
Date: Tue, 6 Dec 2022 17:35:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <20221206163516.i6rzewxts7do75y5@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
MIME-Version: 1.0
In-Reply-To: <Y49pi54DKsvLOzvb@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_083530_579849_82636DA6 
X-CRM114-Status: GOOD (  26.10  )
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
Content-Type: multipart/mixed; boundary="===============4854933961068304530=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4854933961068304530==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dy4m535lwp7336za"
Content-Disposition: inline


--dy4m535lwp7336za
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2022 at 04:10:51PM +0000, Lee Jones wrote:
> On Tue, 06 Dec 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > Hey Lee,
> >=20
> > On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> > > On Mon, 21 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > >=20
> > > > Hello Lee,
> > > >=20
> > > > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > > > On Fri, 18 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > > > >=20
> > > > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > > >=20
> > > > > > The probe function doesn't make use of the i2c_device_id * para=
meter so it
> > > > > > can be trivially converted.
> > > > > >=20
> > > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.=
de>
> > > > > > ---
> > > > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > After a week or so, please collect-up all the tags you have recei=
ved
> > > > > and submit a per-subsystem set for me to hoover up, thanks.
> > > >=20
> > > > For mfd I'd do:
> > > >=20
> > > > 	git checkout mfd/for-next
> > > > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > > > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> > > > 	git send-email --to .... --cc .... mfd/for-next
> > >=20
> > > That's just crazy enough to work.
> > >=20
> > > Thanks for the tip.
> >=20
> > On irc you said you'd care for application of these patches ("I plan to
> > attempt the b4 solution"), they didn't land in next yet. Do you need a
> > reminder? Something else?
>=20
> I applied them, but they fail to build and I haven't had time to
> investigate.  I guess they depend on some patches that have been
> accepted into another (input?) and are now in -next.  Any idea if they
> are available on some immutable branch that I can pull from?

If in your tree i2c_client_get_device_id() is missing, you want to pull

	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_d=
evice_id_helper-immutable

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dy4m535lwp7336za
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOPb0EACgkQwfwUeK3K
7AnRqAf+LxdBinNoKRDwKyG1d4vGoUEdNxDR448xVYkZ81KrXKW9ulHcHNNcx/7U
b7qyJvNhTfA//k7WoWrFOVfEXpZp7yKSriTTETQbWYV986JbtmaU6OzEIzgKAyPi
ZRSw7tPJMSrBQZa59yywjqAVL1pIbUuXkmaU8FSnPjYjkiULkb9xplydn7VPAHDY
GFK0EJAVM95cVSsuBaYV3T6dXNyKoYgKU1dVQUUlDKU/f7pxy4umQnABy5tFV61r
HLfivemcoBKWLdygJ4B79JhVMN6JPzn8ltOqq3+xDoznG8qNYUkhHGwC2IunUzTy
HDkvn8uUEqSwBqCTsJ3x3qreawsrWA==
=tLOm
-----END PGP SIGNATURE-----

--dy4m535lwp7336za--


--===============4854933961068304530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4854933961068304530==--

