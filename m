Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0DAC27C75
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuITP7ujHqBAIrtROKf1UDIjkMzKxJiDj6O4DLWRZWc=; b=OoQJhXOPuVSotlwG9QRTqER169
	WArB11hwBtB/4WmZ0sNhtFAK6wv1V/zDf5qKpeBehC/pmAize4ZTtMVcEPqe2JUC5aTChD+B2F1SC
	CjJMAIHNI3RgEL9BYepWCx4zh3nTFu2IGzHK15hpMQTZsEZNmpKjvNygRavbzcfKBeBqHmDsdMdZB
	jE5x7d/VTxr9KYXwHvMGOHZ7YIJWAyu6A1xbI5BDlK1nGfmG3605qUAXHZasirCGZCk4tUvqPRFIN
	h8IK9ob3be6Eqh1gR/Aro8X8blC2SQ/5enz/ZWGxumU10vdJ8Su3jKb82vpFkMSafsNjjXKC6rVUH
	nzujwoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ2s-0000000BcmE-2EXT;
	Wed, 12 Jun 2024 08:09:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJ2n-0000000BciP-1wsL
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jun 2024 08:09:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a6f09b457fdso356468866b.2
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Jun 2024 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718179758; x=1718784558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKb/vtoIHaAuT7eS6tdIIVHB4rHiCLnX6z8pJYSRJNs=;
        b=Zvu5CDuVYWq/z5rWI92tLQklIRumkzJ4Wf/jF03Sd1n9yO1mGecQ+RMmKCNKRkHMwG
         eLlAP4YhtseGT7TqwmegBmcHlJKQ6LolkLS/GPDcLIg+H/LqjBF0XzKkx4dYILCuNUR8
         CFlkw45ZtAAhTxxcdN7a1r8y2phCrKLmPZEEWNxEGiM00WZKz8iF9QSlKmkW2BbV9XbM
         pNYRtV0auoyDrBDFEkNMENGvFZo6X3cKQ4jubpfyuyVNJqNN+F5htrQcrf9LD/aiPkSK
         OdLj3IsHuxzXlUvjCsv3DC78GaSVOp97toJqDMcaDTLcWweY/dNMN5np1PhSRGSBwfg8
         kEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179758; x=1718784558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKb/vtoIHaAuT7eS6tdIIVHB4rHiCLnX6z8pJYSRJNs=;
        b=ZIurkv36wc1g76XD3uAWuz7rpcezmFtJzsRbLAmy5P8SksFdwTQb2Pki0kZrdXqck5
         Ar5CAipq0wSFp/reHXfAU04oqEmVSPLrWBoGXSxqGbm+Zk18VagRRxpbiXa1PUhV6F1T
         JXrHsskdHRXzfDgXywzKOXJlHxAlGSlXbYVkXCq9PwRbkBJosBSmARhZmNkxb0h2vfgF
         TudB76Jq2XDLXRnE76PCvB4MeXAyYOVo0H2Cr42yWsyTPyNYtf81+o7cQi/yH7Rid1C6
         eFI3+r6uBcbfnAj+WED37/wOlsD7V0OKWDjHfcqF4Q21gzs8gfJCA+REUcjvySU5x+1p
         R9xw==
X-Forwarded-Encrypted: i=1; AJvYcCVTWxOfSo+QDiNCNHOyOgyyWa7VMcWEOLDGxW7dEvnuFEiiuDlfNP6RSXJ683k/8A7D9pTw+6ypZZh9S23D4upyyKN4YJaSOwjrkVoW5NiWefM=
X-Gm-Message-State: AOJu0YxSyy1jpszMdwOkJGShB+kd6fYkiMGZyaqwIybgOBqWOGT9Xa06
	jlQyuLby+qwk/q8oill0BH+YsX141QlQn0NL5ufzu9rV1liNguR5iJtkvSwdTA8=
X-Google-Smtp-Source: AGHT+IEyUqS7xeGpS62654NQBM20ZnTsaBaQtVWFbZpKweR38cT7xpNYg2DKAqfcljsV5Jo8GYnSxQ==
X-Received: by 2002:a17:906:3c47:b0:a6f:1c38:3370 with SMTP id a640c23a62f3a-a6f47fad6b3mr75793666b.36.1718179757867;
        Wed, 12 Jun 2024 01:09:17 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f16427842sm439552466b.100.2024.06.12.01.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:09:16 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:09:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Lucas Stankus <lucas.p.stankus@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
	Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [RESEND][PATCH] iio: simplify with regmap_set_bits(),
 regmap_clear_bits()
Message-ID: <6grkkioyfqvjy37ztevbs7lbkhc4yfvvomwk7jx5qjmrsdihir@mlluicav2cvs>
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_010921_735461_7ECA03B7 
X-CRM114-Status: GOOD (  16.29  )
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
Content-Type: multipart/mixed; boundary="===============3605473572962512149=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3605473572962512149==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kp4epuvmx3jkqhoq"
Content-Disposition: inline


--kp4epuvmx3jkqhoq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trevor,

