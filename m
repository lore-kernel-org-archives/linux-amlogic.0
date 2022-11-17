Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFE8C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gW5ImMuxv+pOLLBYf06LV7nAYy2MjOIoRpIIYOgltzs=; b=wi81h20vA/1GtJJpSKFvk8h4AN
	+fqC2lS+oPfd4Uu4IGomY33OQdKZ7rzRXMBZOQmxtUTBBZcK59Tj4WqIZ1N7NGn3jPZcH1XzErFB3
	s3xfKjj+Y9O8f02V538h4qrpEKzb/9Vo3WVQsfUsJFUcx1o/fWq9tD/VG1Dv5PltoIdmu3L3OQMJh
	Sdo98/Vfv7dIQQR6vsj156s7Ck6SwH+JhjrLrrGBBjf1DjPd/8xHPRyICT1+Zqy2WpZaIQFv/tgZj
	DzO+l8KWW4hdiNuZ5huxIVWbvDCyBK5xZYx7wc6ZcRRiY0S0Vgj9eTtaMqF+igQNbujtTAvm+M2kV
	aA8BzKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovclp-00CyFq-5O; Thu, 17 Nov 2022 11:09:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovccd-00CsJU-Hg; Thu, 17 Nov 2022 10:59:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE96A60BA6;
	Thu, 17 Nov 2022 10:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C113CC433D6;
	Thu, 17 Nov 2022 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668682794;
	bh=FTcXBVf4xKuIE7vas46JjAXZsr5dkNSkrqRgK59BR3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3aCJYHiEH9yeDG4sHk7/Z9AsxDyOnRrOuUaaPmyFhDe4xZ7640/EoC+qQ21H+kXH
	 08J0YkV0AvOWwkIZgeORvNcR7+Thk9/gFhQ+j/07CgdiSiqgHT9sIkpbJnlNSmSYy7
	 F0s+Lkp/tCo9flUPLLLEOsKv77nTk0+dt8r9HQwPWNuFFrKmTl0g1PmuMnTR1dHuFK
	 +EIKV6Bz/yqgXNyld4b+aneK1HPLhq8HFjHJiNQnrXiCMqPg/W7GwFnmcAzJ9Q24D4
	 g/OdUB4RLlrAVnEBDmQqm2/TGfn+5SaqpKMM4hfxrlG03xxcvz/cnqRwwzEEYNWBF6
	 8Rz0l/MIOY8Kg==
Date: Thu, 17 Nov 2022 10:59:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	David Airlie <airlied@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
Message-ID: <Y3YUJjSTI9U9qz59@sirena.org.uk>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
X-Cookie: Ego sum ens omnipotens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_025955_654503_B12D5641 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Type: multipart/mixed; boundary="===============2913346145751894704=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2913346145751894704==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sVW5maJnbV5GYFNa"
Content-Disposition: inline


--sVW5maJnbV5GYFNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2022 at 09:47:41AM +0100, Carlo Caione wrote:
> On some hardware (reproduced on S905X) when a large payload is
> transmitted over SPI in bursts at the end of each burst, the clock line
> briefly fluctuates creating spurious clock transitions that are being
> recognised by the connected device as a genuine pulses, creating an
> offset in the data being transmitted.

> Lower the GPIO CS between bursts to avoid the clock being interpreted as
> valid.

This is just plain broken, *many* SPI devices attach meaning to
chip select edges - for example register writes will typically
have the register address followed by one or more register values
for sequential registers.  Bouncing chip select in the middle of
transfer will corrupt data.  If the device can't handle larger
transfers it needs to advertise this limit and refuse to handle
them.

--sVW5maJnbV5GYFNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN2FCYACgkQJNaLcl1U
h9BA1Af9GvKfza2vtRbu0JnM9pTzjygGkt+vf4n801Z7oafMH+9AsCMpa4yyr7Dq
zhMWNsKInloF+p+FGqJUx6iky4xR83YXfpR1dzXn9xh27MNjYMSvH9MgbDLKKPyZ
TG+uVFrFsaus8eR7mzZw80l7KCiw6ypiGWh5o+qtO7UWGCVnbcwl1NeD0RDolNE+
tmRoPMEoZohX3XIGL5NGihK0buq/ZFq4EkrpUK7mfJ5kHSCwtX7O4ZR4SUI2VB8g
WiLut2anQJ/MgXPdHnhKdrY47fwGRDi3TCI88Le+mb2gc3iUAf4r1rdqviUnMps7
6nf/3APDiJ0vw09mztpBv8KT1ASrrg==
=atc7
-----END PGP SIGNATURE-----

--sVW5maJnbV5GYFNa--


--===============2913346145751894704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2913346145751894704==--

