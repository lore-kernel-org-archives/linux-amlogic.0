Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2213C2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Dzz0LwaG7bMF1Ibmmgdi6gdxVg/bAFiHH/2/gS3fpY=; b=glHpRrUlNjYkkQnJTy9e80l1kS
	bVGQ2TNefWO4Upe6BhW3+y0l3QX8gkswRFpHJbx6QTLmIx8TRys8LZ5mBjSdveBlr9KGYQSK3FSBL
	SpqsllhOBCty13Ky0Rrs3HfhmfdUYhC6UdKSAJc/K8WRwRoWfvuu2KehoJxra596q71a0OEcMO2jT
	4U3sD7f1tyG5bL4PpNSaXnApYUjdo8B/C24qwo5PIM7ojh8XaWHyBdYdvFEweA4H15ctE39gxziHv
	n2mFAso823GGlpDfWfRPN+1ALoH3ucjiihc8DyCZ9VdcKoWam9/XMJeTMHWfDoYB4PO5bG03iC508
	YHQnZwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMi1R-00000009JP6-0fnI;
	Thu, 27 Jun 2024 05:50:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMi1H-00000009JNo-3JcO
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jun 2024 05:50:09 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a72420e84feso662118966b.0
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2024 22:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719467406; x=1720072206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvKgNFKOYO5t0cqQNQZcn4eu1S8+gS3tvS6/ghdOTQs=;
        b=Hv+i/Qg40lLKGCyMlx4QnD3Lm1Va051qiCP4kSCVMcdddqN19d/JydvTdiUsC38IJR
         hGEgCuCz93e24JTwGiO6LimF9l3xrHJvkKP4QAkDRnj+DWlpmzXqvGjrTLPzKYJPdIv1
         Ty2Q9GH7vo8z8nZgJ6ucQk5DaAoC6vydiEdwAWL46stO85XFshnvpO3b66Uen4vGQ8t3
         x1ztErQOwPLem4PKnacCPFypazSyJpYZsDyAJfEwtFqSTVQcks14i5ANKOBYECi77GXJ
         0fxKHnnXykKVlkgNpPcl177OP11UcW+OS1Oq3pwG7GGMELQy+uDy+0C69JOZ5zLtM79w
         NMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719467406; x=1720072206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvKgNFKOYO5t0cqQNQZcn4eu1S8+gS3tvS6/ghdOTQs=;
        b=T4+Gq3V4sRXNNukhIdJjq34R1DcRVs5VHREqEA5jZ21jF5gd4ynvUkkKtk2Xr7vjnl
         NoIV+QgI7ju20m8ErjgF/xlVmPvn1knZzrGFUDFcsjCxmS5Ho4CZhEbJkw5Tb11JSSOr
         Wk6o0Jh0aAUQnP4fqkZtEaPB2INLKG9oW6tDL3e4THFxHHQ0U4zR/8mYea1ZH1yALV1i
         WDYb+2HrmkiLgVbeUzdiRX/VPlShVfJVfSsEpD4dIuL4BQLDZWGsqPK6GDz1UYxX5eNO
         XF1QBzu/tk4ib+PCpR7920d7GexRPGRovuOSbkAlZSO+a5yZ72aXbGIW7yVdEiAvvhKi
         jtJg==
X-Forwarded-Encrypted: i=1; AJvYcCVLdRAHkJUn8cVQaHd9HBzdurZZOCZrl03+LuzCFxi9BFplzzgCEnzA2u+bsr5KtlYf/rh/8jptYEsom9LzlzTUwzU7sTVlizCiaBod6m2jtyE=
X-Gm-Message-State: AOJu0Ywxlox/8YYdZHkAzbnLPsPhw1kAQjPcox8NWEd/OXU4SQLOgEJN
	okRStO54M/OHA80BkiF/KJQOgPcEHzwBcANr9q9XJhKDZ7QS7eVASIJpXmTnizc=
X-Google-Smtp-Source: AGHT+IFMSEsF4qzDE6K+kVs2+z+J0EYFtmK9uPOnYvzPhDJB52Fq0giOaVIUIMLWuhsIXvT9ZWwMpw==
X-Received: by 2002:a17:906:d001:b0:a6f:bd27:3f33 with SMTP id a640c23a62f3a-a7245bf675cmr866996866b.45.1719467405915;
        Wed, 26 Jun 2024 22:50:05 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d6fdd7esm25926066b.6.2024.06.26.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 22:50:05 -0700 (PDT)
Date: Thu, 27 Jun 2024 07:50:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: kelvin.zhang@amlogic.com, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Junyi Zhao <junyi.zhao@amlogic.com>, 
	George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v8 2/2] arm64: dts: amlogic: Add Amlogic S4 PWM
Message-ID: <a5ucz5r4eb2z5uzi4zaunpqhym5b6l37qszozhv4igcuduatnp@lzzk4tvil3yd>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-2-b5bd0a768282@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240613-s4-pwm-v8-2-b5bd0a768282@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_225008_010113_F41490ED 
X-CRM114-Status: GOOD (  12.31  )
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
Content-Type: multipart/mixed; boundary="===============6412480466045539985=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6412480466045539985==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l7tgoew2az5t2art"
Content-Disposition: inline


--l7tgoew2az5t2art
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jun 13, 2024 at 07:46:36PM +0800, Kelvin Zhang via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
>=20
> Add device nodes for PWM_AB, PWM_CD, PWM_EF, PWM_GH and PWM_IJ
> along with GPIO PIN configs of each channel.
>=20
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Reviewed-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 199 ++++++++++++++++++++++++=
++++++
>  1 file changed, 199 insertions(+)

What is the merge plan for this patch? Technically it's independent from
driver support (i.e. patch #1 in this series). The obvious options are:

 - I pick it up together with patch #1 via pwm
 - You pick it up via arm-soc

Can I please get an Ack iff you prefer the first option?

Best regards
Uwe

--l7tgoew2az5t2art
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ8/YgACgkQj4D7WH0S
/k5UDgf/QOPPBNuaLKBJUagn4uUEJPYgeJIRiaOj6rMdtmXP5tdK3Oyn+urWA4qr
um+zStcFoW4Kyvxkp1PUt5cvrIodzeDq+8gxBd/20sX5iL/S0+uBTqk4cv85XOuj
C8YjB5/WKc8v2f5UtRCrfqG0HwC5l+2YDB8i/vyuI17FMWm3RWhzM1mOt/wYzzC7
qW4WnovcWkL3v82ltEFHF4ZCnUVILjVTRKk1obmDPaA2C+0LbkxBqaI+RMDnLAjb
IVPOBIGHWtNJhKG0jiiF8g+UPpzs5HoHpgu6zQURpiN6EPlJ8uPe2MCMHpkxeNVk
JlHGFQvD1W1pejEQFomdPTbasA1qiA==
=DZ5d
-----END PGP SIGNATURE-----

--l7tgoew2az5t2art--


--===============6412480466045539985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6412480466045539985==--

