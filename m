Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE86BC5DF7D
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 21:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERTcp71Vw+Sp7bClWuhdJn0VptNqSxPIsXEjYdM7U3A=; b=0TwOH2gw/hOZxpnnwbh3nAa+kB
	FuALToGhfW1vgCX/lz9ei1rhAUcUqf/VwFbSrTu4323oucYzwKeg6SDmIQKLYA7kV9Fwta6hU5eAK
	IoPqFodj7dv3bzY1jeq+JBk5Ps4PlwGoSLzhob5bhlJAC0pKnn4hWBJjmwSJri+IzT18HIUVNYSdQ
	SCZHUS0elQA0U46b34v4/m7munrs0olohQt+OSP1otADD+g6nEAxnZCuMkZRu00xKaUO7tfgZEP2/
	YBZE4FvonUs7VPdAuoM5n1B3yMwMZGwvxGCjFwmYrVwg3Xyi4cuYw6G67PZqDBBHMRLIUadvEM4lm
	ZLmVtRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRQk-00000008gJO-0bKn;
	Tue, 18 Aug 2026 21:33:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRQj-00000008gIA-0EJG;
	Tue, 18 Aug 2026 21:33:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 24A564184C;
	Tue, 18 Aug 2026 21:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 53EB01F000E9;
	Tue, 18 Aug 2026 21:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787088788;
	bh=Ecv+y4qPf7TDQrrwWvBs02Eh2mi1ptD/0q+SKR2GL/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5P7y32pDfsu7R8MnWFAm205vDaHTaeXQ/u/lIS77bwrxm38tvuzp6OTJoUR/60dl
	 Cmh+3cxrFIw9H7FryH9QX0VTOpXOW3ZAxPAsy5mMpA5L/dOEOxV/WZjL5tYtRj3zZ6
	 J7+jnZfY8sXR+/iBm1buiqA+XN7HFWKjnIL+JEJJenwMED/w/x9y00tUikBXVX/p9C
	 hRR3ceFFnu8PcBMZSPw4sUT6IFruyFcg/x6jsjVhrf2agf0UTCakg5p4yZ+O8Pspeh
	 qauywjzQn88w8ctx4ve+z/4qYQZma+KMzRoQqvPLn+wPmgxLXQvXiOpuK1JJu7Xi2j
	 nLVD8uECg2XVA==
Date: Tue, 18 Aug 2026 23:33:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/2] pwm: meson: Add support for Amlogic S7
Message-ID: <aoTOjGhqfdfk6Ze-@monoceros>
References: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
 <20260521-s6-s7-pwm-v3-2-57b073fbafef@amlogic.com>
 <178705763029.1733024.16040030322013834677.b4-review@b4>
MIME-Version: 1.0
In-Reply-To: <178705763029.1733024.16040030322013834677.b4-review@b4>
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
Content-Type: multipart/mixed; boundary="===============4452288960964091756=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4452288960964091756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifsoxaipndo4pyw3"
Content-Disposition: inline


--ifsoxaipndo4pyw3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] pwm: meson: Add support for Amlogic S7
MIME-Version: 1.0

Hello Alexandre,

thanks for your review, that's very appreciated.

On Tue, Aug 18, 2026 at 02:53:50PM +0200, Alexandre Mergnat wrote:
> > @@ -642,7 +672,11 @@ static const struct of_device_id meson_pwm_matches=
[] =3D {
> >  		.compatible =3D "amlogic,meson-s4-pwm",
> >  		.data =3D &pwm_s4_data
> >  	},
> > -	{},
> > +	{
> > +		.compatible =3D "amlogic,s7-pwm",
> > +		.data =3D &pwm_s7_data
> > +	},
> > +	{ }
>=20
> Small nit: changing the sentinel from "{}," to "{ }" is unrelated to
> adding S7 support. Patches tend to be easier to review when they carry on=
ly
> the functional change, so would you mind dropping it, or splitting it into
> its own trivial cleanup?

Just skimming your mail, only here I want to express a little
disagreement. While I'm generally a friend of "each patch does exactly
one atomic thing", IMHO such reformatting in an array that is touched
anyhow is fine, and a separate commit that just updates the terminator
in this one array is over-engineered.

Just mention it in the commit log and that's fine for me.

Best regards
Uwe

--ifsoxaipndo4pyw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEz44ACgkQj4D7WH0S
/k4wEAf/U7rMIHl6Kc36+5u7qcO9M8BWtK1nBKev20mftpvCC7drphdIZwcYpNt/
kWSgpXSUz96MkaKh2EwFyzTitngJS6YgbL/qHVoiG8fCgLwxowaPo0EG+GLqPrYh
eDU7LK4YUQLA985s/TYkz2HBSFamjg3004FMXLmCLXT21sZ90k7SBnH8L8D9U9YN
UD3YvDmhQvoXO5fMvLKhWM+Gl1wldo611r7JoB+e/V4RBmBM1Koi6F/cN0Hq/C9d
MYiDdUqONfPc9cgxjwzrsjt5Cj94kfOCrpFT+D5qtHnqn8KL1LuRyqSCkiUdAzjF
/A5Ri4YY99h2CuhttK2J1vNmEew7yg==
=9mnJ
-----END PGP SIGNATURE-----

--ifsoxaipndo4pyw3--


--===============4452288960964091756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4452288960964091756==--

