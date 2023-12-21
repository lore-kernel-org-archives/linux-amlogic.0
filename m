Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7512C35274
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 22:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI7ZfeOfpNn338EA0rFcNzlfzh/dRJRM5qSvML1ZRW8=; b=xVCGwngcvOky9o+hGwP4Sygybs
	AwGyqBCR2QzrToBkJF+9BNgXkkA1GfjSSAh4wlh8HYUMDnsRx/AqybhaRMUNwbehH2DXq+3v61n7u
	84TopqMMGL0FlcYOmL0XPE6CVkaO6VFmnJuGlI+NA+762UgPRwXmCij7aKZJPy2YG9aIqTo9d6eeX
	AmgpWFQKl0WwuzhgnlQqv8ahKUYlQ1+1RKyR1omzpqVLao082AQBxMSBzc24MqRwaws9D6I9S3OLP
	yQSHlq4w6nQaBLF/E8jNx3URA6gAjrtssVTl9go96ko5fdv3LJwxL9LXDpPw6eyjeQ3T6zPnx/+X1
	ChloCdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGR8L-004Gpc-1G;
	Thu, 21 Dec 2023 22:03:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGR8I-004Gn7-0k
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Dec 2023 22:03:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGR8A-0001t9-Gh; Thu, 21 Dec 2023 23:03:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGR88-000cTa-9B; Thu, 21 Dec 2023 23:03:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGR89-001VMX-2K; Thu, 21 Dec 2023 23:03:01 +0100
Date: Thu, 21 Dec 2023 23:03:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-pwm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
Message-ID: <tek6c6symqgm6x6ujh4m67q32en24pzrkjbchffir7qljo4gor@7qpu4zmgyzpq>
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_140310_269044_07E356FF 
X-CRM114-Status: GOOD (  40.93  )
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
Content-Type: multipart/mixed; boundary="===============6826039430644657745=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6826039430644657745==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6ioofttr44jizjg"
Content-Disposition: inline


