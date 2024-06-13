Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B96C27C4F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 20:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fu+lrnV+J1ed7uNOE0Z2IXwWaLw24nkZ8w6CxaJvnGk=; b=iT069kjOchZrei2fZ2+IAbpfsE
	wAt66AvcsVSdsYevC6aveQxBXSoaufl8r/RjKcFD0PjrEwcUYnV0udKBJiDz8Cp8U1kXaE+34HteA
	Pu5XmKz6mVyOJPYmpIqRsVbLBsO6h5Bp4n+ycdFB9RkaBOSPpuF8eFjeScfpnkqi4Hcb7yj4byZX+
	fBPovBvTi/E3ns/Lrmq09t87T4rY4voipO5OAyiHeBPXEfwmBuiyiqP1n/sptJu4v/O7jmGnM7pU/
	x0C09jgUh1qjevJ5GHhmCgNW22vQzkDWwmJDwoR8L0ku4aixLmHxujJ7EgvjO3BxDM8tB2w322XQW
	xpt1TEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHrLE-00000000SNh-1TW7;
	Thu, 13 Jun 2024 20:46:40 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHrLA-00000000SLO-23w8
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Jun 2024 20:46:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-57c83100c5fso1532394a12.3
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2024 13:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718311592; x=1718916392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5+He79jybhHTCYOhSX8BgQBoEHtDE3sqg7uCiPqItM=;
        b=GGhGmjjXXB0D3HHAnAgdicECY4O+9qJAnbYyJEF27VB/IRelor+w9/u3eDgf5RzuzH
         jMvs6D5PmkjuwIsbaNFkZTG5siUCUfy2iRaM0ivr4lLSDQEwi2+zOPv3b+T5zjIabGXS
         r5Z3Kf9xWOcC0E0nU50r30BUCkUsg+8Tqw5JfjnVyTWrtSkXjz5hN4vzFNhi3ZdhGK/F
         u4uq5aXVnJ2OClz1ENzZzYpiG7eEu3MxwFSk7wol79XNnrLHKe6z12gSQBc/syRPIqYM
         KRiys7y5S9URzOvoX0/7bCDSOX9/TtbMK+XiwX0gL4OC3u/ID92LWVIIXIJnv7tdfR0/
         BPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718311592; x=1718916392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5+He79jybhHTCYOhSX8BgQBoEHtDE3sqg7uCiPqItM=;
        b=cq/yx76oDDlxzEi8QrsV55Dvj2jvpOpm+iWqDx0cxi1bmN+lYnwUQ6D0vhZWF/7izk
         gkvYiGyPW0uodjwbJz+74D2nsxpRvVjQAYzzX9j6c9RrxGWDQqjraFpCGrytuKLUVtgN
         NG7nFG8vASCb/wCa87utW6NYDI/J2KDV0GI0kWtckCoVuQ9egjSbewNlggNhGB19WAWy
         GswUREM/YTpthpKKLLXFYfSHbrGXaaBk/yP+6UMgeKKmhO9KHDBDCkvBpYY+N8Fa+fy3
         utQrkquG3YI/XTxW2XNHuAjb7xItwt6kQUTFBXA34laWbQY+3u12CnX7BjVUgq8yNwqB
         d1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX3eNr2xUwSBReeKaSH4ZFh1rHCYZ8aRLww6eL7cQs2euqjp6jK1+tHQgskMwzavCyIxoqqnQAff1m/4YoGOmsKpdM/CABoC8INAL/ZtzRcAg=
X-Gm-Message-State: AOJu0YwpjQY1Y0fdGXa1VZIrDvyCTDMzhlNZR0Z8712LWYT4X5WTyDrs
	8bGezrp1sUiWyNjqh/SapJlYoxbeYWGkq67AOp0u2cWuSmFHJp5SJe8e2jJhVBE=
X-Google-Smtp-Source: AGHT+IFtpOzE8kKqoKpYLmM4FbNCxftMEW9YZ0CGmabwa7MvW6sl7qRnrlLjm9/uGQPw+uKoNnSNBg==
X-Received: by 2002:a50:a45c:0:b0:57c:b83a:fef5 with SMTP id 4fb4d7f45d1cf-57cbd8b9be3mr598711a12.34.1718311592344;
        Thu, 13 Jun 2024 13:46:32 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:78cd:4cb6:e3af:4473])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb741e702sm1342351a12.70.2024.06.13.13.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:46:31 -0700 (PDT)
Date: Thu, 13 Jun 2024 22:46:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, kelvin.zhang@amlogic.com, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
Message-ID: <tnwdnwiruoty5yd42bmkupgg6hjxib5lblhqcyouoyx5y3zvnq@2d7cnrei24m4>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
 <1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_134636_551828_98EC66BD 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Type: multipart/mixed; boundary="===============7006901013995099815=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7006901013995099815==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="atnwtc63iuembv37"
Content-Disposition: inline


--atnwtc63iuembv37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jun 13, 2024 at 05:54:31PM +0200, Jerome Brunet wrote:
> > +	for (i =3D 0; i < MESON_NUM_PWMS; i++) {
> > +		meson->channels[i].clk =3D of_clk_get(np, i);
> > +		if (IS_ERR(meson->channels[i].clk))
> > +			return dev_err_probe(dev,
> > +					     PTR_ERR(meson->channels[i].clk),
> > +					     "Failed to get clk\n");
>=20
> here it is ok but ..
>=20
> > +
> > +		ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> > +					       meson->channels[i].clk);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret,
> > +					     "Failed to add clk_put action\n");
>=20
> ... here, devm_add_action_or_reset cannot defer, so dev_err_probe is not =
useful.
> dev_err() if you must print something. Just "return ret;" would be fine
> by me

I don't agree. dev_err_probe() has several purposes. Only one of them is
handling -EPROBE_DEFER. See also commit
532888a59505da2a3fbb4abac6adad381cedb374.

So yes, please use dev_err_probe() also to handle
devm_add_action_or_reset().

Best regards
Uwe

--atnwtc63iuembv37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZrWqIACgkQj4D7WH0S
/k7GIggAqVAdsuyCU4qUCiRosJKIKXIHaUcrhQLdIciPH7mkNTw3UOw9RTgdygIt
RRtsP2rXk6hKJtbI/SA234syDPp/2zlmkDOk475vviRgmnxGpQiw1/C9/emfGYX4
bOHhBHkSQvxKjGIWhuFSHo3dy2h0iAYYZFZSiNfvrydjAOA3ERRtgJf/hZUS8zpt
ogHtoO6hD545xuoG8gLPIMest9lvd/W0PdyyQnqyx5+X4V6QyBBAmjuKnSMMpr0W
5NtJr0vvFaiH+NAvi38WFBUzF5KkQyUF/Qi2PQf7r1wzIULlWdC7CiDFcLDA5+l5
aEYn8Zg3ghfFXda0jlvgTNItV0D8sA==
=7F+E
-----END PGP SIGNATURE-----

--atnwtc63iuembv37--


--===============7006901013995099815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7006901013995099815==--

