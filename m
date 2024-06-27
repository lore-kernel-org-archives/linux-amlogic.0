Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B78DC2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2Jv3K2fHJGfgjDXON1Aklv6T/4F4TW2wvWmXcM8Fe4=; b=pReAuOzJxxzKe1Wnskde3gamUw
	hiWwbsFizKBvV4V3qyBCNUBQQcSi0+Xu8Hp/y3VOMYWBrpDUkSFOiYX0LhZWpOGlozzcTxa30Xxtl
	roeyCWgk/kPE3OXht1N6pnE7QBbePwKwh8ifUzHuMd1QUIm+zDGZMhMZyTHtFdNz25xosoexfBDhU
	j4uEJ3Yad+zpH2ia2TiXuVCV4YvwOjKRWS5oroxnwuTXMC1E/iXt7QCxhF1cy/+06odn4cedtlk8x
	8Gh4tU3zIYfjcic3yCyKBMGiF134ivR7Rdm6f7rUlnpdWLRcgIbkDj/U4OR1/+j3df09eeq4tZFez
	9Ylz/34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkJU-00000009hzF-43rH;
	Thu, 27 Jun 2024 08:17:04 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkJP-00000009hwU-2QeU
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jun 2024 08:17:03 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ec52fbb50aso63515261fa.3
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2024 01:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719476217; x=1720081017; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEm0f3yMC1lTsMQP2mEqK6dYKNV66vYfR0qO4oI6gVE=;
        b=OqQfg5KQxC2ipizMcaUF07/3ywlaMznFSaltFD1VgC7j6/IVuQGSA4vw8T67rGfGO1
         A+F6z57TA0Lfy3mcSfkXC6fItP0LqXwtffWBxzgOlqLq/DxoQhKjxjSQrUmkFx3/eMM9
         PtUuzn6BauAR+Y66xYe7h/wYik4os3FSNJG1o4iYrsyQXb9NpQaMaVO4eYWI9FACORwW
         AMsR3sLV+/dZlMVLSPkO822CgXGaWEw2gG/CDxsbcfc4lfN8IOJA15HuL1+8oMC/QqLB
         52yx/plLYy/z0+tENgLbfKgUWjtn4x4Ry8aH5GmjbXl4YCS1Ofswg08igNkHdGfSopHC
         6h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719476217; x=1720081017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEm0f3yMC1lTsMQP2mEqK6dYKNV66vYfR0qO4oI6gVE=;
        b=IzhGb9WNyACQc9ZCDNAbmlWFNAsW6T46+jcbdmjS4h/gUD0KoBm4hQWK3knQZ/yXvI
         GxmsaevDuTIV8XRC4Zo6Ej34RtWPvYe/WSwE1JzF1ICdyieYEuN0mNMUK/zOrgHaLqSt
         97pAExdoCF3ixcOrmT6gx7JnmMSUfvHRFvApaqx4MzphtoOnrpRB9QUVSj8m5oyUw+Lz
         qgzfhMdzJFFSaYRdynuyW5CKfatCeL9Er+ICku2jlNGfP7Du5nqWD+5eehjKeXtbUsHX
         E0oV2jeLloR2prucLhady2ZK4uD7Wg0tX5pW6ITqf31EGACyLwmSvtuD+5H5MKk/9ewu
         cvwg==
X-Forwarded-Encrypted: i=1; AJvYcCUYzQ/DueHRS+sd+FIJlWsq1IPIpkGspRSd2Ox/AkSRFFdB+Xr+kN16B3c15pyPnn55i1nfMLVwVmQOr3SPjH3QqQlmkjy+xaf5GWJLIkPCFWc=
X-Gm-Message-State: AOJu0Yxp/m1H0R6gwjZzrvvbKnyXDlpm+AywPI+/HpLoNNV7z1onuhIu
	kenTpTXWMMTh+EvYlQ4PcTlytarBM84o9o7ClCBRtUTMXlttvDRmKk418gizPq3VkTdiCi1aMkL
	M
X-Google-Smtp-Source: AGHT+IG/lOE4K/dxtmNROMYE5tpBQ4PfaZZjQoprWIxtfxc9uup5H2fD6gZ79Ng0DJruLnzyAi0a+w==
X-Received: by 2002:a2e:9d88:0:b0:2e9:768a:12b0 with SMTP id 38308e7fff4ca-2ec5b36c1bamr95025771fa.50.1719476213391;
        Thu, 27 Jun 2024 01:16:53 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bc5176sm14283215e9.45.2024.06.27.01.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 01:16:52 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:16:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kelvin.zhang@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
Message-ID: <ayemo4ysl5qotj4pfmclxdtshoqgybl4xqmrmkmpbd3vsugf47@pgsezohr4vel>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_011659_765718_E78C7ACE 
X-CRM114-Status: GOOD (  10.02  )
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
Content-Type: multipart/mixed; boundary="===============8429269646484958866=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8429269646484958866==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rsedrqskqx5olerr"
Content-Disposition: inline


--rsedrqskqx5olerr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jun 13, 2024 at 07:46:35PM +0800, Kelvin Zhang via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
>=20
> Add support for Amlogic S4 PWM.
>=20
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>

Applied this patch with George Stark's Reviewed-by: to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

You signed your patch using gpg, that's fine. However I failed to find
your key to verify that signature. I suggest you to upload your key to
https://keys.openpgp.org/ (note you have to register your email
addresses there to make this useful) and read through
https://korg.docs.kernel.org/pgpkeys.html#submitting-keys-to-the-keyring
=2E

Best regards
Uwe

--rsedrqskqx5olerr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ9H/AACgkQj4D7WH0S
/k4TGwf/Zq7fInk7zIeHl44mqXSTwaWdnCftKpYsQYNhI57+Pr2qmGnMZfWo9Z0g
qTQZtc9veyYI7od541wZ6cSYR878sstNK+GZzJe4lYeZpbIhYHaTjk2DzjCh5tjy
NqgBMCvSSK++TZpBTRPbsYgJwemdFsWlB1UdIAEHXe3wkKhy9Kt6nmw78TqnqwDo
EELQDqhCzF7qZSYXi5SlpvHQyTuKzPRDosvgoM5HDcyUcnTDQ7qsryPnVBV3OJKc
P9TwMOPaBCckz4MnXpHAw8SfRKYQ/INNLRd9Cng5l2npcVy7FBZ7ZHvfN40xZtlf
wXZAead9xYAyIMZ5LyDLhS0MjgXbxA==
=wNYU
-----END PGP SIGNATURE-----

--rsedrqskqx5olerr--


--===============8429269646484958866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8429269646484958866==--