--l6ioofttr44jizjg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 10:12:22PM +0100, Martin Blumenstingl wrote:
> Odroid-C1 uses a Monolithic Power Systems MP2161 controlled via PWM for
> the VDDEE voltage supply of the Meson8b SoC. Commit 6b9352f3f8a1 ("pwm:
> meson: modify and simplify calculation in meson_pwm_get_state") results
> in my Odroid-C1 crashing with memory corruption in many different places
> (seemingly at random). It turns out that this is due to a currently not
> supported corner case.
>=20
> The VDDEE regulator can generate between 860mV (duty cycle of ~91%) and
> 1140mV (duty cycle of 0%). We consider it to be enabled by the bootloader
> (which is why it has the regulator-boot-on flag in .dts) as well as
> being always-on (which is why it has the regulator-always-on flag in
> .dts) because the VDDEE voltage is required for the Meson8b SoC to work.
> The public S805 datasheet [0] states on page 17 (where "A5" refers to the
> Cortex-A5 CPU cores):
>   [...] So if EE domains is shut off, A5 memory is also shut off. That
>   does not matter. Before EE power domain is shut off, A5 should be shut
>   off at first.
>=20
> It turns out that at least some bootloader versions are keeping the PWM
> output disabled. This is not a problem due to the specific design of the
> regulator: when the PWM output is disabled the output pin is pulled LOW,
> effectively achieving a 0% duty cycle (which in return means that VDDEE
> voltage is at 1140mV).
>=20
> The problem comes when the pwm-regulator driver tries to initialize the
> PWM output. To do so it reads the current state from the hardware, which
> is:
>   period: 3666ns
>   duty cycle: 3333ns (=3D ~91%)
>   enabled: false
> Then those values are translated using the continuous voltage range to
> 860mV.
> Later, when the regulator is being enabled (either by the regulator core
> due to the always-on flag or first consumer - in this case the lima
> driver for the Mali-450 GPU) the pwm-regulator driver tries to keep the
> voltage (at 860mV) and just enable the PWM output. This is when things
> start to go wrong as the typical voltage used for VDDEE is 1100mV.
>=20
> Commit 6b9352f3f8a1 ("pwm: meson: modify and simplify calculation in
> meson_pwm_get_state") triggers above condition as before that change
> period and duty cycle were both at 0. Since the change to the pwm-meson
> driver is considered correct the solution is to be found in the
> pwm-regulator driver which now considers the voltage to be at the
> minimum or maximum (depending on whether the polarity is inverted) if
> the PWM output is disabled. This makes the VDDEE regulator on Odroid-C1
> read 1140mV while the PWM output is disabled, so all following steps try
> to keep the 1140mV until any regulator consumer (such as the lima
> driver's devfreq implementation) tries to set a different voltage
> (1100mV is the target voltage).
>=20
> [0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126=
=2Epdf
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Sending this as RFC as I'm not 100% sure if this is the correct way to
> solve my problem. Reverting commit 6b9352f3f8a1 (which I found via git
> bisect) also works, but it seems hacky.
>=20
> Once we agreed on the "correct" solution I will add Fixes tags as needed
>=20
>=20
>  drivers/regulator/pwm-regulator.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-re=
gulator.c
> index 2aff6db748e2..30402ee18392 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -157,7 +157,12 @@ static int pwm_regulator_get_voltage(struct regulato=
r_dev *rdev)
> =20
>  	pwm_get_state(drvdata->pwm, &pstate);
> =20
> -	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
> +	if (pstate.enabled)
> +		voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);

That part looks fine. pwm_get_relative_duty_cycle() is only sensible for
an enabled PWM.

> +	else if (max_uV_duty < min_uV_duty)
> +		voltage =3D max_uV_duty;
> +	else
> +		voltage =3D min_uV_duty;

This could be abbreviated to:

	else
		voltage =3D min(max_uV_duty, min_uV_duty);

which you might find easier or harder to read.

Note this isn't save in general. You're implicitly assuming that a
disabled PWM runs with the minimal supported duty_cycle. Most disabled
PWMs yield the inactive level (which corresponds to a 0% relative duty
cycle). But there are exceptions. Also if your regulator has

	pwm-dutycycle-range =3D <20 80>;
	pwm-dutycycle-unit =3D <100>;

a 0% relative duty cycle yields an undefined voltage.

Without claiming to understand all implications, I'd say
pwm_regulator_get_voltage should signal to the caller when the
duty_cycle isn't contained in [min(max_uV_duty, min_uV_duty),
max(max_uV_duty, min_uV_duty)].

With that implemented, I'd just do:

	if (pstate.enabled)
		voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
	else
		/*
		 * We're assuming here that a disabled PWM yields a 0%
		 * relative duty cycle. This isn't true in general
		 * however. Maybe issue a warning here?!
		 */
		voltage =3D 0;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--l6ioofttr44jizjg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWEthMACgkQj4D7WH0S
/k7UIQgApKi4in2vH7decUs7lY1PFncW1ev1DhJHTIe0D0UOl1TXRJLavxEwskAZ
4554tAUjYup0iGhsldqA48DuxyOF6yrY7B6uDdD8SqjjzEchfPw086keZHfpJ78M
le0PzMOQXC0QmOSCrptFeKttyuksyEi6t8QoC9vv5a4k8d4brHaUfondRlYGfzOc
KTfIgYX1nGi5T2W3zZeUx4RN1ul9i4OE+C0VkDV2GX/rHdy2PasejqTiupFsl3Ow
FMP/dnmxt4FfGYoCqOMcDyZncHjeb4FDYGDN+d5rdrqvNioJd4J4FAp7Z6ZUHTqF
rHrUpD2+uRLYmT4AQ7ANL/OqX6cxpw==
=bcdo
-----END PGP SIGNATURE-----

--l6ioofttr44jizjg--


--===============6826039430644657745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6826039430644657745==--

