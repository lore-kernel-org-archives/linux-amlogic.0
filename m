Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC43C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC7Pba0yYsiJ0PO6SsqGQ5giifZcaEadz1aT4imrXJ8=; b=fBANo3jaS/NYZ5Dgvh7+ekKf1D
	KOpsMf+TJ0PilqP+R2NpW+VxwOPf0l/rJK8UvFufblgTjwmcfJrdO43Pvu0LtJdqJDmyfKVBuaF4R
	w/mr0f1gFFblC4ekMrvc8NT1o9M44T18cS95ZlWRSLiCZC/Uf8xrD7L++gbK4ewIZ2xtXKex+0urS
	WEd4YvnVf4AGy+4vliF5xHfR1O8boiTsMPDHsSZAc0K/ig67MFxZ0MZKQvarLmJ6ninbb+szfC51q
	jCeY/3D35mUK15+qNZFV0GRDplUe/isOwoTCPNye3KSnagMWIfXUUbGYjTFtsA6PRMIpI1nU9I7/G
	+i/wUD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJE74-0000000BPIk-05oz;
	Mon, 17 Jun 2024 15:17:42 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJE6t-0000000BPFM-0iQ3
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 15:17:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-57c6011d75dso5521746a12.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718637449; x=1719242249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCKYxTY+hYqCS9ZAIJQjiDX370B780I/Z6F9FjI6Lso=;
        b=ZTemhA2eW8yNBH4DeramfeXa51oYM32ncF66rEBz+hITsPPCLDSJCl44YFbTD/BQB+
         kXdCCnmxaJvna8KkzvhFNJ7Ye8hEq3z80WSQYOEROXHoKJz0+/DsYReQdtO0PzIsepkK
         yL0w3AwMsh0VHBGxgbJZgp6B0zEFj307FmIKT5yPKD3XxvdgHIuw7gsXR8+7/7D1J28H
         CSnpj5Pe9hE36WAvEdOMptQ6dE0FL9KB9g3k4N62y0/zsCUozaMdqh8phO8ohgEV7zuR
         iBIFKvgykh3EjhH/0Bo+vfUvKbsGQYMM/UxgJLm6qkMls9RxuI5xwEBWyh22f0J9ER4q
         3fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718637449; x=1719242249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCKYxTY+hYqCS9ZAIJQjiDX370B780I/Z6F9FjI6Lso=;
        b=GFAmlB7D50juDi8e7abfzdr5Rx2JlZaHkPy6fIgTXClw7hSQNeJPcXvhspBLfgj/lR
         hQFNsjSl4GZPjqPjMEHLmVUfAIftGT8W3BJaTTn/yLCB9x54aTW3PWtT76BLZJWj2joF
         wE4ruBIRhZhHRGOJD9DbIGWxVP8tRJqaQuQ0trracJKHcrqrhPrusRvgnj+QhPuJ6t/X
         MBXpdoGVWOIhSbJDp7RZ5Gs7aarntVmJR/y0Ek0DGaXSnc1FTl39asu8imobQp0v8Zax
         92MrOsdt4Ngi4HceD+ftvNB7HTWIWOTeOkrWOakHUPDrHx5M29i+00twbtzCuUGK4k/9
         psOg==
X-Forwarded-Encrypted: i=1; AJvYcCXNimXxm7rYvsMaKwIdN5jx1JmXLKVKiacygRtiNXNhJTs1TIkPnCjXldVsaWyTKo5ROVbsMVDJDfxuxB4kMCmdPw0VLLSCCwqUOV7l7+mK1+I=
X-Gm-Message-State: AOJu0YxlW34rpT3hTSTVch8eVj/36EyAhTmoI6ZVcPYhTq7EJ0BCf2Sg
	gSTNq7yhygDtv7sngNeBYIuSDq3VLnaL/DVfUW3/fPgw6Hv9DtPjASjI8NB5G2c=
X-Google-Smtp-Source: AGHT+IEfTN+X5wOiZi0KL9fkXm0O9x/sBCnZG/iMDNlNOfN7WVeTQ5Ne7iOJRddWGtoR5MmcoXn6Lw==
X-Received: by 2002:a17:907:c713:b0:a6f:61c7:dead with SMTP id a640c23a62f3a-a6f61c7df96mr914573566b.17.1718637449366;
        Mon, 17 Jun 2024 08:17:29 -0700 (PDT)
Received: from localhost (p200300f65f283b00ca876ee5dd3d1e3b.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:ca87:6ee5:dd3d:1e3b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5b5ce0c2sm495737066b.78.2024.06.17.08.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:17:28 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:17:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
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
Subject: Re: [PATCH v3 00/41] iio: simplify with regmap_set_bits(),
 regmap_clear_bits()
Message-ID: <mv3deevgf3pp6ojy3pa4zgc5z74ajroe26sayhzvrbua2dqrdu@enqs7sobbew5>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_081731_292525_05875B34 
X-CRM114-Status: GOOD (  13.24  )
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
Content-Type: multipart/mixed; boundary="===============7307982323182902973=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7307982323182902973==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="maebxxheapnwdayn"
Content-Disposition: inline


--maebxxheapnwdayn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Trevor,

On Mon, Jun 17, 2024 at 09:49:40AM -0400, Trevor Gamblin wrote:
> Simplify the way regmap is accessed in iio drivers.
>=20
> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>=20
> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>=20
> The series is marked as v3, but the previous two revisions were single
> patches. There was also a resend of v1 due to not properly CCing the
> mailing lists on the first attempt. Trailers were pulled in from those
> where relevant.
>=20
> Link to v2: https://lore.kernel.org/linux-iio/20240613133927.3851344-1-tg=
amblin@baylibre.com/
> Link to v1: https://lore.kernel.org/linux-iio/20240611165214.4091591-1-tg=
amblin@baylibre.com/
>=20
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--maebxxheapnwdayn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZwU4QACgkQj4D7WH0S
/k4UIQf+Ka6492ojVYOyOplTmwplQhYA0abavRbL4tWlzPswAQ/4yjahD+9XRbA2
m9DionXY1IXXlR3kZm2ZtPy3dXdG4QKH1gi7xcnMOjtmgb2jDay7mvbN0DNuIjV2
vciMh7NpnYac3uUovbis7d++of8lbibdzWQbtV1IIy551MJApXs2uHORUt2JMYmx
hEzyLG/q47FnN9Anbw1rS+5UsSm8zYjmMgkJ+w6jrtgCJHyMgTXZ3JnqR3G5gVjI
qOKcvDY9KrrMRn+cptE5IcGMviWhQofAJeJtKOuGmW0PlFPOd/3/zdTh0z5EzhbM
/nLUad8Wwavl+W4yf56zOmRZNUqc+w==
=pdCb
-----END PGP SIGNATURE-----

--maebxxheapnwdayn--


--===============7307982323182902973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7307982323182902973==--

