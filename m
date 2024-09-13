Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C85FC6169
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2024 17:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvPJtJ7dQIih8Y0PCRA90TDdH6CqGNPrZw3ehZXL8Lw=; b=0KcWl5+132LX5rC5Z9vGL+DWA4
	nHGWlcgPqKBlhHlhEHgxbevbpgO3MLGcRbLIhX28jGzfyJ9pXeJL3UIt3lyBX7Zx7Cs6MXGOiSNKL
	ctndp/f76QxQw8SRVLR8eQRJWITPqxeOeDE31Ysq0o/diVUnDGogzQANRiVBw5nu6i7QJPqs/IX5i
	1GrxlxiliMGGdsDt47lwfRkEUPP4CMRTa2TA6vK4f3zsxOS2WIYK7JeO/WMdtdTVjf9UD/UP+xrOT
	ClZnQcMFx+TR3q4iQQZmpA4KOdqwk+FQUB95Ll6bT0qmI2StnZiIE30pNNKHYEFb9usvBR8jqH+96
	zdo8zmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spA15-0000000GeY9-3Smv;
	Fri, 13 Sep 2024 17:23:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spA12-0000000GeWk-1sKv;
	Fri, 13 Sep 2024 17:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00EB3A45714;
	Fri, 13 Sep 2024 17:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1B5C4CEC0;
	Fri, 13 Sep 2024 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726248207;
	bh=fuW1xLrho8ZyDrDvp5KKZrf25rnUr95/sDyzrJYGWrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m75UqRQWWxQp01qjARhuOIj1koH4iP0Z/IzXhjrfwrdVTmM7CT0ME4vGilO1Pk9s/
	 l7wq7xQnweGsXOIUNv8beN6zhA5shqaBX8YOpa3Kcwsi7KgLxRZIOBqodDugM1D/sk
	 VhmrsY86lrWyOOqKUg9pM9kRVx4zMHGP6eryiHfQazuud15bQMJ1a4n0sXXn307sia
	 onR5LtCFt1XiPTtFyYwWJrCyXEt9Y5V9qsbseC+2qCTtg/ThpPioUyVGjaBw1Bmoi5
	 TRrweKQW8xVX9MN5+vU1TMDbwQ3zU1FoFy4Veflw9w+WLB1GY6QIxhF0WG4VJGKSqi
	 nihueE8U/RYbw==
Date: Fri, 13 Sep 2024 18:23:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v4 3/5] dt-bindings: clock: axg-audio: document A1
 SoC audio clock controller driver
Message-ID: <20240913-drainpipe-retrial-0167665f605f@spud>
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
 <20240913121152.817575-4-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240913121152.817575-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_102328_567686_12B1EE8B 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7976919777713858737=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7976919777713858737==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jIzR0wEIk82J930S"
Content-Disposition: inline


--jIzR0wEIk82J930S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 03:11:50PM +0300, Jan Dakinevich wrote:
> Add device tree bindings for A1 SoC audio clock and reset controllers.
>=20
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jIzR0wEIk82J930S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuR1CgAKCRB4tDGHoIJi
0pvFAP9kr7mdO9xRNEDwdDAwPHjyoLrlCTzOaiy+CSVAUFoI3QEAvZcerXPm4xol
wOmsRIFe78YlrZGiXEc6w5Rk4pTHPgE=
=Vt66
-----END PGP SIGNATURE-----

--jIzR0wEIk82J930S--


--===============7976919777713858737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7976919777713858737==--

