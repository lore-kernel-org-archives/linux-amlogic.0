Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22A0C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6xg/Z0Q4hpPpwTPbQFIbrL0oLgd6WH3mJWTsBGMMJ8=; b=0ZnD6IaISUMm7q7/ucDkS6+bRR
	B7v07aYxnE/3gNgAwo37KtjHzUnG9HTnER1EL7QTqbt5Yv7hcuCWdHDJfYfgqBMxEfMxM/PtK83Kh
	4BVStY2krLxIj/ijgODYHFNKoJM/1Yn9wdh7Mdz1vtH1ZYNTqk2ZGyep+izAUXjg1zoplPI18fkAX
	hEhCgISVkvb9oijsWKP4BJafgbvX+cTM8hGPIPGa9DkX4ZcqncA//LrCD39gP2XYFAL+iUQZdnakL
	kl5ymW+Zt+jy+AE2STbqRjV0nG/j8xstX1qU3OAKsGEaXyK6fyMDIf7nZ/nAsE27XnRbwY4yGYYKD
	XJ14FoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJD5Z-0000000B5g6-0cs0;
	Mon, 17 Jun 2024 14:12:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJD5U-0000000B5dv-3gDO
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 14:12:03 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a6f1da33826so611926066b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718633517; x=1719238317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2SAVHOyNTSMDiQfOQc+olVCdTZJppGRHLEkFWkECgM=;
        b=c72WrMPwiszSXMXcZk5R/Jiq0Rd6I6HK0sm5RCYNrSjcgNLwbjuGPBsawfuoClwOV5
         gBvHlFsW/0Ne58SszH8s8kvL29n9ggzrRTmHTCoIODHHOoTRdGSnEoYmRGYClDecKY8H
         LakcaGnpGE7lI0hdomAOmew8Fio2KV037Q6ta6l0o+xAk1Z9za04yjAyEjntMrFH/txg
         jC0xzFBg3h/5gIHk88uKejHDF6lmefQI4aSHXJPGkZmGZC3kQr/1Vy61i3uy7pdmNzBy
         gdHvRWPlQ27jw4za0sZVLopN4TExg9rOE5FejJu3ZVKbkBAVJ2ZJivzApxfpjidwqqD/
         wLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633517; x=1719238317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2SAVHOyNTSMDiQfOQc+olVCdTZJppGRHLEkFWkECgM=;
        b=jBWfon0PzVc32l7gikC+E0as0BY8lsI7orYbDzAbZqPh7BrefiDAa16m/HmyfF25em
         v1zWzNECJusXL/yejeishGIJxJsU1GpfaaiDbuJjdflYQKQimyp2l/1w5iE7oWIn+Vdj
         j0NRQzg52uGxPt7pTCoo52+q4XpWfCaUvic0aTieoL+xYZKEtxwRIa/LfxFr3ndDlJKb
         CwET/PUWLMfCyPFK55p16qMUufNIoHA5hdEsuj+Ri9t3GGzw6vyII41gRb5fLwghzbx3
         FdUoB587XR/jgApTiuhdbLutyvBZ4vjofKpaJVE1XkvJ00QlRGst9lu8lcJSqM/S4hS7
         g56w==
X-Forwarded-Encrypted: i=1; AJvYcCVUTeB0KGjl5TkjIeUevwz4BkCKsLTX4JK9MOkmk7PLGE9C6Gv98ltd/h6HDISbz566EUpVOs1gO4+MIQe/hUW1isBkrwTGiTUGnbKEfihLkF8=
X-Gm-Message-State: AOJu0YyZJkt/TbYkkEv5AeS7NrxziFNM47LdIykVMMC5RJ2Cd/24XTZl
	xKjyHjmUwq45Mk4zp+vldsHTWBFtoblEUepQLG+V/0saF5AYR2pKivj9hesRFII=
X-Google-Smtp-Source: AGHT+IFlbSH1GvxfJkQSwG+UrC4v6gx0fdCPmYTDKY3WzRbLOQNkpCirO5vKZ2nfSibqMaANo06JTQ==
X-Received: by 2002:a17:907:c283:b0:a6f:6661:dbbf with SMTP id a640c23a62f3a-a6f6661de22mr770138066b.71.1718633517028;
        Mon, 17 Jun 2024 07:11:57 -0700 (PDT)
Received: from localhost (p200300f65f283b00ca876ee5dd3d1e3b.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:ca87:6ee5:dd3d:1e3b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56dd2dcesm518217066b.93.2024.06.17.07.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:11:56 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:11:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, kelvin.zhang@amlogic.com, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
Message-ID: <6bzysc3jwugo3epcxsef7uupk536prsc3phlf3m64n3jjwpxus@2uigg44uotuh>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
 <1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
 <tnwdnwiruoty5yd42bmkupgg6hjxib5lblhqcyouoyx5y3zvnq@2d7cnrei24m4>
 <1jbk44htqr.fsf@starbuckisacylon.baylibre.com>
 <948ba34a-1e05-45c4-8ba7-66c72bdb6fa5@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <948ba34a-1e05-45c4-8ba7-66c72bdb6fa5@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_071201_071144_325296D5 
X-CRM114-Status: GOOD (  15.41  )
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
Content-Type: multipart/mixed; boundary="===============0232033246773092627=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0232033246773092627==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vjzyofe7xtcvocgd"
Content-Disposition: inline


--vjzyofe7xtcvocgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jun 17, 2024 at 04:44:13PM +0800, Junyi Zhao wrote:
> > > So yes, please use dev_err_probe() also to handle
> > > devm_add_action_or_reset().
> >=20
> > My point here is also that devm_add_action_or_reset() can only fail on
> > memory allocation, like (devm_)kzalloc. Looking around the kernel, we
> > tend to not add messages for that and just return the error code,
> > presumably because those same 'out of memory' messages would proliferate
> > everywhere.
>
> Hi Uwe, I didnt get the clear point.
> So, if we need "return ret" directly? or keep "dev_err_probe()" to print?

Please keep the dev_err_probe(). There is a problem with that approach
(as Jerome pointed out), but that is about to be addressed in driver
core code.

Best regards
Uwe

--vjzyofe7xtcvocgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZwRCcACgkQj4D7WH0S
/k5C6ggAusUDCe62w1qb8jlNP1dXoK6OQvw09sDK1x3v6607Hh9+PZte3/EYmwn1
AIT2qpIcaBkVb3oB8plPowm3oU62dqZ5Z5ab1QN97qlths09uZiOxkA/MSLTTUx6
T6GbIn+8OmUDBSa2jyqbFBV5IapU3TgN/PGDUVu3/fp5psvI6tCfyLUpxR1pTXWZ
M3XM5N2LvVkzyu1O77yBaKOsB+4TVcgRLGwi1MzbqbvbLQoyRscvB18qB4x8Ytsa
kLCtuCLJfdujJfR6fTWC/1xeXGoK+YnnoELLOj7LaBVpnUzN8StlNOTM2q7Pm354
ndgwDT55Ok9oedoR5qNzhmx6RPB9qw==
=M9gi
-----END PGP SIGNATURE-----

--vjzyofe7xtcvocgd--


--===============0232033246773092627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0232033246773092627==--

