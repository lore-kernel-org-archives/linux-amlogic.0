Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233C9C77B70
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnZgvw5TUJwAhjjTD3kbskPssU4lVzJDLcS2UhHQ3bw=; b=ZY+okMhyddyttNwkK+QZsvSjNF
	UOaCZHgUw17NI+a8zV/mgSJjgvmRvFl7BZAtyhwQhSExZcTHUgo1zvrl42M/hSk7LoqwOrEmUD7mt
	Kvew4pNAkyAyq+bIkFV0Ze9Q+zurTB2mXGjDEZk3ezyXV8ZQnOkRN5+oifTIyhaM2EMn0p/k+Aycz
	qcojjU3UYF+sNUjbyXUoJib5xlPZIozUgdVvVcll7qzf5zPZ1fZ6ZMNyJJeru96BoStX3LGfwppcI
	0H5130ed1uGQ68nRSAVkIQ4DZjdVxNHYI9/haVNetFqthybum834E6upZVknM4YF9fIH019l6SCJS
	PHuzOANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poKzv-00FUxI-1D;
	Mon, 17 Apr 2023 09:18:07 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poKzs-00FUwJ-0A;
	Mon, 17 Apr 2023 09:18:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94f3df30043so71813266b.2;
        Mon, 17 Apr 2023 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681723080; x=1684315080;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnOiUrSlOjkwJ/PCdyt/fDYs9vgdZj5CIL2URkjgkis=;
        b=ZXy6nZiCQkkHAdkmK+QTIKd8euTv+OnwRIQa5CxswFKlrzAe3UB0TXFSdbDkOxQJJJ
         8ppPAc7vQ8xJw4KS1Ih7mT4mapWbhaqGEguSTPsR5Pj/aRQq7O9yYmF56a21LimyER9V
         f1oi1MKleg3kaQX+NbQ+jGN74S+gRTXhV7Qkzf8TInbOU9kt8dfjEqCdBc8uNWbS+FUi
         zlcUJGs/6bjUBDCHzrndjAgQ5V1wSxsLwokRyEg2FuOe3e4lvx6WOWCh+6E5ea6L6aAU
         2n0MRy/hMXnAli3nJWWigw9ZSiWvTmmtVDh0R3pEIKO3tusrYtqEzitl+0y3b0o8+k8N
         HTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681723080; x=1684315080;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnOiUrSlOjkwJ/PCdyt/fDYs9vgdZj5CIL2URkjgkis=;
        b=EEF0FZ+o5SmAsTCbEB2yVEXaeuzcJhy57y8qw3IlBk3tOcSODutw7Kh7Gkbqd0P9WC
         mWEJO+YGz6HE6dd8BOLqlx/8uH7LNE0xTnHrMFY8k3wJ5yn4W8MMmKsVHJTqFKwPVNQ4
         J6ttnnQSHYWVYP301axV3HF6DAmDR7bz9aCgw/V3qeI4gfK4zuxytrn9cYJLu7CZzEOF
         u23oDI+GRZCeB3zIJhRGYmOI2kWq/NSMsUuXbGCdA6RwUESlZiINd54ej0ZCTPK6OSUD
         xY8kTt2vbQEhIM34Psxs2oa3+K74xa/CuWA3TjsekfZbDRcTFpxTtSpQ4gtBCy6hKBpQ
         JSrg==
X-Gm-Message-State: AAQBX9ePQRsO2GGLllUQTI3c9gNg/83YCMMnZssrsr9k954VyGeeND+3
	O6pgMFptJcNCsm+qWtfeHpc=
X-Google-Smtp-Source: AKy350bLypDyZYiwmOfVMXJ/w1f11DKhG+GkKEVp8W0HDqIqtvntxyHcXVWSBmmFnEtVjG60t3/N+w==
X-Received: by 2002:a05:6402:219:b0:506:8632:6696 with SMTP id t25-20020a056402021900b0050686326696mr8900555edv.16.1681723079483;
        Mon, 17 Apr 2023 02:17:59 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p24-20020a170906615800b00923f05b2931sm6335951ejl.118.2023.04.17.02.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 02:17:59 -0700 (PDT)
Date: Mon, 17 Apr 2023 11:17:57 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock
 framework
