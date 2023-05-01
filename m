Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22423C77B73
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAqj5lx7gomzHmlQkgthiGNHnV67opmQYmb+K//KnZU=; b=qi/lDaj8Ku2uKr362RlYQi1CSF
	NsGPdrIYIezuXmc5kuS8M0Cjp2nBIOvZ6rweN5r5chbctWWOjqVLH5CHo5GugzfUe2ULUGwPyXptK
	55I53hdkhrLfs+3EGyhQVBcxZ2KfFVW2gD9xGNw+Pr7EmQjSr7ihYjca+LNHqSZDCLPJAP8q1TrVd
	bB8hJ6uJ0fMEdfqT2V3Bb6UK+Lkjq2Kx/34/nKjFz2GGNeXjrzYGCTQF3S3E7QIejET3kuUpiFkAR
	1C5xF3nAi0hSR+oaJjfpMD8gru64K6/bPmcsoWCfNFSK2dA10bLv3UK+2ViNXYX9ltkpwGK/De5s1
	1Yr+8psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXwb-00GWKa-2C;
	Mon, 01 May 2023 18:08:13 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXwW-00GWDf-1O
	for linux-amlogic@lists.infradead.org;
	Mon, 01 May 2023 18:08:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ptXwO-0000Hu-Nu; Mon, 01 May 2023 20:08:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ptXwN-000Phh-HH; Mon, 01 May 2023 20:07:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ptXwM-000Qpu-SH; Mon, 01 May 2023 20:07:58 +0200
Date: Mon, 1 May 2023 20:07:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [PATCH v2] pwm: meson: modify and simplify calculation in
 meson_pwm_get_state
Message-ID: <20230501180755.mxua3owqyaa26jnq@pengutronix.de>
References: <f48f17a7-7f50-c5ef-cc8f-007d0cb302b0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f48f17a7-7f50-c5ef-cc8f-007d0cb302b0@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_110808_473169_32ABC517 
X-CRM114-Status: GOOD (  23.79  )
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
Content-Type: multipart/mixed; boundary="===============1333854446071534261=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1333854446071534261==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vvdvozl3dpnek3cg"
Content-Disposition: inline


--vvdvozl3dpnek3cg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 04:03:16PM +0200, Heiner Kallweit wrote:
> I don't see a reason why we should treat the case lo < hi differently
> and return 0 as period and duty_cycle. The current logic was added with
> c375bcbaabdb ("pwm: meson: Read the full hardware state in
> meson_pwm_get_state()"), Martin as original author doesn't remember why
> it was implemented this way back then.
> So let's handle it as normal use case and also remove the optimization
> for lo =3D=3D 0. I think the improved readability is worth it.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - improve commit description
> ---
>  drivers/pwm/pwm-meson.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 5732300eb..3865538dd 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -351,18 +351,8 @@ static int meson_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>  	channel->lo =3D FIELD_GET(PWM_LOW_MASK, value);
>  	channel->hi =3D FIELD_GET(PWM_HIGH_MASK, value);
> =20
> -	if (channel->lo =3D=3D 0) {
> -		state->period =3D meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
> -		state->duty_cycle =3D state->period;
> -	} else if (channel->lo >=3D channel->hi) {
> -		state->period =3D meson_pwm_cnt_to_ns(chip, pwm,
> -						    channel->lo + channel->hi);
> -		state->duty_cycle =3D meson_pwm_cnt_to_ns(chip, pwm,
> -							channel->hi);
> -	} else {
> -		state->period =3D 0;
> -		state->duty_cycle =3D 0;
> -	}

The last else branch is even wrong, isn't it? .apply() can for a greater
than 50% relative duty cycle well have lo < hi, right? So this is not a
mere optimisation but a fix?!

> +	state->period =3D meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel-=
>hi);
> +	state->duty_cycle =3D meson_pwm_cnt_to_ns(chip, pwm, channel->hi);

Note that meson_pwm_calc() has a similar construct that can be
simplified in a similar way. All three variants have

	channel->pre_div =3D pre_div;

and the last else branch is universal and can replace the others.

Another issue I just spotted is that

	duty =3D state->duty_cycle

is wrong for state->duty_cycle > UINT_MAX. (Ditto the assignment to
period.) Making both duty and period u64 shoudl fix that. After that
duty_cnt > 0xffff cannot happen as the core ensures that duty_cycle <=3D
period.

Having said that, the proposed change here is an improvement, so:

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I also suggest to add a Fixes line, i.e.

Fixes: c375bcbaabdb ("pwm: meson: Read the full hardware state in meson_pwm=
_get_state()")

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vvdvozl3dpnek3cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRP//sACgkQj4D7WH0S
/k5Rvwf+O4L+eigYOx0jJWJjNpwYBm2YwlrM0ehhHYdVivCyyhteAmv2I9PAhwCI
KZSENuJxvdpFgef//bQcZCttZwL1f99N8fxZfXfhwgjtIILmGroU+pPTMf1tJndJ
gz1ypolDq+YWeAAmjaXFTjfr+0JL0bhgLPk+CkFTg555YEz66HTlf2DOwFRRjsSz
mz3fWodfpOFPT65NUEu6kySTiyElB+roFfcp4kwfrXNArCh9xlZdtJeEypeXmzom
EKgXutkE8Ue1M4hfamvuYe8AY3XEGpnxPepE0Q/xgv78oL8+FzoPHOBDETS0YiDu
WeiVfwwAo31NESJz01uqMDnNNKStTw==
=aohK
-----END PGP SIGNATURE-----

--vvdvozl3dpnek3cg--


--===============1333854446071534261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1333854446071534261==--

