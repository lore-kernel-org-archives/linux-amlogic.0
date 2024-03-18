Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477CEC54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp+i89GNgqYYxF6zUDsjfdtNbSZvq4yaQmTw8d4kNXQ=; b=sfXEfID82eCZl0sdswRFZVeyBn
	E1rX88X2NEQNZiT8MFhplXtnUYGckDgvFKyR0jwvgjX2/3zM46OlSCgwkWPqPybiVBo0R1WG4VYVh
	kdXyNdX9PTrUh2453hcbZWEfZluS4t2TPPL9YWITK2tO+RqHA/M8VpNh4ToPm5KOIz4grSKrljCJ/
	0027yBmK+RAf3lYbJ75ty14kBTd5CCLcpMAi0Y5EWb27DIke4XqjFr0M27aBg+HKtsYrjGenIgIdy
	3OJv6CfgErLS35t6svN0LQQDGNcY8JO2TM4nOHh3arjZ+b1maoImGlCk4x5iehCC1gHZbzuFnJGTi
	m658+E1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmDM2-00000008i6G-3oT1;
	Mon, 18 Mar 2024 13:48:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmDLz-00000008i5V-3Hbe;
	Mon, 18 Mar 2024 13:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1C0660C4B;
	Mon, 18 Mar 2024 13:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1095BC433F1;
	Mon, 18 Mar 2024 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710769718;
	bh=MHoHwr0eDPD5cgVd1+iwqRgWIVLOzhoSjzj/dQkgH/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKkpVxKxY7h9v+lH5UT2+3Yhzkji9Pqcx33yJYLYim45vOo92XuYMu+YsHi1ZhZwG
	 fc9Kinal7Gz43JO9X6EBtVPVJCa1KqGDeTMjMwSQb2cw9+nUNz28XZMOze6O1MLI0h
	 5KMZotzvi/hfqpFn29SDRG0ZiAYMYaMJMcyWl527F8xnrvyortoF9cxBPADf3dH1ek
	 XXUJlYYrGd9CKFAxhjwbp1ORhxlvSc9ZgcC8dEj2fdtNa6b3cfkExJIlFD+vZcTijm
	 M0lnpXAg63TlsHu/H9VvpHn83Ki149ZsnCePdDElv4ZWROEyOXFnYSWSNT6WCSeekd
	 QLkjCGvBD0jXA==
Date: Mon, 18 Mar 2024 13:48:31 +0000
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
Message-ID: <30dadd4c-de10-43a7-baf8-8ddd49f5c80e@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
 <5f8e8cd2-f9c4-4961-a85d-a0f3217294e6@sirena.org.uk>
 <c4c0e3a3-eaa8-42c6-bbd3-e5c6993dc63b@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <c4c0e3a3-eaa8-42c6-bbd3-e5c6993dc63b@salutedevices.com>
X-Cookie: Alaska:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_064840_136899_93E4244A 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: multipart/mixed; boundary="===============1815446771405070291=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1815446771405070291==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cWXPDKTXShavPzNA"
Content-Disposition: inline


--cWXPDKTXShavPzNA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 17, 2024 at 07:27:14PM +0300, Jan Dakinevich wrote:

> Both mic bias and ADC's input mode depends on schematics and should be
> configurable. What is the better way to give access to these parameters?
> Device tree?

Yes.

> >> +	SOC_SINGLE("ADC Mic Bias Switch", LINEIN_CFG, MICBIAS_EN, 1, 0),
> >> +	SOC_ENUM("ADC Mic Bias Level", a1_adc_mic_bias_level),

> > Why would micbias be user controlled rather than a DAPM widget as
> > normal?

> Yes, I could use SND_SOC_DAPM_SUPPLY, but it supports only raw values,
> and doesn't supports enums. Here, I want to use enum to restrict
> possible values, because only these values mentioned in the
> documentation that I have.

A supply is an on/off switch not an enum.  Users should not be selecting
values at all.

--cWXPDKTXShavPzNA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX4Ri4ACgkQJNaLcl1U
h9DTQAf+Ppr066CVfsvlN/xyNgCUEg1jqhI9r20Nh5lxtnjU+wC1Kcr+iobrATQM
TDOweMGu65tzuQZfO6T+CaB8UHXIAHKQStRrDMt60u8hvNbQ1WBBGcNpHZ4aEnH7
dha2+WYeSatRy9dWtHHuumkiG0oMZO93Q9agqdWm0p3dcF/kfp0UsgdfjFXbC0CZ
bF5SO0qaSh4sYzmkOWdsGn175ELpN2HMYaAL5R1kaS4QntznG3QCuLXxdOSy6/+7
SByMPu2j+jkFJTHfOQlYZZCDrgZ+czQ4gWszPQuk9LWDTYFrxajuRVwRKXew/GA8
Z0fuEs8wuIMGmSTEXpNJXc/IeEv+nw==
=YCeA
-----END PGP SIGNATURE-----

--cWXPDKTXShavPzNA--


--===============1815446771405070291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1815446771405070291==--

