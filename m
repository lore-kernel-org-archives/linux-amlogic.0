Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAFEC54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pRQDizTN/s7LgI0RjMXP0RSWQLnLDoz3PWSLMdyG00=; b=gK78tFVEf4BriXzAMcwSPmaPyt
	d+NBFmEdqrsPkzhw+DcqkNNY/IJm3BeBVwwCpv7YboCFLBlupb05xOJmatv9qGMDxEvpdFVyhVsvG
	GYzGlZ4YKAn3yntbN1cD585W4ccEQtMb/jxSB/fBXNGyxTw2V3m/sh/HQhfl3l/kfKsxeu5uarQqj
	RTxKQxfWlqovmpT3NDA21EZ/nsed11DGHwvnQy1HUZxEZitOAi+NFz+qtg/iXtkHJ8DHVCt4uYypi
	DMaKdLjUDoBNwrY+Q+D3Y9Sztsa6L+WRSkrN0EmW6zAcaCoV+gz6S0guDgKczSvW1qPKmAYrwXQoW
	RoZ3JkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmD4v-00000008fi1-3vOS;
	Mon, 18 Mar 2024 13:31:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmD4t-00000008fhM-06MI;
	Mon, 18 Mar 2024 13:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4182BCE0201;
	Mon, 18 Mar 2024 13:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5D9C433C7;
	Mon, 18 Mar 2024 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710768655;
	bh=9Fc4MdmLlXNEnOvlrkuX3SM2n8OiLdq3X0zd5LtujCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqclMs/DzIEOK7ZpEwUgIzoVU1UjeIdAZZQdx6vUjh0lzTWdigVBvpZmOlesultD5
	 JTkAUd9Pfse0PNMT4KOwhhsltIaS+gU5RreTQcUBhyH8ZHJTgjpgx7sqsN8RHuuveY
	 sNriNDMViTvF8HK/DqLXLbfe6iXTq9EnlQOhSCIQFdLdlUS6o/jl0HIK2dEoh32VzZ
	 h1n/0ieViBX9jibuxMJTowPxhqmHCzl01P8ZfrChyC/0CMImwwn7nOHfNCLVuDYe6x
	 nljETBFTEnkf8ghtUnwR69ixxtFuhvfglePyeZODASc98n15rwteIxYKNyJbpZVDqo
	 ZtXX5hnGlSU5A==
Date: Mon, 18 Mar 2024 13:30:42 +0000
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
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1 SoC
 family
Message-ID: <143bb232-1ba8-4e91-92a7-bab7c14f6df0@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
 <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
 <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
X-Cookie: Alaska:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_063059_321272_BF65E9A3 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Type: multipart/mixed; boundary="===============2392915502876803242=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2392915502876803242==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kjWorJl0TaUMqWHd"
Content-Disposition: inline


--kjWorJl0TaUMqWHd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 17, 2024 at 06:19:36PM +0300, Jan Dakinevich wrote:
> On 3/15/24 16:33, Mark Brown wrote:

> > If the maximum register is 0 how does the regmap have a stride?

> reg_stride inherited from existing code. Apparently, it was meaningless
> even before my modifications (the hardware has single register
> regardless of max_register declaration) and it should be dropped. But,
> is it okay to remove it in the same commit?

Sure.

--kjWorJl0TaUMqWHd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX4QgEACgkQJNaLcl1U
h9BLdQf/Zz1jN3+6EFmJI8/2S5KURnuXZVf/whz0eP6IHVV+novzn9bZzi9aDR8u
ivtJ5z3NMrKZpT3yKRb/iP42lcArTnbx8KtRbgkpBCvSW0xodc7pyVJqfkvIDPNg
ribamZQkNViB+vRZe+1M+lKpXGKZQT9VihxnkNjxjIBjjiDONfYP9zzHFNQorPlh
lZLfVCdNixkECtkZ8S2pC9SUMOTqVNHUNloEosl515koEkh5H3wWA4izpVAgFuCd
sAtcI63aM0UfO63qTzXy4qk4482W57UwJx6DuSSws6Y0DSjBpq7nw2gJw6MQb8SE
xTDZc6yggF0aEYdVMCor8vldLH2yxw==
=osK+
-----END PGP SIGNATURE-----

--kjWorJl0TaUMqWHd--


--===============2392915502876803242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2392915502876803242==--

