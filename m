Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD25C55171
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2026 00:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ/ufsqFxUy8R4ku1EJXHaQTVhyFwnDmRbe+Pygsoh0=; b=CASFWGi9ENJeBb0Pv/+EjSJl3m
	AlUQgQVvwyDKUQd4hsfYfic/tJ75d2DhPJZJWZturlZS9fWDxfr1w3FNj2P5qZ3s2z6oyT0zMnBVM
	S/DMscL9aAHJYmIjcYEMGwO5IdLqFA+3Qd9pVxVb1ic9EXpeQeNU7MTXQuTbDq/gOb6zoJUUf/0aX
	OYa+/l1iFLzYkvs7A8680lAMyMEwxBKn5sLxQ+EDrKG6alku8ovN7bKwZaDtcneGOC/1gJdC+9VA2
	NL9L3BOarUJM9sVd+2fCNgLhrSfK+Y1E619iSN+cBQOdWWXAXRvySDmrKRg6ZLDK2bTm8nUQPrNvk
	fZZM1Liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxaA-0000000DlJO-3m5J;
	Sat, 01 Aug 2026 00:28:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxaA-0000000DlJF-1Xin;
	Sat, 01 Aug 2026 00:28:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D82043854;
	Sat,  1 Aug 2026 00:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581E71F00AC4;
	Sat,  1 Aug 2026 00:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785544085;
	bh=zyvsI6uwawWAwqKjSXAVw9YoGBSiHEuDHThuZ+NSeOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y+Vin6ByVZPLXW+GbCCZjaOjIVxI7ftgZf/STQv0b85G55jywIfBpD4/f030DG3Yc
	 j1FxUnGqFQid+MUdFD/a0pOS/U+PctO+DMfZr8cLh4afbZn9CacShgSR3QwdnVlCm8
	 R6rEFNNuALz7bxx3j+uBxKHOYeR2w7AkyTHkTFf1a3SxYsv1fPYBU1krj+fDWrnUrw
	 poVIYxPUhscJLk+UgaGQeHJrRBAgydkQTvaarIcADBOltxKYTVXcMOlBhkv5TKM9W5
	 LwNfLKuLdSAy2HRfBEB015uJUN6XTJ/aqvf1pqtrLB2YJ1h/sv8gu0IefRheZhtWd6
	 2+zXe2aYg/fEA==
Date: Sat, 1 Aug 2026 01:28:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: linux-spi@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spifc: fix runtime PM leak on remove
Message-ID: <ac668d52-044e-4773-a536-aee93951b408@sirena.org.uk>
References: <20260609052647.5-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260609052647.5-1-ruoyuw560@gmail.com>
X-Cookie: No shirt, no shoes, no service.
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
Content-Type: multipart/mixed; boundary="===============2556123929634821741=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2556123929634821741==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tX5RgUt+OYfDuz3t"
Content-Disposition: inline


--tX5RgUt+OYfDuz3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 01:26:47PM +0800, Ruoyu Wang wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even when it
> returns an error. meson_spifc_remove() uses it to resume the controller
> before disabling runtime PM, but never drops the usage counter again.

This doesn't apply against current code, please check and resend.

--tX5RgUt+OYfDuz3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptPY8ACgkQJNaLcl1U
h9BRqQf+IrpsnI42a2rWBAeJKiqWSImUiBcS6q83yoQRO3kOZvi5o8sbchcevVTq
IvdhXV5EYlYNdzmRI24L8swk1FvKuX5ylFnd9W1D6uXzv7Ga0HqgWfn+El27e8e0
/h1NtaF3f6bzwKSCi9EFw2nRsIddiYbJaPH27kqj2Jhb0YhhaFNCYb8vN4gL7qu5
VYVfgJmroTAmLXVgdwcEkac89ixy4cH4sVELYw9c89kVTTnpv+MVEOQuggr9J5V5
4JtnvaYkHo+0hIcjFNg6Z4YJokkABi0bEN8HLxxXRHGzzUwmCE310JIEJfd8AvpC
k9F1tew+FhhK/RnvWm7nfSnWCu9HpQ==
=Q2v/
-----END PGP SIGNATURE-----

--tX5RgUt+OYfDuz3t--


--===============2556123929634821741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2556123929634821741==--

