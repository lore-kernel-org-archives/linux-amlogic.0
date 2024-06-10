Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F101C27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anXaHI9W25mtSSxlKlYpWl52NPGnYjsCyhu5G62BTTg=; b=QdcZ4HJnBUMretvWNQqS/oQuqI
	6vvGY+1lbz7hnBTkuqTl4kRZkFl0QkotOwI7GzRA3y9M99E1In1zP2PXakQvLwkqMUFTc8c8yATUh
	K5mc7PPyqsMe+AVGj6bbUn2JrZ+0dnk/pG3iTCWY1Cubkl4M5p9P6ra35fOhb+IFYE2Q8F03VZEhe
	uFCEjay2v7eaCEOZYYXrQqKwke5Xw/McMId77+v60CQdzFrGdJfoL+BvBQqTDpBh03Ikcc/FTc7sQ
	N5J1fK5CrVxVSJdEEDVe1cwFJyQN9PmaX6hkzIYYFjZnSgUO0gBWC/MvAeBg9Gxvl/6FKVnk/OrQP
	aX1K8weA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbqX-00000004Xlg-08of;
	Mon, 10 Jun 2024 10:01:49 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbqT-00000004XkA-00Rm
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 10:01:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57c6afa1839so1060999a12.2
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718013703; x=1718618503; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qlO3qdFuRXqKhljshkW+FX9ohtZlehsVLztsRtWfBuY=;
        b=PSLigESMRqmkSUx23i8RnOugNY4eYfTogvYYOkebtV0owofF4BQjgY2ql+24OfYhdL
         CYqSoZTGIcM4flp8lEQlVFo1ZqxAGpDZqBnXbEuoTZXSZtvY5hZNMjPm7wu2XX1e0yDj
         +/zKS23rC12AuwuMDxOM5sDgYPOszs9GnmAaGetw9Q8YQ8sf36d/DAl7C5EWnjkx5Fme
         m7BUmwFgIuYKvVECfJ3gCb7k7JBawv4zxjv7c7mp86Us/3NLGVdNzhDlQxZMDTnzBdM+
         lk4npo7adrik1L5f2T3a0lOaN9079t3kMv94f/Kx/masJAwKw/Bp4poWpho9ZH0uR9AF
         rfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718013703; x=1718618503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlO3qdFuRXqKhljshkW+FX9ohtZlehsVLztsRtWfBuY=;
        b=HGm4CCcW9GqnqVXGcbH60ZgKU5r02ybh72kn0wTDLqtZAfoB/RdFUpCrQ7ZVJzXDZk
         wCdOSKjUmH13IjntEWkZ78ejqZkkXMFrdj3ffbOJssbml9NdDruZ+l5ewHdvcixE+RR1
         hwzf5Jr+0TFMgZQNbDICEzI516JSTwLtAZHoLkkAzC28rrtF1QsuI2YXDNQ2MNx4A0eu
         s+wFXHh5f786Py/oJF86EwF6RKTzAtxibGLwwaOzi2qwLctkAm2LCnkwQiXQDrxZDsSx
         icVCBkYmLmZwCZ6rOUFf7nSmU6nZATon28rwttmhGmoeWGToxCXDBrwqRB6t5FqaaZ6D
         84TA==
X-Forwarded-Encrypted: i=1; AJvYcCUHyDDKZPS95nWKzN7nwtfTxR8k3iSxMex2rQuw3Mz5+lxdplQ8Xovi5RS1tDIV9umNtZIKdD1K7V5wjJt5QtvObnyHZZFjYrd/k3imdfMqfUg=
X-Gm-Message-State: AOJu0YyaIsBbq3EgNttZ9caNbUg7kWDCRfQeH1bpCKpQx6xZVKgM7Czc
	4SqDHXE9PLyDyS3OBVOQdVkUf7RWVpgbR+DxOUmu2dsEqM5e4eogt3kXgv/lwh0=
X-Google-Smtp-Source: AGHT+IEQn4kiyQuPDHL0x5+ZXCOUbPh3JXB6pe91ho0VaNjqUpRKHCI1IHTq+6t/iyZMr7K/3OywTw==
X-Received: by 2002:a50:871e:0:b0:57c:5fc8:c95e with SMTP id 4fb4d7f45d1cf-57c5fc8ca67mr5324103a12.23.1718013702754;
        Mon, 10 Jun 2024 03:01:42 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c7156e6c2sm3570941a12.9.2024.06.10.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:01:42 -0700 (PDT)
Date: Mon, 10 Jun 2024 12:01:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-pwm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Heiner Kallweit <hkallweit1@gmail.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [RFC PATCH v2 3/3] regulator: pwm-regulator: Manage boot-on with
 disabled PWM channels
Message-ID: <hf24mrplr76xtziztkqiscowkh2f3vmceuarecqcwnr6udggs6@uiof2rvvqq5v>
References: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
 <20240113224628.377993-4-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20240113224628.377993-4-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_030145_070887_D2A88450 