On Tue, Jun 11, 2024 at 12:52:06PM -0400, Trevor Gamblin wrote:
> Simplify the way regmap is accessed in iio drivers.
>=20
> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>=20
> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>=20
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> CC list got suppressed on first submission, so resending. Sorry about
> that.
>=20
>  drivers/iio/accel/adxl313_core.c              |   4 +-
>  drivers/iio/accel/adxl313_spi.c               |   4 +-
>  drivers/iio/accel/fxls8962af-core.c           |  18 ++--
>  drivers/iio/accel/kxsd9.c                     |   6 +-
>  drivers/iio/accel/msa311.c                    |   6 +-
>  drivers/iio/adc/ad4130.c                      |   4 +-
>  drivers/iio/adc/axp20x_adc.c                  |   5 +-
>  drivers/iio/adc/axp288_adc.c                  |   4 +-
>  drivers/iio/adc/bcm_iproc_adc.c               |   8 +-
>  drivers/iio/adc/berlin2-adc.c                 |  24 ++---
>  drivers/iio/adc/cpcap-adc.c                   |  44 +++-----
>  drivers/iio/adc/fsl-imx25-gcq.c               |  16 ++-
>  drivers/iio/adc/ina2xx-adc.c                  |   3 +-
>  drivers/iio/adc/intel_mrfld_adc.c             |   4 +-
>  drivers/iio/adc/meson_saradc.c                | 101 ++++++++----------
>  drivers/iio/adc/mp2629_adc.c                  |  19 ++--
>  drivers/iio/adc/qcom-spmi-rradc.c             |  50 +++++----
>  drivers/iio/adc/rn5t618-adc.c                 |   5 +-
>  drivers/iio/adc/sc27xx_adc.c                  |  41 ++++---
>  drivers/iio/adc/stm32-dfsdm-adc.c             |  29 +++--
>  drivers/iio/dac/ltc2688.c                     |   5 +-
>  drivers/iio/dac/stm32-dac-core.c              |   5 +-
>  drivers/iio/gyro/bmg160_core.c                |   4 +-
>  drivers/iio/gyro/mpu3050-core.c               |  33 +++---
>  drivers/iio/health/afe4403.c                  |   9 +-
>  drivers/iio/health/afe4404.c                  |   9 +-
>  drivers/iio/health/max30100.c                 |   5 +-
>  drivers/iio/health/max30102.c                 |   5 +-
>  .../imu/inv_icm42600/inv_icm42600_buffer.c    |  14 ++-
>  .../iio/imu/inv_icm42600/inv_icm42600_core.c  |   9 +-
>  .../iio/imu/inv_icm42600/inv_icm42600_i2c.c   |   4 +-
>  .../iio/imu/inv_icm42600/inv_icm42600_spi.c   |   4 +-
>  drivers/iio/light/adux1020.c                  |  13 ++-
>  drivers/iio/light/iqs621-als.c                |   4 +-
>  drivers/iio/light/isl29018.c                  |   6 +-
>  drivers/iio/light/st_uvis25_core.c            |   4 +-
>  drivers/iio/light/veml6030.c                  |   4 +-
>  drivers/iio/magnetometer/ak8974.c             |  11 +-
>  drivers/iio/magnetometer/mmc35240.c           |   8 +-
>  drivers/iio/pressure/bmp280-core.c            |   4 +-
>  drivers/iio/proximity/sx9324.c                |   5 +-
>  drivers/iio/proximity/sx9360.c                |   5 +-
>  drivers/iio/proximity/sx9500.c                |  12 +--
>  drivers/iio/proximity/sx_common.c             |   9 +-
>  drivers/iio/temperature/mlx90632.c            |   4 +-
>  drivers/iio/trigger/stm32-timer-trigger.c     |  34 +++---
>  46 files changed, 273 insertions(+), 351 deletions(-)

I found five more drivers below drivers/iio that could benefit from such
a conversion:

 drivers/iio/adc/ad7173.c                      |  2 +-
 drivers/iio/adc/ti-ads1298.c                  | 13 ++++++-------
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c    |  4 ++--
 drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c |  8 ++++----
 drivers/iio/light/veml6075.c                  |  4 ++--
 5 files changed, 15 insertions(+), 16 deletions(-)

But even without addressing these:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks for picking up my suggestion,
Uwe

--kp4epuvmx3jkqhoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZpV6cACgkQj4D7WH0S
/k5HtQf/VeZ8OLgNz7dXrFmR7AQ9UOUpW7yE/aNJ/0jp+/7SKFUid8kLelq2CIon
ZVEOQoxGVhsBhSmzwJGvZf6cOMAu4nWRuACbap5soHOv/ycOA3QIKizvIGt1TEEh
0/VqnqKzkXb9oxxMVSpN3tbFXRuYlvx7+jpdDVoguOBsVI5jeZb+AXseQscpy/nt
qD1t26pVyaJH3/Rhp0912HRYo6zsvpSCWJ/IssmngcMCXSnCjNUYK8mWeQX+QG47
rd6Yx/Q79PT6dB778e1LYvrOx5QTfFUe1NjjNJP+SjJH8mHE8CRBLdBXAVQJGfMf
tXTZy24yn6DSipC1sqLciFOAvQns1A==
=/peH
-----END PGP SIGNATURE-----

--kp4epuvmx3jkqhoq--


--===============3605473572962512149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3605473572962512149==--

