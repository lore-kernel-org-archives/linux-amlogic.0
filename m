Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3158AEB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Shiw9j3GPspKjKB7wHpqV4H0yywoJdV7l9qI9Y4T3c=; b=wG2P/kI4/qKMkR1HVOkEuUtogK
	HifrIATwXMcXx0F+aBEzr7gqwegFXw2WSDRSjXz4HBdMfAuFnClFQ4VvB8BDaCbvDNsNLFa80V52a
	MPi3BtRCT54yvdA+ZZEbccRN0lhP8poZxT/JDKcYvO5ULE41aqbmJPVycT7Jg9X2lFvKqZzeeLGDk
	Oh2YnALIRvHZ3xFRGV6opXoeaU5JqPmhLmWHju5hbfTUpKJj1eyHk2In5Bd2dOjq+OCoR2c9DSnzP
	TqYmpQ33yh6nS3xDMUtDZHVJhGT3uG5xBQiDf7SFfZJ2cfJ1jEsJ7kEBLg+A+4vUe0WY9YCRa4ELI
	VZFtVt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIohF-00BQMi-0u;
	Mon, 10 Jul 2023 11:04:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIohB-00BQLl-2t;
	Mon, 10 Jul 2023 11:04:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E6AB60FD0;
	Mon, 10 Jul 2023 11:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D578C433C7;
	Mon, 10 Jul 2023 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688987084;
	bh=TwtuDKEbyYTJYwb5YfWy40545UzZJ3eX6HtXjCq2/DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1hoO4AmByvX1+/WmpbkKZwew5eudKc1FQfa/lRAOOwiXQ8zRshL+Oq9bFoJQeu7s
	 LcEcu9oephfIQANzA4/3cifEEgUeal19PEixt2fvddV8g2XCmGK0fFh3Uc4W+J5uOn
	 XEO983Rlb7MGqbsEKGjwJjCaRtJ44jxPCT5CF+Iau9ZSof+GY2neKJt0KjAvaY/9jd
	 RBqd+kDX18tFNSlYceBbrvR3r37PvxSvj3S5DjVmlQqBMkOMXeP2JrMR5z6F5rg6jE
	 qp2ogGv8JQb+t32ZmOV4oiKG0GwgxT5l0kEjeNVOqRmXVjkyf2EUtnmSnqitny5s3z
	 HoqJaUtvZLO7w==
Date: Mon, 10 Jul 2023 12:04:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedts.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 4/8] spi: Get rid of old SPI_MASTER_NO_.X and
 SPI_MASTER_MUST_.X
Message-ID: <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_040445_976167_15A629C0 
X-CRM114-Status: GOOD (  11.89  )
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
Content-Type: multipart/mixed; boundary="===============4140227999410781919=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4140227999410781919==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kWZTJCyyxQE+byGQ"
Content-Disposition: inline


--kWZTJCyyxQE+byGQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:

> Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> and kill the not used anymore definitions.

The above is not what this change does:

> -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

--kWZTJCyyxQE+byGQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSr5cIACgkQJNaLcl1U
h9Ah2wf+KmkGI9qlUKgHUSNXh1DbqoLxbTpYFnFP5xpasapdwBa05UYP3eghOigF
R9RLm+Z+cOhxpxkEijdYqYKOu94px87YE9vU9+e00ZWaz+X+R8C17kt4hk+9x5pI
n6ln7unk1TDzZww8TWx81WkEqR6E4uMcYhMfsfjKKDcC6ZOxJu6+h3wWjhkj8q35
k8NbtIo8bz2TzLqTuNjWsA64H1AxpRqwoT1fLLiZRPrng7Zc4wIP68cX17WSWwqj
+Tn8sO3EBbpYl4vuJircRmezY6Roo1TuLU4M7iIGhGoUrt+jdmoqIDsjQVU4IKIv
kRGC3WQT0+LuWsoU8vUp0PFt+ntu4w==
=03Nv
-----END PGP SIGNATURE-----

--kWZTJCyyxQE+byGQ--


--===============4140227999410781919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4140227999410781919==--