X-CRM114-Status: GOOD (  45.98  )
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
Content-Type: multipart/mixed; boundary="===============6841177721733651620=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6841177721733651620==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hr62idwwdqmqmca"
Content-Disposition: inline


--4hr62idwwdqmqmca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Martin,

while doing some pwm related cleanup, I stumbled over the part of the
pwm-regulator driver that was added here. This is either wrong or I
don't understand it.

On Sat, Jan 13, 2024 at 11:46:28PM +0100, Martin Blumenstingl wrote:
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
> .dts) because the VDDEE voltage is generally required for the Meson8b
> SoC to work. The public S805 datasheet [0] states on page 17 (where "A5"
> refers to the Cortex-A5 CPU cores):
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

Maybe pwm_regulator_init_state() needs a similar logic as
pwm_regulator_get_voltage() and then this patch's changes can (and
should) go away?

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
> pwm-regulator driver. Update the duty cycle during driver probe if the
> regulator is flagged as boot-on so that a call to pwm_regulator_enable()
> (by the regulator core during initialization of a regulator flagged with
> boot-on) without any preceding call to pwm_regulator_set_voltage() does
> not change the output voltage.
>=20
> [0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126=
=2Epdf
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes from v1 -> v2:
> - This patch is new and the idea is to keep the voltage regulator
>   description in device-tree as-is (which means: support for 860mV to
>   1140mV). Instead we allow the pwm-regulator driver to preserve the
>   output voltage at boot when enabling the regulator.
> - note: Mark Brown said in v1 "I'd expect a change in the init_state()
>   function". That function is not updated as it's only relevant for
>   regulators with a voltage table - on Odroid-C1 we have a continuous
>   regulator though.
>=20
>=20
>  drivers/regulator/pwm-regulator.c | 33 +++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-re=
gulator.c
> index d27b9a7a30c9..60cfcd741c2a 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -323,6 +323,32 @@ static int pwm_regulator_init_continuous(struct plat=
form_device *pdev,
>  	return 0;
>  }
> =20
> +static int pwm_regulator_init_boot_on(struct platform_device *pdev,
> +				      struct pwm_regulator_data *drvdata,
> +				      const struct regulator_init_data *init_data)
> +{
> +	struct pwm_state pstate;
> +
> +	if (!init_data->constraints.boot_on || drvdata->enb_gpio)
> +		return 0;
> +
> +	pwm_get_state(drvdata->pwm, &pstate);
> +	if (pstate.enabled)
> +		return 0;
> +
> +	/*
> +	 * Update the duty cycle so the output does not change
> +	 * when the regulator core enables the regulator (and
> +	 * thus the PWM channel).
> +	 */
> +	if (pstate.polarity =3D=3D PWM_POLARITY_INVERSED)
> +		pstate.duty_cycle =3D pstate.period;
> +	else
> +		pstate.duty_cycle =3D 0;

This looks wrong. If you assume that a disabled PWM emits the inactive
level (which is wrong in general, but the best we can assume, and this
is already done in pwm_regulator_get_voltage() since patch #2 in this
series), and you want to call pwm_apply_state() without changing that,
you need to do pstate.duty_cycle =3D 0 unconditionally.

Looking at arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts's &vddee I
guess you only tested the pstate.polarity =3D=3D PWM_POLARITY_NORMAL case,
so didn't suffer from the problem above?!

> +	return pwm_apply_might_sleep(drvdata->pwm, &pstate);

This doesn't necessarily has an effect on the PWM. The HW was disabled
before and here we have pstate.enabled =3D false, too. So the only
reliable effect is that pwm_get_state() returns duty_cycle as set above.
That might be worth to be noted in a comment.

Alternatively (and IMHO nicer) just keep the pwm_state around and don't
use the (mis) feature of the PWM core that pwm_get_state only returns
the last set state.

> +}

Best regards
Uwe

--4hr62idwwdqmqmca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZmzwAACgkQj4D7WH0S
/k6jqwf/YKPLdNCMffFnFQXY40SmaMzyxtujekyudUsSX8Pjr7R8h5oN5RZsPyEp
MUWEal/azCoDBcYFx2lDstfKaJNuEVQVPxkTuVcxvys/JsS0g6H523DSfLLsR/AT
5Uipi9rdYvpYvL56SL2CGZv0UpANVOSf8bjo1kiTkfpM1Ss/3Xm2ftHxFzlrg78j
uozemerDpVpuI5RPBTbToPxjTSlp5Vm1KBWTdIffJuHDItMPdr53jWa2qr/sTfNw
t1sZdVgD2285zBmh0wOdkp9HbR3uDpNnqNtd1PH+v3i4ErOT2soyM760/TQS7Ymd
lMcfOQXx3rC+3vleHaTwyVcQGKYpSQ==
=jaEU
-----END PGP SIGNATURE-----

--4hr62idwwdqmqmca--


--===============6841177721733651620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6841177721733651620==--

