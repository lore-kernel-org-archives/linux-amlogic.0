Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C16C352A1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KFLlC3SXey9BQ4iOA09mEcrkF42yZ0k4KWWiBtDrTA=; b=ZkDFabPmA931LgufGwXHJ9ziL7
	R0ZqB2qy61CCueX9+PScRzw8m9u9VY8B/exJq9rGO7PzXKiL9q7CYAXO2Gh6NR50EwqJfRh8ofbAq
	D7UQTxglH1H5ploqE+PSBTB/cFAXl8NpBHpO+01pR2zzP29AjLGOSH9H+8J/JXMu50Gs48ntAw4aW
	2MqFD5V3cg9mjuZagOfUPJFvjfarNr+wpu07VR5HDjMwVDUDe0bdQ9Vc73C+Leu9Q7qNRG3YKaSjn
	4AlRMWWosYQJiMDVdrRTj7QQIt48SnMlvqzFgRS8pfWDO5bmglID1Su8VeM7cy26R9Wi+n9vQS7OE
	T6g+sEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uvM-004JqV-Rw; Wed, 07 Dec 2022 13:57:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uvJ-004Jcj-0d
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 13:57:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2uv4-0007VL-LE; Wed, 07 Dec 2022 14:57:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2uv2-002vut-QL; Wed, 07 Dec 2022 14:57:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2uv2-003I87-Ta; Wed, 07 Dec 2022 14:57:04 +0100
Date: Wed, 7 Dec 2022 14:57:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
	linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <20221207135704.oxyu2gfm6wrns5t4@pengutronix.de>
References: <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
 <Y490W6k4N8iBxLHf@google.com>
 <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
 <Y5B3otGG06QCjldc@google.com>
 <Y5CWSZpndGi4mU5e@google.com>
MIME-Version: 1.0
In-Reply-To: <Y5CWSZpndGi4mU5e@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_055721_076642_DCC9A26F 
X-CRM114-Status: GOOD (  16.63  )
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
Content-Type: multipart/mixed; boundary="===============5486701769566432047=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5486701769566432047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="444ob3jqs3mc3uhm"
Content-Disposition: inline


--444ob3jqs3mc3uhm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Wed, Dec 07, 2022 at 01:34:01PM +0000, Lee Jones wrote:
> On Wed, 07 Dec 2022, Lee Jones wrote:
> > On Wed, 07 Dec 2022, Uwe Kleine-K=F6nig wrote:
> > > I see you added my commits to your tree now, however there is a probl=
em:
> > >=20
> > >   [...]
> > >=20
> > > That means that the commit introducing i2c_client_get_device_id() isn=
't
> > > an ancestor of the commits that make use of the new function. So
> > > 63909fec136e (which is the first commit making use of the new functio=
n)
> > > likely won't compile:
> > >=20
> > > 	$ git grep i2c_client_get_device_id 63909fec136e
> > > 	63909fec136e:drivers/mfd/adp5520.c:     const struct i2c_device_id *=
id =3D i2c_client_get_device_id(client);
> > >=20
> > > Starting with 7281458f4396 everything is fine again, but still this
> > > hurts a bisection.
> >=20
> > Fair point - I'll rebase the my topic branch on top of Wolfram's.
>=20
> Okay, try now.

Looks good now, thanks!

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--444ob3jqs3mc3uhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOQm60ACgkQwfwUeK3K
7AnwYwf7BJNhpOShM+y1sPNPmv1EtCLVMQ5BRS5kTzzqK8U3WDaJ4h+0gqiakqR6
q/SUJSzkLtGDo3uzt3CxEeUXk++AyWt6izQKjYIRoGGM6/aIEKJGoNvthphjH5C3
ex7x4QUrSZIApKlQmiHa4yUhogpGjD8p/WJsw6kO6VlIsK4gyn0UVdwP1XuReucA
mY/MnyLv4X/IE4JFwfKeyxgUmhzKUSi2zl4JuZP0RCNK+uV9ZknKs+9wnqxF1JJ4
xXr/1Ft9OLfs3dnEmyKyIOCgac5BHQL8jEE6LF10qWxlsX4N6sf9Uv5A3B/rXCLL
IdHOr0s6H4PFD7LBaA0Mrl3QPcs5Uw==
=JuPy
-----END PGP SIGNATURE-----

--444ob3jqs3mc3uhm--


--===============5486701769566432047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5486701769566432047==--