Message-ID: <ZD0OxV_VOWcS7URd@orome>
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
 <ca531c1a-3c62-5fb1-6765-68ec1e541483@linaro.org>
MIME-Version: 1.0
In-Reply-To: <ca531c1a-3c62-5fb1-6765-68ec1e541483@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_021804_089111_0094C444 
X-CRM114-Status: GOOD (  20.87  )
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
Content-Type: multipart/mixed; boundary="===============4279383798203772607=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4279383798203772607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="viCwK5jD5+sqkLig"
Content-Disposition: inline


--viCwK5jD5+sqkLig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 09:23:35AM +0200, Neil Armstrong wrote:
> On 13/04/2023 07:54, Heiner Kallweit wrote:
[...]
> > diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
[...]
> > @@ -271,16 +255,16 @@ static int meson_pwm_apply(struct pwm_chip *chip,=
 struct pwm_device *pwm,
> >   			/*
> >   			 * This IP block revision doesn't have an "always high"
> >   			 * setting which we can use for "inverted disabled".
> > -			 * Instead we achieve this using the same settings
> > -			 * that we use a pre_div of 0 (to get the shortest
> > -			 * possible duration for one "count") and
> > +			 * Instead we achieve this by setting an arbitrary,
> > +			 * very high frequency, resulting in the shortest
> > +			 * possible duration for one "count" and
> >   			 * "period =3D=3D duty_cycle". This results in a signal
> >   			 * which is LOW for one "count", while being HIGH for
> >   			 * the rest of the (so the signal is HIGH for slightly
> >   			 * less than 100% of the period, but this is the best
> >   			 * we can achieve).
> >   			 */
> > -			channel->pre_div =3D 0;
> > +			channel->rate =3D 1000000000;
> >   			channel->hi =3D ~0;
> >   			channel->lo =3D 0;
>=20
> This looks like a really bad idea... please don't do that and instead int=
roduce
> some pinctrl states where we set the PWM pin as GPIO mode high/low state =
like we
> did for SPI:
> https://lore.kernel.org/r/20221004-up-aml-fix-spi-v4-2-0342d8e10c49@bayli=
bre.com

Yeah, absolutely. If the pin controller can do that, that's the right
way to implement the desired behavior.

Thierry

--viCwK5jD5+sqkLig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQ9DsIACgkQ3SOs138+
s6Hu9A//Y6qDIc+qtZCTOD6QrHlTZwNP4jZgVS/PunIv30X2bFreKZ8zMLX+ALYR
rpIyQqBxAt/W6PyIqRKr8sqkj7/qC32j4wziGuBLzclSFUsPCjHtbmwDhrRYVmbi
BFMqMtp7D0LiMBN9XSwVd1dgzSqSo7Fwip1PzH4++IKHFf8b8Jt3FiJrwmOgnncB
LsVTJJW3y7FlznWd0kWsnUjlkjPeP+5uNPTSRQm4OfkU8OdFmzIF8/JZHkSHwBQ2
31UAjJT14/KmNmVlHadU+T5433KN8AdDur/ZH3SJ4DinVYnH3lHTP/G8Bb8wHJUZ
Jf3r8S4M0RKtNS2HFpYwoy7JWknQAbpQOFupG6ZLKPyIdTQk2ee7h7QNNYFuq/9L
kHvd+32O/YejAf1Y0V8bbcCPgeaiT4gKYSXMKQXQ6cVN1Lrl1ExatJsHZ7fYJ0g3
OO9QeRw6Q5wCH534iZSDEzsqebyxPwLkYwHhtnLLPZElyT37puD9/m6L3/Xmo+W7
iOfT1duLDjlfJHJRY4M6PgQ29HvtpqEfA8Sxmg1OAkVSc4w94aZe2dEwGxcnD4p1
sXXbS/RAEqOoaG2MaRw0BcW1dmvw+Hc1EUXDEewIQC0nDxSlx0sYyKaLow30Wrp5
sVar/7H7Q7zsKTD2jrBUzrRdMBckab2jmOqoPyENCm4qT0X4JJQ=
=EYGJ
-----END PGP SIGNATURE-----

--viCwK5jD5+sqkLig--


--===============4279383798203772607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4279383798203772607==--

