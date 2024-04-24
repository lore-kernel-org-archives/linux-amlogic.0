Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F8C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 07:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UCBW2Sb3WZRVRcHUsuMBXznyWklEmu1wG1hgd4YEnA=; b=S8Pg1goesnRueZxBjShi934nRD
	3ffnvI4A3yATEfoh9VuENMbcl36K0lo1U5UfUjumdTfHwpEL0zPoURrr7wHR3Y+/6NqxiI+ML9tl0
	RMeYkF/363e2ZwsEvO8MSk9rb8GH7a8s0nDvuQGpWzCWiBtI+VzX2+GG58mWw+kr8idQlmVytVyRy
	kRB9MuwqlFmCAPHGVXF/b/dFlphBT7GdadsW1pCQcmh1kTNLsXG9YsuOkEIY6iEITYii+9wpSL1hR
	j/DjJ59SI+Sg5x5cXcTfvaLmzO8X5NNibguCVc4HmgFi1cLet3DFGBteZ7uv+GESSrwoSYq1JSsgk
	E30S7ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWot-000000033Ep-42co;
	Wed, 24 Apr 2024 07:13:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWoq-000000033E5-2ZH0
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Apr 2024 07:13:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzWon-0000Qw-CI; Wed, 24 Apr 2024 09:13:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzWom-00E2Nk-5q; Wed, 24 Apr 2024 09:13:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzWom-007ftQ-0F;
	Wed, 24 Apr 2024 09:13:24 +0200
Date: Wed, 24 Apr 2024 09:13:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, thierry.reding@gmail.com, hkallweit1@gmail.com, 
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com, 
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH 2/2] pwm: meson: add check for error from clk_round_rate()
Message-ID: <egrt5wtiulo7ovnxkgyxaaopyfbwsnmy6ire26vukj6kyaiuki@gkzflkoxmjwb>
References: <20240423161356.2522636-1-gnstark@salutedevices.com>
 <20240423161356.2522636-3-gnstark@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240423161356.2522636-3-gnstark@salutedevices.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_001328_670833_F8375B6D 
X-CRM114-Status: GOOD (  18.18  )
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
Content-Type: multipart/mixed; boundary="===============3390832983452070736=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3390832983452070736==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qnio7x5dn2l5fiqc"
Content-Disposition: inline


--qnio7x5dn2l5fiqc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 23, 2024 at 07:13:56PM +0300, George Stark wrote:
> clk_round_rate() can return not only zero if requested frequency can not
> be provided but also negative error code so add check for it too.
>=20
> Fixes: 329db102a26d ("pwm: meson: make full use of common clock framework=
")
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/pwm/pwm-meson.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index ebe76298f6e2..52604635b31e 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -168,9 +168,10 @@ static int meson_pwm_calc(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  		freq =3D ULONG_MAX;
> =20
>  	fin_freq =3D clk_round_rate(channel->clk, freq);
> -	if (fin_freq =3D=3D 0) {
> -		dev_err(pwmchip_parent(chip), "invalid source clock frequency\n");
> -		return -EINVAL;
> +	if (fin_freq <=3D 0) {

fin_freq is an unsigned long, so your change doesn't have the intended
effect.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qnio7x5dn2l5fiqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYosRIACgkQj4D7WH0S
/k777wf/YOQM3/Dxt9O6SoVOz6MFbrovsT52w/n56bi6J1XQp845Y2b4HfQKqObS
ZKMnklknnVoOSRAJyuPtD3asa/pnZjZMTNzFomshqjlMGZGH7L8iXrpbbcxYegG2
t028M81HcjNPNLcYobkNJIaBGz4/XyIL0RtkoIb6KC/jtNWo7l1vmgoNos9i7ooD
Z9omjRL7BUfu7Df78FL/fTBBSKTiNB6Qez1TrvQusNWFquJGJ1EoZXgIK8KXKvua
qC8nZE3AOGp3aPIDtOxM98b729+2lCpIv2I2TLxxcnBXTMxzHaEfCtQckFxa9TNW
PgTEnXpzsCjbu0YPeDDXFB4kQWyhjQ==
=opt7
-----END PGP SIGNATURE-----

--qnio7x5dn2l5fiqc--


--===============3390832983452070736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3390832983452070736==--

