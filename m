Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865BDC47DDF
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8uiEhPQnRmTyRCk9K6MrsSYortdVNbYfpZ4Yu60sNI=; b=t05yUMEZYb20Q926cnxGa5UARj
	wdHIs9QUCCKrPIzm8R+ME3VYxnyWyae/l0IoBO78Yxa/+k5Gkwqrl/o8f75MMmk5YyA966EJ654Ap
	PekPM47ikZk+z3vsv+IZR4xwBR324y8eKCUXwqN0w+uFauwkB6VhiZA68e+h6Au0nu7aUk6jHhfAo
	3bdbw2cVG5sTdOirMKE+cRCXNroedokXAc59N1EirRk/JTxYyS0+otIM/r2p0Nh57St3L35VZEqv8
	/AjZcQlPnwIgReVESM4mEwhvsD85Nr4HBnxAKGOO/vbczF18aldN8ohPJufr4MP7/F8kXRu3GtKaf
	ih9XgxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ9o-00267s-2y;
	Wed, 24 Jan 2024 09:02:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ9l-002665-2f
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 09:02:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZ9d-0001F3-HK; Wed, 24 Jan 2024 10:02:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZ9c-00217d-KQ; Wed, 24 Jan 2024 10:02:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZ9c-0070Sy-1j;
	Wed, 24 Jan 2024 10:02:40 +0100
Date: Wed, 24 Jan 2024 10:02:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 5/6] pwm: meson: don't carry internal clock elements
 around
Message-ID: <gyhea42rtydw3g45lfkfbxfm6xcbwibz67vw7xke2sm7powz2a@i33g4pyanu4l>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-6-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231222111658.832167-6-jbrunet@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_010249_879654_B4F05ABD 
X-CRM114-Status: GOOD (  21.02  )
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
Content-Type: multipart/mixed; boundary="===============2808661506761808059=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2808661506761808059==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h373wi4nrohxmd3v"
Content-Disposition: inline


--h373wi4nrohxmd3v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 12:16:53PM +0100, Jerome Brunet wrote:
> Pointers to the internal clock elements of the PWM are useless
> after probe. There is no need to carry this around in the device
> data. Just let devres deal with it.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pwm/pwm-meson.c | 67 ++++++++++++++++++++++++-----------------
>  1 file changed, 39 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 15c44185d784..fb113bc8da29 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -90,9 +90,6 @@ struct meson_pwm_channel {
>  	unsigned int hi;
>  	unsigned int lo;
> =20
> -	struct clk_mux mux;
> -	struct clk_divider div;
> -	struct clk_gate gate;
>  	struct clk *clk;
>  };
> =20
> @@ -442,6 +439,13 @@ static int meson_pwm_init_channels(struct device *de=
v)
>  		struct meson_pwm_channel *channel =3D &meson->channels[i];
>  		struct clk_parent_data div_parent =3D {}, gate_parent =3D {};
>  		struct clk_init_data init =3D {};
> +		struct clk_divider *div;
> +		struct clk_gate *gate;
> +		struct clk_mux *mux;
> +
> +		mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> +		if (!mux)
> +			return -ENOMEM;

I don't like this change. While it doesn't increase the memory used, it
fragments the used memory and increases the overhead of memory
management and the number of devm allocations.

Are these members of meson_pwm_channel in the way for anything later?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--h373wi4nrohxmd3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWw0i8ACgkQj4D7WH0S
/k683gf9GGBr93JUCS2xEl/m1YAKTTgHqxB2JExfwiC6KJfo/FURTvQbLwW4gtu9
BqujrqKJuEIj5YPmfS2DfmnGEQteeSmoeb6vtHwsKyehVtqSqDOF/1ZPSIakbMdx
hE3kSBmZVCVPwj9s1JoNAlR+AtWRnzVYUdF40iEjJ6VPhWZB9Swh9KJhNfWAuUIg
KxSIivAcwtRrtX9ThjzjKj5sPWGqdaVGTFxir66leKCCmsboGdDOAV60d39u0bSY
cDXdp36+vG5DQh1bpjAUE7S/+URvABaCmV8CKBRpMSfyxLo9M65b8VlZS1Q36pl0
ljk2vMhvu45fpewQYEgUv6kO82pUfw==
=J1Jy
-----END PGP SIGNATURE-----

--h373wi4nrohxmd3v--


--===============2808661506761808059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2808661506761808059==--

