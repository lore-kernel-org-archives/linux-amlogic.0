Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9C4C35274
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Dec 2023 20:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yrPzK1HyvtM5E+68ASZQEcegqwBF5Hx4BQJgMyTnWg=; b=ZKzbdQJz3NHEjghAdreb4iyKQ4
	38nXNcyX2IOM3zRA3ow4t2oVbWsG14yAG465yJbwh6Wi+JzCa134vzFJMcAWL7priY1mCJ0/Z5rIR
	lLfTBQ0kD3ftZ222SaqJWIsEjIzyQDm9WaJpjiVhXDZVAxfk0uZo5NjkRcGhc1sym4nD5CvBjZDx4
	b5m8HKcXF+7XP4jX34lKxSj+UnCsKk41B5K0Gjhp6ZJx/faPDEhK13Ipz7LAIzvGiyrIQKzlR1URn
	JXLNBtYh24xBof2ZBks76JnGxal0joo1znGUqvzL5y9mmLG+taAeRQMoO3oWkbMRHFErPgrjmzrdr
	DLTd1PNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKXm-00C3ha-1v;
	Mon, 18 Dec 2023 20:48:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKXj-00C3gF-2p
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Dec 2023 20:48:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rFKXh-0001h2-EW; Mon, 18 Dec 2023 21:48:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rFKXf-00GmT7-Kp; Mon, 18 Dec 2023 21:48:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rFKXf-005XK5-BY; Mon, 18 Dec 2023 21:48:47 +0100
Date: Mon, 18 Dec 2023 21:48:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guillaume La Roque <glaroque@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>, 
	kernel@pengutronix.de, Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] thermal: amlogic: Two cleanups
Message-ID: <7r2dj6eggv5lb4j7twcooykvahwnyhqay3evqjclu33z47dm7c@guvng32lhvtj>
References: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_124851_913205_4B0F1D14 
X-CRM114-Status: GOOD (  10.82  )
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
Content-Type: multipart/mixed; boundary="===============1602972459748023712=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1602972459748023712==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdaskvvreg6ybvsg"
Content-Disposition: inline


--kdaskvvreg6ybvsg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 16, 2023 at 12:26:34PM +0100, Uwe Kleine-K=F6nig wrote:
> while rebasing my patch stack to v6.7-rc1 I spotted these two patch
> opportunities for the amlogic thermal driver.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (2):
>   thermal: amlogic: Make amlogic_thermal_disable() return void
>   thermal: amlogic: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions

gentle ping! Is there a chance these patches make it into v6.8-rc1?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kdaskvvreg6ybvsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWAsC4ACgkQj4D7WH0S
/k4HOQf/d2TKH9Kv+h5Y+EiK234Xli8lpNbzNN3mB1J3KCVAyHeYVFJh+kkXjN/Y
t79hpexVXl5IJGLHHddDd1Qvv/fVC3in7h6vXEa44dqxpRCtMV23+zux3UXvZPfr
X/w49Ufsu0jwGQjYMr0p0yt949QNY2u+Pl7mod0Z/m0q63hCk7aG9XpgoCOZ1C4E
eS2b4k2X252WUR/dJUTHgrPIV3znpRotrP79FgbsnPmWbCVY26hljzzMYFj3YX/f
HTZ9JC8JgfkIPAr94s0mJcMZoC+qobMgGbUO+7ugVOtmjiE0Cmg6iL9FqqDCrh0M
Rt8kqVbF//la/b2B0Ahjauq/30FePg==
=Ix8U
-----END PGP SIGNATURE-----

--kdaskvvreg6ybvsg--


--===============1602972459748023712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1602972459748023712==--

