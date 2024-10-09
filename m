Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818CECED618
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2024 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndUjpCHLklUVNdXQIWpJ+/o01LvMoW5d7nT0EeSGMVw=; b=AP9xyGh9xYJ8CczDO5UJw1taLG
	tS84tS1XHyZj1DQg+kQ9YnG277p7aOD68QJlKsJkqxyY02DAGs3vfKcqcAZOX6W7S+8T68uuilcmH
	KWz+uf0rbjyf8fXjk6y2FOeogfO/fFpMmoodEtTQzWBk2fWr2vyDFqYC4zyqQHQOCdVLhaOenvjgs
	utUXcWIbIzlOPGfcVwixsUFLo1EcfWsFAfmkgdC/OwvkQDoVoArVRyAbyx6kq0ckNYaHPOu+KicJK
	DmOeM/NWjszpVDEQvh/Z9LzFfjoyYmGJ87SagBjmKJCJjD76vdVUPkhLcoDz6w2E1RPlzxLUkkm9O
	pXuV9ZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRMy-00000008IIN-05S0;
	Wed, 09 Oct 2024 07:44:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRJp-00000008H6U-1NQP
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Oct 2024 07:41:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d3ecad390so150269f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2024 00:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728459671; x=1729064471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2viIowtWPbXMalgfD8+O9ZrcVwo57XCKNmEpCFwYjQ=;
        b=yhg5Dkzgn9PQBx2Ya0SXKPBNKMmfSalAZTlb2Ii6VM/jsVI/82cxjqQTB/NTKme0kh
         ANhL4lEmYI/yuWW5gEj051L9B1pF0+bOrDQ95HGhaz45NG6jISMsBUkBHw24h61V2WB7
         l90t/eQbyuM8JPoedcdiwHRGdj/UPpSpbs8FNmKJYu30DMzDSVj1FKAahFKdQB05bEaG
         mBb1hqbSIfrZMtpjKAsHWcagmcBqI6veXnmWXaLdaoc/frw2ckJxwQnauljKRZzUH8o4
         8sKk1KR8cOFmfm8fCzZjs87pO3brksYbdF7RvUGacjbFho1roYFT2KV9Kz8RVFFT97JW
         z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728459671; x=1729064471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2viIowtWPbXMalgfD8+O9ZrcVwo57XCKNmEpCFwYjQ=;
        b=Ne9pYc6X+H5b7uX6puwim2o5JHHQM8pOd62DoJDUwZZUYyypfJ0qXknkV6pwOnCODM
         c0qwVn/Oso5bOEaLYOz/Nmr6vmCW1l2SenOS0rL78M5AJShDBedjnZZm8Rx12ozxN41K
         HkwtbKQ592b9XCy6chiH6RWMlQOumhdg94xMl4OyrGEFe12Sxc+qqiYJdi266EkRY5gI
         ehVjYuMaVThOXJiyFAZB5IrLpQ6VTuVfoN3GZCJjMo1RJhPRBYl8h0DdZLOXFoZU0i1F
         /JSJSmgk2RtCemFDqXE/dUvjwnt1v0KDRLg/IE/GK50p03YjP8Ez2NgL5d5ENKRyHoEJ
         L/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+tkXk0lrYxmQkgRhYtdhuOCbOggAPM0kluqUGj/XGRu/Pj/+cdZ8g7lCzXJvEQGTW/n+7F1Ktnv74mPaB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+zJV1okNZhgzOX6gKnqhFGZ+Vu+7ORXe5TAZf05uWCDqr4xoi
	21JmxQyrOn65lti2zdJl3is20qwqGczI9MAJkoZuXGfiR71CBcuTW/BZFXjXJZ0=
X-Google-Smtp-Source: AGHT+IEyd05ui1VmLA1rJ5jgdYGapO6L5DJBjVw/NMVD99NroiPJMW7cLe8u+UN9UqCyNM8dGfTC/g==
X-Received: by 2002:a05:6000:23c6:b0:37d:321e:ef0c with SMTP id ffacd0b85a97d-37d321ef108mr2946699f8f.11.1728459670763;
        Wed, 09 Oct 2024 00:41:10 -0700 (PDT)
Received: from localhost (p509151f9.dip0.t-ipconnect.de. [80.145.81.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d2e65d618sm3025569f8f.23.2024.10.09.00.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 00:41:10 -0700 (PDT)
Date: Wed, 9 Oct 2024 09:41:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kelvin.zhang@amlogic.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] Add support for Amlogic C3 PWM
Message-ID: <nrrw2vvhyw2gsbqpne5pgw43yyp4uzkjq2ioskvjjwgfk4ahuo@rryumcqojbhm>
References: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_004113_395882_FA4648C3 
X-CRM114-Status: GOOD (  14.48  )
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
Content-Type: multipart/mixed; boundary="===============8784071904121076411=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8784071904121076411==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3g32dk24m6nlnxrf"
Content-Disposition: inline


--3g32dk24m6nlnxrf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 01:48:57PM +0800, Kelvin Zhang via B4 Relay wrote:
> Add support for Amlogic C3 PWM, including the DT binding document and DTS.
>=20
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
> Changes in v2:
> - Rebase this patchset due to recent upstream changes.
> - Link to v1: https://lore.kernel.org/r/20240906-c3-pwm-v1-0-acaf17fad247=
@amlogic.com
>=20
> ---
> Kelvin Zhang (2):
>       dt-bindings: pwm: amlogic: Document C3 PWM
>       arm64: dts: amlogic: Add Amlogic C3 PWM
>=20
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml       |   1 +
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 364 +++++++++++++++=
++++++
>  2 files changed, 365 insertions(+)
> ---
> base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
> change-id: 20240906-c3-pwm-d17072517826

Applied patch #1 to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E I guess patch #2 will go in via arm-soc?

Thanks
Uwe

--3g32dk24m6nlnxrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcGM5EACgkQj4D7WH0S
/k422Af/WeAeMG12qlVL9TxVyfgCoOaW67cCbyllbKGrSYC7OkgI+ujL4WpeqBw7
S0buIREm1V5mtmzXBboD2scB1+QGKalmVSObFXMtgSfJnGszpUViETfwBI9c8az9
oXC9IJSfmF7aqlfugMWcAhrlIZFXEn5I6RMQi8e4fM+F/i83G9aoXVJ6qqQKscr8
uvcpfGZ+hXCdcjPLX2nryNaqNqmlHBk7RYncDYYLPsAnM1gVITTHf0rc/cjKotVj
jcFV+dSSWr8bz6bR8ANt/Tv4reR+NVl3fzmEeQhkWT9gOZEy1YFsnjA+v7L+ect3
+CVMHadCSQx0G3uAK1jTKvVf8PyFRw==
=Njq5
-----END PGP SIGNATURE-----

--3g32dk24m6nlnxrf--


--===============8784071904121076411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8784071904121076411==--

