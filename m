Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E210C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A1j3OLvTdtJC+98gZoStA+79MoCWz2aOV2cyItnaeA=; b=YyT7dXbKy4r/UZn1RNmRb4UPtC
	UN8nQlXKW7+z3A7/U0XeLjBEOW2l44TdWDi0gBaquR1ccLVC2h5IGMmh8IKVsXVzoKXh+iRCEMEYK
	XEY9ljxG3zqIEhUt97OjsXmUu65QUowOMtEaxzA+cZPx8l9DnqU17qiziWKvtAhyuPIXpQU5hK5pk
	gfggAe1nS2xYdqZ2+T6e12LDOr4KT/U0/9E+Mby+DvdGoOLRKhpdAnVrYEEiP1X0/rjewjySrFxpc
	vjkYC42HsB4NCYFprxC9uB4aBj/ayqqF2mE0fsw9lI3VX/Eod5RXFcNDl3tnUvzXQ44f9l7jGXAaA
	eZLk6Tgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7k5-00000000LgJ-15jC;
	Fri, 15 Mar 2024 13:37:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7k2-00000000Lf1-1CBg;
	Fri, 15 Mar 2024 13:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4BC8ECE1D8A;
	Fri, 15 Mar 2024 13:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B990C433F1;
	Fri, 15 Mar 2024 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710509815;
	bh=mnKx/USIAWKFowB3UECi37soYZOTeSdjE7YC6dui0gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBikQgWFYtKFSQn7AJHJtgle7tDUdFM0GNQ/6JqxAf0lxH6kRfm2hxTIXdG5E6Egy
	 YAzTuwY1PjSj0ojy2bfIUYwcULJe3/38mYLHr+20Nw39reMae5OEJudFQOAYqJS1cG
	 mjHGzUI/L69hkyZrBEUsb8oCQhOHCT3JZQ44vfSkw/OskPHgcBcH2rCpWA6LWBCF5E
	 diWwtCdzYwAdPO346YhitMreYA0mq7RAR0VnKsuUT5V6yoGUgrZLjFm21Xpp4uFg52
	 3KzbWdPKyTbVDmpXxzm5MDzWsiHQEt7QAGwNh5hjZUGzrkEU44uZ9fAbLix7zN5tme
	 8jjsI9jEx/Dhw==
Date: Fri, 15 Mar 2024 13:36:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 12/25] ASoC: meson: t9015: add support for A1 SoC family
Message-ID: <5f8e8cd2-f9c4-4961-a85d-a0f3217294e6@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
X-Cookie: A well-known friend is a treasure.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_063658_704133_BCC17FF6 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: multipart/mixed; boundary="===============8394874743797435712=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8394874743797435712==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4AHceM7kGoMGggFJ"
Content-Disposition: inline


--4AHceM7kGoMGggFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 02:21:48AM +0300, Jan Dakinevich wrote:

> +static const char * const a1_adc_mic_bias_level_txt[] = { "2.0V", "2.1V",
> +	"2.3V", "2.5V", "2.8V" };
> +static const unsigned int a1_adc_mic_bias_level_values[] = { 0, 1, 2, 3, 7 };

Why would this be varied at runtime rather than being something fixed
when the system is designed?

> +static const char * const a1_adc_pga_txt[] = { "None", "Differential",
> +	"Positive", "Negative" };
> +static const unsigned int a1_adc_pga_right_values[] = { 0, PGAR_DIFF,
> +	PGAR_POSITIVE, PGAR_NEGATIVE };
> +static const unsigned int a1_adc_pga_left_values[] = { 0, PGAL_DIFF,
> +	PGAL_POSITIVE, PGAL_NEGATIVE };

Similarly here.

> +	SOC_SINGLE("ADC Mic Bias Switch", LINEIN_CFG, MICBIAS_EN, 1, 0),
> +	SOC_ENUM("ADC Mic Bias Level", a1_adc_mic_bias_level),

Why would micbias be user controlled rather than a DAPM widget as
normal?

--4AHceM7kGoMGggFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0Tu8ACgkQJNaLcl1U
h9B7RQf/eYxVKAjAigpYP4vgwBWRE/HosjdaaB5ogMo8PMSiXfacGnLx0ZtIpWa9
i6saOA5iW9E/n7Et4JpmJ0J/fYdN7d5TkSlgYGwYP/ojBAChias0hOS7f+fHKvdM
qH8C+20ovZC5RpNOZUjLmiwJ1WMJQrXgjYVTLpBHn23XPsf8fV3i+B5JEQzBJtXI
px2DiSaV2iQ+nBmrZQEQo7KnJsQiLahPLQgr81xq5322lUfLN0+kRHrNGnqMU/Aw
BW++2BV+mf6HXT8WKXrn2DeQByMpBN+jc7eeRDI7xIiB4iAWwpDL9Cn5HsSuYYvI
ZdU3lU/s6CaDa3e5AyxYVatZ42Rx4Q==
=sm4b
-----END PGP SIGNATURE-----

--4AHceM7kGoMGggFJ--


--===============8394874743797435712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8394874743797435712==--

