Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4D9EB64D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78IMltJIGANCGS5S7DduSZh8O1KRea0tGpmOtjuFnKs=; b=niGCCYCCtuBlxzuLxefGrofOo5
	df543Jbo9+zXb20P2PDBpn4z81BCFhTzFyC2vL+/q6qTOUx9ZewjBaj/VbxMKZ3uBkbRKFRo/Ru2D
	eC9GsCH10fgDPtl2kBZwFGHXlNR+/uLKwJW5eQ7UuMncKp/BxQkfyKeKGL1ZCrrJFWn/HQKw9Cim5
	S3ZHenrA5FvLCq1ypk+eWjpO9bgSTaPho85H5FrSNPPVv5ltNCGlnLf5rxoPH5zxlD8DRONb9wUuo
	Ywkz9pAM/hYGwKi4vPdSSQ1VqvwBdyU83AB9qN7Cv2b2tY1sbXtHa+0Zhi+XpIq9gvLOg15sW3dkD
	jjU5B3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWj8-00H8HI-1r;
	Wed, 12 Jul 2023 10:05:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWj5-00H8GA-2k
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jul 2023 10:05:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWix-0007B6-E8; Wed, 12 Jul 2023 12:05:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWiu-00DrBe-B9; Wed, 12 Jul 2023 12:05:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWit-004Gd7-DD; Wed, 12 Jul 2023 12:05:27 +0200
Date: Wed, 12 Jul 2023 12:05:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/27] thermal/drivers/amlogic: Convert to platform
 remove callback returning void
Message-ID: <20230712100527.33gei4nyfvejhy2q@pengutronix.de>
References: <20230712081258.29254-1-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230712081258.29254-1-frank.li@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_030539_926653_EC5F735A 
X-CRM114-Status: GOOD (  22.78  )
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
Content-Type: multipart/mixed; boundary="===============4125997027405748985=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4125997027405748985==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="st54h4lvkk4iirjp"
Content-Disposition: inline


--st54h4lvkk4iirjp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 04:12:32PM +0800, Yangtao Li wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/thermal/amlogic_thermal.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_=
thermal.c
> index 756b218880a7..a95c8959e5af 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -293,11 +293,11 @@ static int amlogic_thermal_probe(struct platform_de=
vice *pdev)
>  	return ret;
>  }
> =20
> -static int amlogic_thermal_remove(struct platform_device *pdev)
> +static void amlogic_thermal_remove(struct platform_device *pdev)
>  {
>  	struct amlogic_thermal *data =3D platform_get_drvdata(pdev);
> =20
> -	return amlogic_thermal_disable(data);
> +	amlogic_thermal_disable(data);

I'd make amlogic_thermal_disable() return void, too.

Otherwise looks ok.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--st54h4lvkk4iirjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSueuYACgkQj4D7WH0S
/k6IaAf/Tc1hMZUjWFoPJ7YHR9dJiBEfDNwycNw/iawByqBJErgwBllns9wyhBHd
Wiu2QAHKEZeJSvbwP0g8gAeKMLk3WKaooWUBGtcJiMG29HfcO/INO1BG+g08xJrB
615/bLjUCoamEQeuJqBa7Fs06D1FOqDw4SZ9p0HUtIar2m6Ws3C6/0EJvbwFOguK
UfsG8QnTXtjerJwHyBYViU9h3S41acOY2mpNXzgVwjk5xMwaUD2vdPQPklxBXuLN
rhc7DG7PgJ8nKfTBw6xKmPv9d/Bnke6YuUnd4U2fAoWscznbEmRUl3EcFKhQA8vu
qxycJcrx1/j2Gsv0fAkDaXP1lR9xdQ==
=EaAv
-----END PGP SIGNATURE-----

--st54h4lvkk4iirjp--


--===============4125997027405748985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4125997027405748985==--

