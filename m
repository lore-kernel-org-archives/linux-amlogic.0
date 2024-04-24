Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C74C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dkZZfiV67YCsXWReLXD9kXjP2dZuRxD/w+NriQZtK4=; b=XCzQm+OjsgxSUrn14ftSHUl3cz
	4qNM88i+A7KCeDmb1c7QW8MX60LP/ohtTwrIjfRkJGK+6Q8kQuXJ/1NyGBvCnpdHz+J6EfoQ1SzU6
	GOyiJNfcxHKqGNloD70JvCPPn5RJkz3MJNI0r6uAPBIvag06nM4jXpcIGYmdJB+54sn2EmyEysYJu
	P0EEpFzL7zTjUjdDQI0M3zmY/mzOOd4riltjI2CLfeKx7QnC1PDVakU4iw8itHHRF2igHk7rkRxC7
	W6y0fDinMueb8r5LLwX67q4t2cQRiujcCR+S1jMJgnovcdzPN6jJPqMvoCGPiiSgTf2fcAsqz4qSr
	9oPNO6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdSp-00000004SU1-3Ovz;
	Wed, 24 Apr 2024 14:19:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdSn-00000004SSn-0AYj
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Apr 2024 14:19:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzdSj-0003vP-Nj; Wed, 24 Apr 2024 16:19:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzdSi-00E638-Nf; Wed, 24 Apr 2024 16:19:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzdSi-007q8K-23;
	Wed, 24 Apr 2024 16:19:04 +0200
Date: Wed, 24 Apr 2024 16:19:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, thierry.reding@gmail.com, hkallweit1@gmail.com, 
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com, 
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH v2 2/2] pwm: meson: Add check for error from
 clk_round_rate()
Message-ID: <xb2prc5ewslr74eh22xo4heeiepeiu4rb72zekuatcuhp45p6s@nhwhnq26tthg>
References: <20240424132408.2565916-1-gnstark@salutedevices.com>
 <20240424132408.2565916-3-gnstark@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240424132408.2565916-3-gnstark@salutedevices.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_071909_113076_2D390151 
X-CRM114-Status: GOOD (  19.98  )
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
Content-Type: multipart/mixed; boundary="===============7440383179761252999=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7440383179761252999==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fikxshr2mxc6iptg"
Content-Disposition: inline


--fikxshr2mxc6iptg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 04:24:08PM +0300, George Stark wrote:
> clk_round_rate() can return not only zero if requested frequency can not
> be provided but also negative error code so add check for it too.
>=20
> Also change type of variable holding clk_round_rate() result from
> unsigned long to long. It's safe due to clk_round_rate() returns long.
>=20
> Fixes: 329db102a26d ("pwm: meson: make full use of common clock framework=
")
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  drivers/pwm/pwm-meson.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index f4d70da621ec..d4228ac1e7ea 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -148,7 +148,7 @@ static int meson_pwm_calc(struct pwm_chip *chip, stru=
ct pwm_device *pwm,
>  	struct meson_pwm *meson =3D to_meson_pwm(chip);
>  	struct meson_pwm_channel *channel =3D &meson->channels[pwm->hwpwm];
>  	unsigned int cnt, duty_cnt;
> -	unsigned long fin_freq;
> +	long fin_freq;
>  	u64 duty, period, freq;
> =20
>  	duty =3D state->duty_cycle;
> @@ -168,9 +168,10 @@ static int meson_pwm_calc(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  		freq =3D ULONG_MAX;
> =20
>  	fin_freq =3D clk_round_rate(channel->clk, freq);
> -	if (fin_freq =3D=3D 0) {
> -		dev_err(pwmchip_parent(chip), "invalid source clock frequency\n");
> -		return -EINVAL;
> +	if (fin_freq <=3D 0) {
> +		dev_err(pwmchip_parent(chip),
> +			"invalid source clock frequency %llu\n", freq);
> +		return fin_freq ? fin_freq : -EINVAL;
>  	}
> =20
>  	dev_dbg(pwmchip_parent(chip), "fin_freq: %lu Hz\n", fin_freq);
                                                   ^
With fin_freq now being unsigned, this ------------' should be a 'd'.

If you want to still extend your fixes series: A bit further below there
is

	cnt =3D div_u64(fin_freq * period, NSEC_PER_SEC);

=2E The multiplication there might overflow. This should better use
mul_u64_u64_div_u64() (or one of it's variants).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fikxshr2mxc6iptg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYpFNcACgkQj4D7WH0S
/k6FHwgAgAJd3kevEdN/itUIoFGC4HyfsHU4mupmXhK8vQlLQeSLp88NOl8o4aq1
krOsXkTeyPpYboayP13PMoNCEalGdGz0u1O6YRT7zhNmjTgho+BDeC5aYheIFNEr
sBop9BWBnlUWXxKJNvv89YVYJX8/gm1lYUbJ+aY5cp4x1Sima7d81bIU6XGrKwZu
Kay2eRvXf9c8F2WpSNhTS/NlQWOFZYHUQujWJKBUOQuIc6g9q916JnX9MalzD25a
3sP5sShWiSiNdGJ0Z9oVqmWU4O4A9o3WZHYWg3mZme79PTQdVIO9oIcOMMUOiKm/
t754lFYORol+j34xFOkG3l1bcOnwpg==
=xYuN
-----END PGP SIGNATURE-----

--fikxshr2mxc6iptg--


--===============7440383179761252999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7440383179761252999==--

